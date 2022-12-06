#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(ggplot2)

county_crime <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/NIBRS1220.csv")

county_crime_filtered <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  group_by(COUNTY) %>%
  summarize(COUNTY,
            INDEXYEAR,
            PRISON.TOTAL,
            PRISON.RATE,
  )

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/county-crime-WA.csv")

filtered <- data %>%
  arrange(TOTAL_CRIMES) %>%
  summarize(County, TOTAL_CRIMES)

highest_crime <- filtered %>%
  filter(TOTAL_CRIMES == max(TOTAL_CRIMES)) %>%
  pull(County)

lowest_crime <- filtered %>%
  filter(TOTAL_CRIMES == min(TOTAL_CRIMES)) %>%
  pull(County)



# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$plot1 <- renderPlot({
  ggplot(county_crime_filtered, 
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
  
  })
  
  output$plot2 <- renderPlot({
    ggplot(filtered, aes(x = TOTAL_CRIMES, y = reorder(County, -TOTAL_CRIMES))) +
        geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
        xlab("Number of Committed Crimes") +
        theme_bw() +
        labs(x = "Number of Crimes",
             y = "County",
             title = "Total Crimes in Each County in Washington State for the Year 2019")
  })

    })
