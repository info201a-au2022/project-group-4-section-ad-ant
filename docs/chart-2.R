#SECOND CHART

library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)

# SOURCE
county_crime <- read.csv("/Users/alyssalmt28/Documents/info201/project-group-4-section-ad-ant/data/NIBRS1220.csv")
View(county_crime)

# DATA WRANGLING

county_crime_filtered <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  )

county_crime_filtered_2012 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2012) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
            )

county_crime_filtered_2013 <- county_crime %>%
    filter(LOCATION == "COUNTY TOTAL") %>%
    filter(INDEXYEAR == 2013) %>%
    group_by(COUNTY) %>%
    summarize(COUNTY,
              INDEXYEAR,
              PRISON.TOTAL,
              PRISON.RATE,
    ) 
  
county_crime_filtered_2014 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2014) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

county_crime_filtered_2015 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2015) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

county_crime_filtered_2016 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2016) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

county_crime_filtered_2017 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2017) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

county_crime_filtered_2018 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2018) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

county_crime_filtered_2019 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2019) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

county_crime_filtered_2020 <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  filter(INDEXYEAR == 2020) %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  ) 

country_crime_filtered_average <- country_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  

# LIBRARY
library(ggplot2)
library(dplyr)

# plot
plot_v1 <- ggplot(county_crime_filtered, 
                  aes(x = INDEXYEAR, 
                      y = PRISON.RATE, 
                      fill = COUNTY)) +
  geom_area() + 
  facet_wrap(~COUNTY)
  facet_wrap
  