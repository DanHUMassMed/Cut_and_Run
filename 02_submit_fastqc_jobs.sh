#!/bin/bash
for job in jobs/02_fastqc/*.sh; do
  ./submit_short.sh "$job"
done