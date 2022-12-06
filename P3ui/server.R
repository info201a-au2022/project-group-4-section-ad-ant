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

    })

