#!/usr/bin/env bash
# Runs the full pipeline from the repository root and saves console output to outputs/.
#   bash run_all.sh
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p outputs/python outputs/r outputs/figures/python outputs/figures/r

# The dataset is committed; regenerate only if it is missing (fixed seed => identical file)
[ -f data/student_performance.csv ] || python data/generate_data.py

for f in python/topic*.py; do
  name=$(basename "$f" .py); echo ">> Python: $name"
  python "$f" > "outputs/python/$name.txt" 2>&1
done
for f in R/topic*.R; do
  name=$(basename "$f" .R); echo ">> R:      $name"
  Rscript "$f" > "outputs/r/$name.txt" 2>&1
done
echo "Done. Text outputs in outputs/python and outputs/r; figures in outputs/figures/."
