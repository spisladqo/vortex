import subprocess
import matplotlib.pyplot as plt
from dataclasses import dataclass, field
import pandas as pd
from tqdm import tqdm
from pathlib import Path
import re

# architecture parameters
@dataclass
class arch:
    warps: int
    cores: int
    threads: int
# running parameters 
@dataclass
class run:
    arch: arch
    perf: int
    kernel: str
    driver: str
    args: dict = field(default_factory=dict)

path_to_vortex = Path.cwd().parent.parent.parent
tile_size = 'TS'
work_per_thread = 'WPT'
width = 'WIDTH'

def error_running (run_params: run, error_text: str) -> str:
    return f"error running in {run_params.kernel} : warps={run_params.arch.warps} cores={run_params.arch.cores} threads={run_params.arch.threads}" \
         f" driver={run_params.driver} args=-N{run_params.args['N']} -M{run_params.args['M']} -K{run_params.args['K']} error message - {error_text}/n"

def error_verification (run_params: run, number_of_errors: str) -> str:
    return f"error in verifing results {run_params.kernel} : warps={run_params.arch.warps} cores={run_params.arch.cores} threads={run_params.arch.threads}" \
        f" driver={run_params.driver} args=-N{run_params.args['N']} -M{run_params.args['M']} -K{run_params.args['K']} Number of errors : {number_of_errors}'\n'"

def create_common_h (params: dict, kernel_name: str):
    file_name = f"{path_to_vortex}/tests/opencl/{kernel_name}/common.h"
    with open(file_name, 'w') as file:
        file.write("#ifndef COMMON_H\n" + "#define COMMON_H\n" + "\n")
        if tile_size in params:
            file.write(f"#define TS {params[tile_size]}\n")
        if work_per_thread in params:
            file.write(f"#define WPT {params[work_per_thread]}\n")
            file.write("#define RTS (TS/WPT)\n")
        if width in params:
            file.write(f"#define WIDTH {params[width]}\n")
        file.write('\n' +  "#endif // COMMON_H")
    # open main.cc file to recompile before run with new common.h
    Path(f"{path_to_vortex}/tests/opencl/{kernel_name}/main.cc").touch(exist_ok=True)

def perf (run_params: run, path_to_output_file: str) -> pd.DataFrame:
    # run kernel
    perf = f"--perf={run_params.perf}"
    vortex = f"--warps={run_params.arch.warps} --cores={run_params.arch.cores} --threads={run_params.arch.threads}"
    run_args = f"-N{run_params.args['N']} -M{run_params.args['M']} -K{run_params.args['K']}"
    command = f"cd {path_to_vortex}/build && ./ci/blackbox.sh {vortex} {perf} --driver={run_params.driver} --app={run_params.kernel} --args=\"{run_args}\""
    print(command)
    result = subprocess.run(f"{command} > {path_to_output_file}", shell=True)

    # collect statistic 
    with open(path_to_output_file, 'r') as file:
        lines = file.readlines()
    error_message = ""
    perf_stat = ""
    perf_dict = {}

    # matches all string currently starting with "PERF", such as
    # "core0: lmem reads=2134241" and "instrs=123, cycles=123, IPC=1.0"
    pattern =  r"(?:core\d+: )?([a-zA-Z0-9\.\-_+]+(?: [a-zA-Z0-9\.\-_+]+)*)=(\d+\.?\d*)"

    for line in lines:
        if not line.startswith("PERF:"):
            continue
        parts = line.split(',')
        for part in parts:
            matches = re.findall(pattern, part)
            for key, value in matches:
                perf_dict[key] = +float(value)
        # check for errors
        if result != 0:
            if "FAILED" in line: 
                error_message = error_verification(run_params, line[line.find("FAILED! - "):])
            if "Error" in line:
                error_message = error_running(run_params, line[line.find("Error:"):])
    
    # parse string with perf statistic of running kernel
    if perf_dict["cycles"] <= 0:
        error_message = error_running(run_params, "Invalid number of cycles")
    # write result to data frame
    run_result = pd.DataFrame([{"kernel": run_params.kernel[-1], "driver": run_params.driver, "cores": run_params.arch.cores, 
                "warps": run_params.arch.warps, "threads": run_params.arch.threads, "M": run_params.args["M"], 
                                "N": run_params.args["N"], "K": run_params.args["K"], "instrs": perf_dict["instrs"], "cycles": perf_dict["cycles"], "IPC": perf_dict["IPC"], "lmem reads": perf_dict["lmem reads"], "lmem writes": perf_dict["lmem writes"], "local memory requests": perf_dict["lmem reads"] + perf_dict["lmem writes"], "global memory requests": perf_dict["memory requests"], "error": error_message}])
    return run_result

def draw (data_frame: pd.DataFrame, x_label: str, y_label: str, title: str, path: str):
    data_frame.plot(kind = "bar", x = x_label, y = y_label)
    plt.title(title)
    plt.xlabel(x_label)
    plt.ylabel("Number of memory accesses")
    plt.savefig(path)

TILESIZE = 8
WORKPERTHREAD = 4
WIDTH = 4

# create common.h files for each kernel
params1 = {
    tile_size: TILESIZE
}
create_common_h(params1, "kernel1")
create_common_h(params1, "kernel2")

params3 = {
    tile_size: TILESIZE,
    work_per_thread: WORKPERTHREAD
}
create_common_h(params3, "kernel3")

params4 = {
    tile_size: TILESIZE,
    width: WIDTH 
}
create_common_h(params4, "kernel4")

# fill running params data class for each kernel
arg32 = {
    "M": 32,
    "N": 32,
    "K": 32
}
arg128 = {
    "M": 128,
    "N": 128,
    "K": 128
}

kernels = ["kernel1", "kernel2", "kernel3", "kernel4"]
drivers = ["simx", "rtlsim"]
args = [arg32, arg128]
arch_p = arch(threads=16, cores=2, warps=4)

j_stat_dir = f"{path_to_vortex}/tests/opencl/j_stat"
output_dir = f"{j_stat_dir}/outputs"
graphics_dir = f"{j_stat_dir}/graphics"
stats = ["local memory requests", "global memory requests"]

for arg in args:
    for driver in drivers:
        run_p = []
        for kernel in kernels:
            run_p.append(run(arch_p, kernel=kernel, driver=driver, args=arg, perf=2)) 
            
            if arg == arg32:
                n = 32
            elif arg == arg128:
                n = 128

            # run all kernels and collect statistic in data frame
            output_file = f"{output_dir}/output_{driver}_n{n}_{kernel}_TS{TILESIZE}_WPT{WORKPERTHREAD}_WID{WIDTH}.txt"
            data_frames = []
            for params in tqdm(run_p):
                data_frames.append(perf(params, output_file))
        
            data_frame = pd.concat(data_frames, ignore_index=True)

        # draw graph based on the recived statistic
        if driver == "simx":
            sim_type = "Cycle-approximate"
        elif driver == "rtlsim":
            sim_type = "RTL"

        draw(data_frame, "kernel", stats, f"Number of memory requests, {sim_type} simulation",
                f"{graphics_dir}/graph_{driver}_n{n}_TS{TILESIZE}_WPT{WORKPERTHREAD}_WID{WIDTH}.png")
