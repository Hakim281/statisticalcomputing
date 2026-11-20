# BIT 4131: Statistical Computing and Reporting (Group Work)

Combined topics, each implemented in **both Python and R** on one shared dataset.

| # | Topic | Python | R |
|---|---|---|---|
| 1 | Measures of central tendency and dispersion | `python/topic01_descriptive_statistics.py` | `R/topic01_descriptive_statistics.R` |
| 5 | Confidence intervals | `python/topic05_confidence_intervals.py` | `R/topic05_confidence_intervals.R` |
| 6 | Hypothesis testing | `python/topic06_hypothesis_testing.py` | `R/topic06_hypothesis_testing.R` |
| 7 | Correlation and covariance | `python/topic07_correlation_covariance.py` | `R/topic07_correlation_covariance.R` |
| 8 | Linear regression and least squares | `python/topic08_linear_regression.py` | `R/topic08_linear_regression.R` |
| 14 | Statistical data visualization | `python/topic14_statistical_visualization.py` | `R/topic14_statistical_visualization.R` |

The topics form one workflow: **describe** (1) → **visualize** (14) → **measure relationships** (7) → **quantify uncertainty** (5) → **test claims** (6) → **model and predict** (8).

## Where each requirement is covered

| Requirement | Location |
|---|---|
| 1. Theoretical explanation | [`docs/theory_and_math.md`](docs/theory_and_math.md) |
| 2. Mathematical formulation | [`docs/theory_and_math.md`](docs/theory_and_math.md) |
| 3. Worked example | Section **A** at the top of every script (small hand-checkable example, asserted against the library) |
| 4. Dataset analysis | Section **B** of every script |
| 5. Expected statistical output | `outputs/python/*.txt`, `outputs/r/*.txt`, summarised in [`docs/results_and_interpretation.md`](docs/results_and_interpretation.md) |
| 6. Interpretation of results | End of every script's output and [`docs/results_and_interpretation.md`](docs/results_and_interpretation.md); figures in `outputs/figures/` |

## Dataset

No suitable public dataset was chosen, so the brief's synthetic-data option is used. `data/generate_data.py` creates `data/student_performance.csv` (300 students, fixed seed 4131, fully reproducible):

| Column | Meaning |
|---|---|
| `gender`, `programme`, `tutoring` | categorical (programme: BIT / Computer Science / Statistics) |
| `study_hours_week`, `attendance_pct`, `sleep_hours`, `prior_gpa` | numeric predictors |
| `midterm_score`, `final_score` | outcomes (0 to 100) |

Final score is generated from a known linear model plus noise, so we can verify that regression recovers the true coefficients. **Findings describe this simulated cohort, not real students.**

## Run it

```bash
pip install -r requirements.txt          # Python 3.10+
Rscript install_r_packages.R             # R 4.x
bash run_all.sh                          # runs all 12 scripts, writes outputs/
```

Or run a single script from the repository root, e.g. `python python/topic08_linear_regression.py` or `Rscript R/topic08_linear_regression.R`. Scripts read `data/student_performance.csv` by relative path, so always run them from the repository root.

## Repository layout

```
data/        generate_data.py, student_performance.csv
python/      one script per topic
R/           one script per topic
docs/        theory_and_math.md, results_and_interpretation.md
outputs/     console output (python/, r/) and figures (figures/python, figures/r)
```

## Python and R agreement

Deterministic results (descriptive statistics, t-tests, correlations, regression coefficients, p-values) match across the two languages. Results that depend on random numbers (bootstrap intervals, coverage simulation, the regression hold-out split) differ slightly because the two languages use different random number generators.

## Team

| Member | Topics presented |
|---|---|
| Juakim | Topic 1 (Descriptive statistics), Topic 14 (Visualization), Topic 7 (Correlation and covariance) |
| Scalet | Topic 5 (Confidence intervals), Topic 6 (Hypothesis testing), Topic 8 (Linear regression) |

Both members worked on the dataset, the Python and R code, and the documentation.
