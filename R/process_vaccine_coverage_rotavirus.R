# ----------------------process_vaccine_coverage_rotavirus.R------------------------------------

# Install & load required libraries
# --------------------------------------------------------------------------
packages <- c("tidyverse")
install.packages(setdiff(packages, rownames(installed.packages())))
invisible(lapply(packages, library, character.only = TRUE))

# Set file location relative to current project
# --------------------------------------------------------------------------
here::i_am("R/process_vaccine_coverage_rotavirus.R")

# Read vaccine_coverage_rotavirus.csv from `data-raw` folder. 
# Clean and filter for only needed rows/columns.
# --------------------------------------------------------------------------
process_vaccine_coverage_rotavirus <- function() {
  
  read_path <- here("data-raw/vaccine_coverage_rotavirus.csv")
  df_raw <- read.csv(read_path)
  
  df_processed <- df_raw %>% 
                  filter(Geography.Type=="States/Local Areas") %>%
                  filter(Dimension.Type=="Age") %>%
                  filter(Birth.Year.Birth.Cohort=="2020-2021") %>%
                  filter(
                    (Vaccine=="Rotavirus" & Dimension=="8 Months")
                  ) %>%
                  filter(!(Geography %in% 
                             c("PA-Philadelphia",
                               "PA-Rest of state",
                               "IL-City of Chicago",
                               "IL-Rest of state",
                               ))
  
  # Write data as a csv called vaccine_coverage_rotavirus.csv to the project `data` folder
  write_path <- here("data/vaccine_coverage_rotavirus.csv")
  write.csv(df_processed, file = write_path)
  
}