#!/bin/sh -v

OUTPUT_FILE="perf_custom_kernels.txt"
START_KERNEL_NUM=1
END_KERNEL_NUM=4

rm -rf $OUTPUT_FILE
for ((i=START_KERNEL_NUM;i<=END_KERNEL_NUM; i++)); do
	for arg in "-n32" "-n128"; do
		for perf in "1" "2"; do
			for driver in "rtlsim" "simx"; do
				echo;
				echo "Kernel$i, $driver, perf=$perf, args=$arg" | tee -a $OUTPUT_FILE;
				./ci/blackbox.sh --app=kernel$i --driver=$driver --perf=$perf --args=$arg >> $OUTPUT_FILE
			done
		done
	done
done

