#!/bin/bash

# Get the data from Dropbox
data_remote="${1:-arjamand}"
data_local="${2:-data/fastq}"

# Set the IFS to the backslash character
IFS="/"

# Get the directories to be copied
directories=()
for exp_dir in `rclone lsf --dirs-only remote:"${data_remote}"| tr -d '\n'`;
do
    directories+=($exp_dir)
    echo "$exp_dir"
    
done
length=${#directories[@]}

# Reset the IFS to its default value (space)
IFS=" "

# Iterate over the directories and provide the time it takes to copy
# also provide info on the number of files to copy and how many have been copies so far
counter=0
for exp_dir in "${directories[@]}";
do
    (( counter++ ))
    if [[ -n $(rclone -R --files-only lsf "remote:${data_remote}/${exp_dir}" | grep -E '\.fastq\.gz$|\.fq\.gz$') ]]; then
        echo "Directory ${exp_dir} contains fastq.gz or fq.gz files. Initiating copy..."

        echo copying ${exp_dir} which is $counter of $length
        start_time=$(date +%s) 
        rclone copy "remote:${data_remote}/${exp_dir}" "${data_local}/${exp_dir}"
        end_time=$(date +%s) 
        execution_time=$((end_time - start_time))

        # Calculate minutes and seconds
        minutes=$((execution_time / 60))
        seconds=$((execution_time % 60))
        echo "Execution time: $minutes minutes and $seconds seconds"
    else
        echo "Directory ${exp_dir} does not contains fastq.gz or fq.gz files."
    fi
done

# Check if fastq files are placed in the root directory
# If so copy all file in the root but not subdirectories
if [[ -n $(rclone lsf "remote:${data_remote}" | grep -E '\.fastq\.gz$|\.fq\.gz$') ]]; then
    echo "Root Directory contains fastq.gz or fq.gz files. Initiating copy..."
    rclone copy "remote:${data_remote}" "${data_local}"
fi

