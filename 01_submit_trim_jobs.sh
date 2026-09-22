#!/bin/bash
for job in jobs/01_trim/*.sh; do
  ./submit_short.sh "$job"
done