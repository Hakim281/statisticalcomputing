# Installs every R package the scripts need. Run once:  Rscript install_r_packages.R
pkgs <- c("dplyr", "ggplot2", "psych", "car", "broom", "corrplot", "Hmisc", "rstatix", "boot")
missing <- pkgs[!pkgs %in% rownames(installed.packages())]
if (length(missing)) install.packages(missing, repos = "https://cloud.r-project.org")
cat("All required R packages are installed.\n")
