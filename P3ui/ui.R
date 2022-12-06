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

# Define UI for application that draws a histogram

intro_page <- tabPanel("Introduction",
                       titlePanel("WAC: Washington Crime!"))

plot1 <- tabPanel("Plot 1",
                  titlePanel("Plot1"),
                  plotOutput("plot1"))

plot2 <- tabPanel("Plot 2",
                  titlePanel("Plot2"))

plot3 <- tabPanel("Plot 3",
                  titlePanel("Plot 3"),
                  plotOutput("plot2"))
      
ui <- navbarPage(
  "Washington Crime!",
  intro_page,
  plot1,
  plot2,
  plot3
)