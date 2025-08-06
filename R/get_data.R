# ----------------------get_data.R------------------------------------

# Install & load required libraries
# --------------------------------------------------------------------------
packages <- c("here","tidycensus","tidyverse")
install.packages(setdiff(packages, rownames(installed.packages())))
invisible(lapply(packages, library, character.only = TRUE))

# Set file location relative to current project
# --------------------------------------------------------------------------
here::i_am("R/get_data.R")

# Source functions
# --------------------------------------------------------------------------
source(here("R/get_states.R"))

data <- read.csv('https://data.cdc.gov/api/views/fhky-rtsk/rows.csv?accessType=DOWNLOAD&api_foundry=true')
data

# Create function get_states by calling the census ACS API from tidycensus
# --------------------------------------------------------------------------
get_states <- function() {
  
  df <- get_acs(geography = "state", 
                variables = "B01001_001",
                year = 2020, 
                geometry = FALSE) %>% 
    select(GEOID, NAME) %>% 
    rename(state_fips_code = GEOID,
           state_name = NAME)
  
  return (df)
  
}