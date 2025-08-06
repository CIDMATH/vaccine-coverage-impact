# ----------------------get_states.R------------------------------------

# Install & load required libraries
# --------------------------------------------------------------------------
packages <- c("tidycensus","tidyverse","here")
install.packages(setdiff(packages, rownames(installed.packages())))
invisible(lapply(packages, library, character.only = TRUE))

# Set file location relative to current project
# --------------------------------------------------------------------------
here::i_am("R/get_states.R")

# Create function get_states by calling the census ACS API from tidycensus
# --------------------------------------------------------------------------
get_states <- function() {
  
  # Get data from Census ACS (since we are just getting state info, 2020 is fine)
  df <- get_acs(geography = "state", 
                variables = "B01001_001",
                year = 2020, 
                geometry = FALSE) %>% 
        select(GEOID, NAME) %>% 
        rename(state_fips_code = GEOID,
               state_name = NAME)
  
  # Write data as a csv called states.csv to the project `data` folder
  write_path <- here("data/states.csv")
  write.csv(df, file = write_path)
  
  # Message specifying where data was written
  return(paste0("Saved state data to ",write_path))
  
}