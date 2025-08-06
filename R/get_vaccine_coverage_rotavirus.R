# ----------------------get_vaccine_coverage_rotavirus.R------------------------------------

# Install & load required libraries
# --------------------------------------------------------------------------
packages <- c("tidyverse","here")
install.packages(setdiff(packages, rownames(installed.packages())))
invisible(lapply(packages, library, character.only = TRUE))

# Set file location relative to current project
# --------------------------------------------------------------------------
here::i_am("R/get_vaccine_coverage_rotavirus.R")

# Create function get_vaccine_coverage_rotavirus.R sourcing data from CDC NIS-Child ChildVaxView
# --------------------------------------------------------------------------
get_vaccine_coverage_rotavirus <- function() {
  
  # Read childvaxview vaccine data csv from data.cdc.gov
  df <- read.csv("https://data.cdc.gov/api/views/fhky-rtsk/rows.csv?accessType=DOWNLOAD&api_foundry=true")
  
  # Write data as a csv called vaccine_coverage_rotavirus.csv to the project `data-raw` folder
  write_path <- here("data-raw/vaccine_coverage_rotavirus.csv")
  write.csv(df, file = write_path)
  
  # Message specifying where data was written
  return(paste0("Saved rotavirus vaccine coverage data to ",write_path))
  
}