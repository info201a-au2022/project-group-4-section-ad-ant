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
library(plotly)

wa_cities <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/sorted-WA-cities.csv")
county_crime <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/NIBRS1220.csv")

county_crime_filtered <- county_crime %>%
  filter(LOCATION == "COUNTY TOTAL") %>%
  group_by(COUNTY) %>%
  summarize("COUNTY" = COUNTY,
            "YEAR" = INDEXYEAR,
            "PRISON_RATE" = PRISON.RATE,
  )

data <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/county-crime-WA.csv")


# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$plot1 <- renderPlotly({
    plot_data <- county_crime_filtered %>% 
      filter(COUNTY %in% input$county_select) %>% 
      filter(YEAR <= input$year_range[2] & YEAR >= input$year_range[1])
    plot_ly(data = plot_data, x = ~YEAR,
            y = ~PRISON_RATE, type = 'scatter', mode = 'lines', color = ~COUNTY) %>%
      layout(
        yaxis = list(rangemode = "tozero")) %>%
      layout(
        yaxis = list(title = list(text = 'Prison Rate'))) %>%
      layout(
        xaxis = list(title = list(text = 'Year')))
  
      
  })
  
  output$chooseCounty <- renderUI({
    selectInput("county_select",
                h3("County"),
                choices = unique(county_crime_filtered$COUNTY))
    
  })
  
  output$chooseYear <- renderUI({
    sliderInput("year_range",
                h3("Year"),
                min = min(county_crime_filtered$YEAR, na.rm = TRUE),
                max = max(county_crime_filtered$YEAR, na.rm = TRUE),
                value = c(2012, 2020),
                sep = "",
                step = 1)
  })

  
  output$crimestotal <- renderPlotly({
    ggplot(data, aes(x = TOTAL_CRIMES, y = reorder(County, -TOTAL_CRIMES))) +
        geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
        xlab("Number of Committed Crimes") +
        theme_bw() +
        labs(x = "Number of Crimes",
             y = "County",
             title = "Total Crimes in Washington State for the Year 2019")
  
  })
  
  output$rape <- renderPlotly({
    ggplot(data, aes(x = Rape, y = reorder(County, -Rape))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Rape",
           y = "Counties",
           title = "Committed Rape Crimes in Washington State for the Year 2019")
  })
  
  output$violent <- renderPlotly({
    ggplot(data, aes(x = Violent_crime, y = reorder(County, -Violent_crime))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Violent Crimes",
           y = "Counties",
           title = "Committed Violent Crimes in Washington State for the Year 2019")
  })
  
  output$robbery <- renderPlotly({
    ggplot(data, aes(x = Robbery, y = reorder(County, -Robbery))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Robberies",
           y = "Counties",
           title = "Committed Robberies in Washington State for the Year 2019")
  })
  
  output$murder <- renderPlotly({
    ggplot(data, aes(x = Murder, y = reorder(County, -Murder))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Murders",
           y = "Counties",
           title = "Committed Murders in Washington State for the Year 2019")
  })
  
  output$assault <- renderPlotly({
    ggplot(data, aes(x = Aggravated_assault, y = reorder(County, -Aggravated_assault))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Aggravated Assault",
           y = "Counties",
           title = "Committed Aggravated Assaults in Washington State for the Year 2019")
  })
  
  output$prop <- renderPlotly({
    ggplot(data, aes(x = Property_crime, y = reorder(County, -Property_crime))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Property Crimes",
           y = "Counties",
           title = "Committed Property Crimes in Washington State for the Year 2019")
  })
  
  output$burglary <- renderPlotly({
    ggplot(data, aes(x = Burglary, y = reorder(County, -Burglary))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Burglaries",
           y = "Counties",
           title = "Committed Burglaries in Washington State for the Year 2019")
  })
  
  output$larceny <- renderPlotly({
    ggplot(data, aes(x = Larceny, y = reorder(County, -Larceny))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Larceny",
           y = "Counties",
           title = "Committed Larcernies in Washington State for the Year 2019")
  })
  
  output$motor <- renderPlotly({
    ggplot(data, aes(x = Motor_vehicle_theft, y = reorder(County, -Motor_vehicle_theft))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Motor Vehicle Theft",
           y = "Counties",
           title = "Committed Motor Vehicle Theft in Washington State for the Year 2019")
  })
  
  output$arson <- renderPlotly({
    ggplot(data, aes(x = Arson, y = reorder(County, -Arson))) +
      geom_bar(stat="identity", fill="#f68060", alpha=.6, width=.6) +
      theme_bw() +
      labs(x = "Number of Arson",
           y = "Counties",
           title = "Committed Arsons in Washington State for the Year 2019")
  })
  
  output$chooseCounty1 <- renderUI({
    selectInput("county_select1",
                h3("Type of Crime"),
                choices = list("Total", "Violent Crimes", "Murder", "Rape", "Robbery", "Assault",
                               "Property Crime", "Burglary", "Theft", "Motor Vehicle Theft",
                               "Arson"))
  })
  
  output$chooseCity <- renderUI({
    selectInput("city_select",
                h3("City"),
                choices = unique(wa_cities$state), 
                multiple = TRUE)
    
  })
  
  output$plot3 <- renderPlotly({
    wa_cities %>% 
      summarize(
        State = state,
        SAFETY_SCORE = safetyScore
      ) %>%
      filter(State %in% input$city_select) %>% 
      plot_ly(x = ~State,
              y = ~SAFETY_SCORE,
              type = 'bar') %>%
      layout(yaxis = list(title = list(text = 'Safety Score')))
      
  })
  
  output$plot4 <- renderPlotly({
    plot_ly(wa_cities, x= ~safetyScore, y= ~state, type = 'scatter', 
            color = ~safetyScore, size = ~safetyScore, width = 1400) %>% 
      layout(yaxis = list(title = list(text = 'State'))) %>% 
      layout(xaxis = list(title = list(text = 'Safety Score'))) %>% 
      layout(legend = list(title = list(text = 'Safety Score')))
  })

})

