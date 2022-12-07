#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

#https://alyssa2828.shinyapps.io/P3ui/

library(shiny)
library(plotly)

# Define UI for application that draws a histogram

intro_page <- tabPanel("Introduction",
                       titlePanel("WAC: Washington Crime!"),
                       p("Be Safe with WAC by knowing the safety status in Washington Area!"),
                       h1("Introduction"))

plot1 <- tabPanel("Plot 1",
          titlePanel("Plot1"),
          sidebarPanel(
                uiOutput("chooseCounty"),
                uiOutput("chooseYear")),
          mainPanel(
                  plotlyOutput("plot1"),
                  plotlyOutput("densityplot"))
                  )

plot2 <- tabPanel("Plot 2",
                  titlePanel("Plot2"), 
                  plotOutput("plot2"))

plot3 <- tabPanel("Plot 3",
                  titlePanel("Plot 3"),
                  plotlyOutput("plot3"))
      
summ <- tabPanel("Summary",
                 titlePanel("Summary"))

report <- tabPanel("Report",
                   titlePanel("Report"))
ui <- navbarPage(
  "Washington Crime!",
  intro_page,
  plot1,
  plot2,
  plot3,
  summ,
  report
)