#!/bin/bash
REMOTE_DIR="remote:Walker_lab_shared/Bioinformatics_parent/cut_run040226"

#SOURCE_DIR="./results/03_align"
#rclone copy -P -vv "${SOURCE_DIR}" "${REMOTE_DIR}/03_align/" --include "*.sam"

SOURCE_DIR="./results/04_dedup"
rclone copy -P -vv "${SOURCE_DIR}" "${REMOTE_DIR}/04_dedup/" --include "*.txt"

# SOURCE_DIR="./results/07_ucsc"
# FILE_1="26087FL-01-01-01_S4_L007/26087FL-01-01-01_S4_L007.ucsc.bedGraph.gz"
# FILE_2="26087FL-01-01-04_S7_L007/26087FL-01-01-04_S7_L007.ucsc.bedGraph.gz"
# FILE_3="26087FL-01-01-02_S5_L007/26087FL-01-01-02_S5_L007.ucsc.bedGraph.gz"
# FILE_4="26087FL-01-01-03_S6_L007/26087FL-01-01-03_S6_L007.ucsc.bedGraph.gz"

# rclone copy -P -vv "${SOURCE_DIR}/${FILE_1}" "${REMOTE_DIR}/07_ucsc/"
# rclone copy -P -vv "${SOURCE_DIR}/${FILE_2}" "${REMOTE_DIR}/07_ucsc/"
# rclone copy -P -vv "${SOURCE_DIR}/${FILE_3}" "${REMOTE_DIR}/07_ucsc/"
# rclone copy -P -vv "${SOURCE_DIR}/${FILE_4}" "${REMOTE_DIR}/07_ucsc/"

# SOURCE_DIR="./results/05_mapq_filter"
# FILE_1="26087FL-01-01-01_S4_L007_PicardDedup_mapqfilt.sam"
# FILE_2="26087FL-01-01-02_S5_L007_PicardDedup_mapqfilt.sam"
# FILE_3="26087FL-01-01-03_S6_L007_PicardDedup_mapqfilt.sam"
# FILE_4="26087FL-01-01-04_S7_L007_PicardDedup_mapqfilt.sam"

# rclone copy -P -vv "${SOURCE_DIR}/${FILE_1}" "${REMOTE_DIR}/05_mapq_filter/"
# rclone copy -P -vv "${SOURCE_DIR}/${FILE_2}" "${REMOTE_DIR}/05_mapq_filter/"
# rclone copy -P -vv "${SOURCE_DIR}/${FILE_3}" "${REMOTE_DIR}/05_mapq_filter/"
# rclone copy -P -vv "${SOURCE_DIR}/${FILE_4}" "${REMOTE_DIR}/05_mapq_filter/"

# SOURCE_DIR="./results/02_fastqc"
# rclone copy -P -vv "${SOURCE_DIR}" "${REMOTE_DIR}/02_fastqc/" --include "*.html"

#rclone copy -P -vv "./md5_report.html" "${REMOTE_DIR}/02_fastqc/"

#rclone copy -P -vv "./CUT_RUN_analysis_pipeline.pdf" "${REMOTE_DIR}/00_overview/"
