#!/usr/bin/env bash

set -e

DATA_DIR="data/fastq"
TRIM_SCRIPT="01_adapter_trimming.sh"
JOB_DIR="jobs/01_trim"

mkdir -p "$JOB_DIR"

# Loop over all R1 files (handles .fastq.gz and .fq.gz)
for R1 in "$DATA_DIR"/*_R1_*.f*q.gz; do
    # Derive R2
    R2="${R1/_R1_/_R2_}"

    # Check pair exists
    if [[ ! -f "$R2" ]]; then
        echo "WARNING: Missing pair for $R1, skipping"
        continue
    fi

    # Extract sample name
    BASENAME=$(basename "$R1")
    SAMPLE=${BASENAME%_R1_*}

    # Job script path
    JOB_SCRIPT="$JOB_DIR/job_${SAMPLE}.sh"

    # Create job script
    cat << EOF > "$JOB_SCRIPT"
#!/usr/bin/env bash
set -e

./$TRIM_SCRIPT "$R1" "$R2"
EOF

    chmod +x "$JOB_SCRIPT"

    echo "Created $JOB_SCRIPT"
done

echo
echo "All job scripts created in: $JOB_DIR"
echo "Submit later with:"
echo "  ./submit_short.sh <job_script>"