#SECOND CHART

library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)

# SOURCE
county_crime <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/NIBRS1220.csv")
View(county_crime)

# LIBRARY
library(ggplot2)
library(dplyr)

# plot
plot_v1 <- function (df=county_crime_filtered) {ggplot(county_crime_filtered, 
                                                       aes(x = INDEXYEAR, 
                                                           y = PRISON.RATE, 
                                                           fill = COUNTY)) +
    geom_area() + 
    facet_wrap(~COUNTY) +
    labs(
      x = "Year",
      y = "Prison Rate",
      title = "Prison Rate in Washington Counties from 2012-2020",
    )
}


plot_v1()

# DATA WRANGLING

county_crime_filtered <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  )


earliest_record <- county_crime_filtered[1, 2]

latest_record <- county_crime_filtered[8, 2]

number_of_counties <- county_crime_filtered %>%
  filter(INDEXYEAR == 2020) %>%
  summarize(COUNTY) %>%
  nrow()

lowest_prison_rate <- county_crime_filtered %>%
  filter(PRISON.RATE == 0) %>%
  pull(COUNTY)

highest_prison_rate <- county_crime_filtered %>%
  filter(PRISON.RATE > 35) %>%
  pull(COUNTY)



