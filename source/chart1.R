# Example: Project Data Access Functions  ----
#----------------------------------------------------------------------------#
# These functions are used to access data sources ... 
#----------------------------------------------------------------------------#
library(tidyverse)
library(dplyr)
library(stringr)
library(ggplot2)


# CHART #2
# SOURCE
county_crime <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/NIBRS1220.csv")
View(county_crime)


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

#CHART 3
data <- read.csv("county-crime-WA.csv")

filtered <- data %>%
  arrange(TOTAL_CRIMES) %>%
  summarize(County, TOTAL_CRIMES)

# PLOT
plot1 <- function (df = filtered) {
  ggplot(filtered, aes(x = TOTAL_CRIMES, y = reorder(County, -TOTAL_CRIMES))) +
    geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
    xlab("Number of Committed Crimes") +
    theme_bw() +
    labs(x = "Number of Crimes",
         y = "County",
         title = "Total Crimes in Each County in Washington State for the Year 2019")
}

plot1()



# load .csv into variable 
wa_cities <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/sorted-WA-cities.csv")

# function to plot the relation of Safety Score's to cities (scatterplot)
plot_wa <- function (df = wa_cities) {
  ggplot(df, aes(x = safetyScore, y = fct_reorder(state, safetyScore, .fun = mean))) +
    geom_point() + geom_vline(xintercept=0, color = "red", linewidth=1) + theme_minimal() + 
    xlab("Safety Score") + ylab("Cities (Pop. > 10,000)") + 
    ggtitle("Safest Cities in Washington") 
}

safest_city <- wa_cities[2,2]


