library(httr)
library(readxl)
library(dplyr)

url <- "https://www.ahrq.gov/sites/default/files/wysiwyg/sdoh/SDOH_2020_COUNTY_1_0.xlsx"

# download ONCE
res <- httr::GET(
  url,
  httr::add_headers(
    `User-Agent` = "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0 Safari/537.36",
    Referer = "https://www.ahrq.gov/sdoh/data-analytics/sdoh-data.html"
  )
)
stop_for_status(res)

tmp <- tempfile(fileext = ".xlsx")
writeBin(content(res, "raw"), tmp)

# read both sheets
sdoh_data   <- read_excel(tmp, sheet = "Data")
sdoh_layout <- read_excel(tmp, sheet = "Layout")

unlink(tmp)

# ---- data wrangling for lab ----
analysis <- sdoh_data %>%
  transmute(
    state                       = STATE,
    county                      = COUNTY,
    income_less_10k             = as.numeric(ACS_PCT_HH_INC_10000),
    income_10k_15k              = as.numeric(ACS_PCT_HH_INC_14999),
    income_15k_25k              = as.numeric(ACS_PCT_HH_INC_24999),
    income_25k_50k              = as.numeric(ACS_PCT_HH_INC_49999),
    income_50k_100k             = as.numeric(ACS_PCT_HH_INC_99999),
    income_greater_100k         = as.numeric(ACS_PCT_HH_INC_100000),
    drug_death_rate             = as.numeric(CDCW_DRUG_DTH_RATE),
    poverty_rate                = as.numeric(SAIPE_PCT_POV),
    snap_poverty_households     = as.numeric(ACS_PCT_HH_FOOD_STMP_BLW_POV),
    unemployment_rate           = as.numeric(ACS_PCT_UNEMPLOY),
    uninsured_rate              = as.numeric(ACS_PCT_UNINSURED),
    income_inequality_index     = as.numeric(ACS_GINI_INDEX),
    median_household_income     = as.numeric(ACS_MEDIAN_HH_INC),
    long_commute_share          = as.numeric(ACS_PCT_COMMT_60MINUP),
    mental_health_provider_rate = as.numeric(CHR_MENTAL_PROV_RATE)
  ) %>%
  filter(
    !is.na(poverty_rate),
    !is.na(drug_death_rate)
  )

str(analysis)
summary(analysis$poverty_rate)
summary(analysis$drug_death_rate)

