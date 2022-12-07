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
library(shinyWidgets)
install.packages("shinythemes")
library(shinythemes)

# Define UI for application that draws a histogram

intro_page <- tabPanel("Introduction",
                       titlePanel("WAC: Washington Crime!"),
                       p("We observed that the neighborhood has been overrun with violence throughout the first few weeks of the quarter. 
                         There is currently no overarching framework or body of information that addresses the problem of minimizing the 
                         number of victims brought on by common crimes. Since safety is one of our core human rights and requirements, this 
                         is significant. We aim to do this as informatics students by putting what we've learned in class to use in a unique 
                         way. Starting in the state of Washington, our aim is to decrease the number of victims caused by these crimes. 
                         To accomplish this, we intend to compile information on recorded crimes in and surrounding each county in Washington 
                         from the official government website. These offenses include of burglary, shootings, vandalism, assault, and more. 
                         The public is then given data on the safety score of the area they are in, the incarceration rate, and the most common 
                         types of crime so they may make an educated decision about avoiding particular places with poor safety scores."),
)
                       #h1("Introduction"))

plot1 <- tabPanel("Prison Rate",
          titlePanel("Prison Rate across Washington Counties"),
          sidebarPanel(
                uiOutput("chooseCounty"),
                uiOutput("chooseYear")),
          mainPanel(
                  plotlyOutput("plot1")
                  )
                )

plot2 <- tabPanel("Crimes",
                  titlePanel("Crimes in WA"), 
                  sidebarPanel(
                    uiOutput("chooseCounty1")),
                  mainPanel(
                    plotlyOutput("crimestotal"))
                  )

plot3 <- tabPanel("Safe Cities",
                  titlePanel("Safety Level of Cities across Washington State"),
                  sidebarPanel(
                    uiOutput("chooseCity")),
                  mainPanel(
                    plotlyOutput("plot3")),
                  titlePanel("Safest Cities in Washington"),
                  mainPanel(
                    plotlyOutput("plot4"))
                  )

      
summ <- tabPanel("Summary",
                 titlePanel("Summary"))

report <- tabPanel("Report",
                   titlePanel("WAC Report"),
                   h3("Project Code"),
                   p("WAC (Washington Crime)"),
                   h3("Project Title"),
                   p("Be Safe with WAC by knowing the safety status prediction in Washington Area!"),
                   h3("Authors"),
                   p("Alyssa Limit (alimit28@uw.edu) | Nathan Narayana | Thomas Emnetu"),
                   h3("Affiliations"),
                   p("INFO 201: Foundational Skills for Data Science - The Information School - University of Washington"),
                   h3("Abstract"),
                   p("As we looked into the crime rate in the USA, we wondered why it's absurdly high. 
                   Then we ask ourselves, 'If people can open their weather app to understand the weather status in an area, 
                   why isn't there a crime app informing the safety status of an area we're in?'. Thus, our crew creates WAC 
                   (Washington Crime), an integrated platform that tells us the area safety status in based on safety score, 
                   prison rate, and common type of crime in an area to address the problem."),
                   h3("Keywords"),
                   p("write here"),
                   h3("Introduction"),
                   p("During the first few weeks of the quarter, we noticed that the community has been swamped with violence. 
                   There has been no sort of general system or data that tackles the issue of reducing victims caused by common crimes. 
                   This is important as our basic rights and needs as humans have the right to their safety. As informatics students, we 
                   try to accomplish this through our way of using knowledge learned in the class. Our goal is to reduce the number of victims 
                   from these criminal acts starting within the state of Washington. We plan to do this by collecting a set of data from the 
                   official government website of reported crimes around each county in Washington. These crimes include theft, shootings, 
                   vandalism, assault, and many more. We then proceed to analyze and present the data to the public of the safety score of area 
                   they are in, prison rate, and common type of crime so they can make informed decision in avoiding certain areas with low safety 
                   score. The summary of the data will be presented on a website."),
                   h3("Problem Domain"),
                   h4("Project Framing"),
                   p("Early in the quarter, UW students were alerted by near UW. This news definitely triggered our anxiety. 
                     How is it possible for us to feel safe knowing that area near our school isn’t even safe? (Magaña & Zhou, 2022). 
                     Not only so, looking at the US reported violent crime graph from 1990 to 2021, this country is very familiar with violent 
                     crimes (FBI, 2022). Despite the decrease being visible, the numbers started to rise again from that point. Furthermore, 
                     it is great to keep in mind that the decrease of number doesn’t mean our country is safer. It is possible that criminals 
                     change their methods. New York Times show the shift in crimes. Although violent crimes such as murder is declining, there 
                     are few types of crimes that are inclining such as property crimes (Lopez, 2022). However, we will focus mainly on violent 
                     crimes in this project."),
                   p("embem graph"),
                   h4("Human Values"),
                   p("Our team believes that every Washingtonians deserve to feel safe living here. Thus, we create WAC which can help 
                   Washingtonians make informed decisions on when to go out and understand if the area they’re in is safe or not. We realized 
                   that crimes data are all scattered on the internet. We think it’d be great if we can compile all the safety status based on 
                   safety score, prison rate, and common type of crime in an area that people can see it in a platform."),
                   h4("Stakeholders (Direct & Indirect)"),
                   p("Direct Stakeholders will be the users. The users would most likely be Washington residents or visitors since we only 
                     provide this platform for Washington area based on the counties. It directly impacts their decision making by being more 
                     careful of visiting certain areas. Thus, they can change their decisions of visiting the area according to the safety 
                     status. As for the indirect stakeholders, it can be the business owners the unsafe place. Their customer waves may change 
                     depending on the safety status. Business owners in the area with high safety score, low prison rate can receive more customers."),
                   h4("Possible Harms and Benefits"),
                   p("The Washingtonian may benefit from this platform because they are being informed of unsafe place. It helps them make 
                   an informed decision to go out or not so they can make preventive measures. However, some criminals may take advantage of 
                   this app. They will be able to see the safety status and start committing crimes in the middle of safe area. Furthermore, 
                   this app only provides existing information but would not predict future crimes since we do not have our own investigation 
                   team & don't provide safety status real-time update.")
                   
                   
                   )

ui <-navbarPage(
  theme = shinytheme("slate"),
  "Washington Crime!",
  intro_page,
  plot1,
  plot2,
  plot3,
  summ,
  report
)