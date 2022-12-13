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
library(shinythemes)

# Define UI for application that draws a histogram

intro_page <- tabPanel("Introduction",
                       titlePanel("WAC: Washington Crime!"),
                       img(src = "https://www.grothlaw.com/wp-content/uploads/2020/09/preview_COLOURBOX34624761.jpg", height = 500, width = 1100),
                       p("We observed that the neighborhood has been overrun with violence throughout the first few weeks of the quarter. There is currently no overarching framework or body of information that addresses the problem of minimizing the number of victims brought on by common crimes. Since safety is one of our core human rights and requirements, this is significant. We aim to do this as informatics students by putting what we've learned in class to use in a unique way. Starting in the state of Washington, our aim is to decrease the number of victims caused by these crimes. To accomplish this, we intend to compile information on recorded crimes in and surrounding each county in Washington from the official government website. These offenses include burglary, shootings, vandalism, assault, and more. The public is then given data on the safety score of the area they are in, the incarceration rate, and the most common types of crime so they may make an educated decision about avoiding particular places with poor safety scores.
"),
                      h3("Problem Domain"),
                      h4("Project Framing"),
                      p("Early in the quarter, UW students were alerted by near UW. This news definitely triggered our anxiety. How is it possible for us to feel safe knowing that area near our school isn’t even safe? (Magaña & Zhou, 2022). Not only so, looking at the US reported violent crime graph from 1990 to 2021, this country is very familiar with violent crimes (FBI, 2022). Despite the decrease being visible, the numbers started to rise again from that point. Furthermore, it is great to keep in mind that the decrease of number doesn’t mean our country is safer. It is possible that criminals change their methods. New York Times show the shift in crimes. Although violent crimes such as murder is declining, there are few types of crimes that are inclining such as property crimes (Lopez, 2022). However, we will focus mainly on violent crimes in this project.

"),
                      h4("Human Values"),
                      p("Our team believes that every Washingtonians deserve to feel safe living here. Thus, we create WAC which can help Washingtonians make informed decisions on when to go out and understand if the area they’re in is safe or not. We realized that crimes data are all scattered on the internet. We think it’d be great if we can compile all the safety status based on safety score, prison rate, and common type of crime in an area that people can see it in a platform"),
                      
                      h4("Stakeholders (Direct & Indirect)"),
                      p("Direct Stakeholders will be the users. The users would most likely be Washington residents or visitors since we only provide this platform for Washington area based on the counties. It directly impacts their decision making by being more careful of visiting certain areas. Thus, they can change their decisions of visiting the area according to the safety status. As for the indirect stakeholders, it can be the business owners the unsafe place. Their customer waves may change depending on the safety status. Business owners in the area with high safety score, low prison rate can receive more customers."),
                      
                      h4("Possible Harms and Benefits"),
                      p("The Washingtonian may benefit from this platform because they are being informed of unsafe place. It helps them make an informed decision to go out or not so they can make preventive measures. However, some criminals may take advantage of this app. They will be able to see the safety status and start committing crimes in the middle of safe area. Furthermore, this app only provides existing information but would not predict future crimes since we do not have our own investigation team & don't provide safety status real-time update."),
                      
                      h3("Research Questions"),
                      p(strong("Are UW students more susceptible to violent crimes than Washington State residents?")),
                      p(" This question is important to understand the sentiment surrounding the basis of our project. What motivates this question is the fact that if students feel safe and have no concerns about the violent criminal activity, our project ceases to have any relevancy or impact.

"),
                      p(strong("What would make the UW community feel more safe as criminal activity continues to rise?
"),
                      p("This question is important because the suggestions that the UW community poses are a direct reflection of things that would increase their feeling of safety. What motivates this question is rather than guess and check what would make the community feel safer, we can ask the community and expand off of their insights.

"),
                      p(strong("What are some ways that the UW community can keep each other informed on the severity of the criminal activity in the area?
"),
                        
                        p("This question is important because it allows us to analyze what the community at hand believes will be beneficial to keep them informed for their safety. What motivates this question is CBPR (community based participatory research) which is the research approach that equitably involves community members in the research process to effectively target the problem at hand.
"),
                        p(strong("In what ways does our data hold power?
"),
                          p("This questions is important because we will actively be in communication with marginalized groups and stakeholders. Being cognisent of the power we hold, working with this data, is essential so that we can better cater towards those who will be affected by the data. Not solely the ones who consume it.
"),
                      h3("Data"),
                      
                      p("We're analyzing the data from:"),
                      p(em("Safest cities in Washington, 2021."), "Background Checks.org. Retrieved November 14, 2022, from https://backgroundchecks.org/safest-cities-in-washington.html. The URL can be found through this link https://backgroundchecks.org/safest-cities-in-washington.html"),
                      p(em("National Incident-Based Reporting System (NIBRS)."), "Incident Based Reporting System. Retrieved November 14, 2022, from https://sac.ofm.wa.gov/sites/default/files/public/cjdb/nibrs.html")),
),

                      h3("Key Findings"),
                      p("1. Understand the Prison Rate across Washington Counties"),
                      p("2. Understand the Total Crime across Washington Counties"),
                      p("3. Understand the Safety Score across Washington Cities"))
                      

)
                       #h1("Introduction"))

plot1 <- tabPanel("Prison Rate",
          titlePanel("Prison Rate across Washington Counties"),
          sidebarPanel(
                uiOutput("chooseCounty"),
                uiOutput("chooseYear")),
          mainPanel(
                  plotlyOutput("plot1"),
          p("The Washington Association of Sheriffs and Police Chiefs (WASPC) compiles statistics on reported 
          incidents-based offenses each month using information from member law enforcement agencies. Participation 
          in the Federal Bureau of Investigation's effort for standardized crime reporting is voluntary on the side of 
          the agencies. This information showed a prison rate that was determined based on the number of recorded personal 
          offenses per 1,000 residents. Our group separated the incarceration rate among the 39 counties in Washington due 
          to its geographic diversity. Knowing how many people are imprisoned in a county will help you gauge how serious the 
          situation is there. We can see that Benton, Clark, and Pierce have Washington's three highest rates of static 
          incarceration. On the other hand, the biggest changes in incarceration are in Garfield, Columbia, and Spokane. 
          As most UW student resides in King County, the prison rate in King county is somewhere between 12-15.
")
                  )
                )

plot2 <- tabPanel("Crimes",
                  titlePanel("Crimes in WA"), 
                  sidebarPanel(
                    uiOutput("chooseCounty1")),
                  p(strong("We believe that this data visualization is important because it raises people's awareness
                    on the common crimes that occur in each county so that they would be more cautious on what
                    dangers or which crime they need to be alerted on wherever they go.")),
                  mainPanel(
                    plotlyOutput("crimestotal")),
                  mainPanel(
                    plotlyOutput("rape")),
                  mainPanel(
                    plotlyOutput("violent")),
                  mainPanel(
                    plotlyOutput("robbery")),
                  mainPanel(
                    plotlyOutput("murder")),
                  mainPanel(
                    plotlyOutput("assault")),
                  mainPanel(
                    plotlyOutput("prop")),
                  mainPanel(
                    plotlyOutput("burglary")),
                  mainPanel(
                    plotlyOutput("larceny")),
                  mainPanel(
                    plotlyOutput("motor")),
                  mainPanel(
                    plotlyOutput("arson"))
                  )

plot3 <- tabPanel("Safe Cities",
                  titlePanel("Safety Level of Cities across Washington State"),
                  sidebarPanel(
                    uiOutput("chooseCity")),
                  mainPanel(
                    plotlyOutput("plot3")),
                  titlePanel("Safe Cities in Washington"),
                  mainPanel(
                    p("This chart uses the same FBI statistics as the first one. Simply put, this visualization allows the user to see where how many cities are actually safe. The line at index zero serves as a baseline threshold or “neutral” meaning that cities across that line are technically safe and cities behind that line (any negative safety scores) are not safe. For example, Snoqualmie has a safety score of 0.59 making it overwhelmingly the safest city in Washington. Conversely, Tacoma has a safety score of -1.44 making it the most dangerous city in Washington. This informs UW students that they should be more cautious and wary in cities with negative safety scores like Tacoma.
"),
                    plotlyOutput("plot4"))
                  )

      
summ <- tabPanel("Summary",
                 titlePanel("Summary Takeaways"),
                 p("Our exploration of the Crime data shows us that Snoqualmie is by far the safest city in 
                   Washington. On the other hand, Tacoma is considered as the most dangerous one. In terms of prison rate,
                   the fluctuations are mostly not obvious. There are 3 stagnant prison rate which are Benton, Clark and Pierce. Las but not least,
                   the most crimes committed in Washington is in Pierce"),
                 img(src = "https://news.vanderbilt.edu/files/Crime-Scene-Resized.jpg", height = 500, width = 1100))
                       
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
                   h4("Positive"),
                   p("Community | Safety"),
                   h4("Negative"),
                   p("Violence | Criminal-Activity"),
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
                   img(src = "https://www.statista.com/graphic/1/191129/reported-violent-crime-in-the-us-since-1990.jpg", height = 350, width = 600),
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
                   team & don't provide safety status real-time update."),
                   
                   h3("Research Questions"),
                   p(strong("Are UW students more susceptible to violent crimes than Washington State residents?")),
                   p(" This question is important to understand the sentiment surrounding the basis of our project. What motivates this question is the fact that if students feel safe and have no concerns about the violent criminal activity, our project ceases to have any relevancy or impact.

"),
                   p(strong("What would make the UW community feel more safe as criminal activity continues to rise?
"),
                     p("This question is important because the suggestions that the UW community poses are a direct reflection of things that would increase their feeling of safety. What motivates this question is rather than guess and check what would make the community feel safer, we can ask the community and expand off of their insights.

"),
                     p(strong("What are some ways that the UW community can keep each other informed on the severity of the criminal activity in the area?
")),
                       
                       p("This question is important because it allows us to analyze what the community at hand believes will be beneficial to keep them informed for their safety. What motivates this question is CBPR (community based participatory research) which is the research approach that equitably involves community members in the research process to effectively target the problem at hand.
"),
                       p(strong("In what ways does our data hold power?
"),
                         p("This questions is important because we will actively be in communication with marginalized groups and stakeholders. Being cognisent of the power we hold, working with this data, is essential so that we can better cater towards those who will be affected by the data. Not solely the ones who consume it.
"),
                   h3("The Dataset"),
                   p("Our data set will aid us in answering our research questions in a few ways. First, after analyzing the data collected, we will begin to display our findings on a website that contains all relevant information. This answers the question on how the community could help each other on the severity of crime in an area. After looking at our findings, the community could better prepare themselves and others close to them by referring to the website. Secondly, our data set has data for crimes in all of the counties & cities in Washington. From there, we could look up which crime is common in a certain area, the safety score, and prison rate. This will help the community feel a lot more safe, as they have a sense of how dangerous or safe an area is."),
                  
                   p(strong("Here is the APA Citation for the data:")),
                  p(em("Safest cities in Washington, 2021."), "Background Checks.org. Retrieved November 14, 2022, from https://backgroundchecks.org/safest-cities-in-washington.html."), 
                  p("The URL can be found through this link https://backgroundchecks.org/safest-cities-in-washington.html"),
                  p(em("National Incident-Based Reporting System (NIBRS)."), "Incident Based Reporting System. Retrieved November 14, 2022, from https://sac.ofm.wa.gov/sites/default/files/public/cjdb/nibrs.html")),
                  p("The URL can be found through this link https://sac.ofm.wa.gov/sites/default/files/public/cjdb/nibrs.html"),
                  p("The data is collected by Washington Statistical Analysis Center. Washington Statistical Analysis Center or WSAC specializes in collecting data surrounding crime and justice. Their data is used for Washington policy and budget development. Bureau of Justice Statistics, Office of Justice Programs, and US Department of Justice funded WSAC through a grant. Since the data from Washington Statistical Analysis Center is being used for creating and revising Washington Policy, those who gained benefit from it can be any institutions that may be related to crime prevention. Furthermore, this data is being used as the reference for budget development, some institutions may receive more or less budget because of this data. Hence, reliable data surveillance must be very strict. The commissioner need to make sure that the data is not being manipulated so people can take advantage from it. Washington Statistical Analysis Center uses Summary Reporting System (SRS) and National Incident Based Reporting System (NIBRS) and they are part of FBI’s Uniform Crime Reporting System. We obtained the data from Washington Statistical Analysis Center's website then we downloaded the xlsx format, and we definitely credit the data source.
"),
                  h3("Findings"),
                  p("Through our research and data visualizations a key finding was Snoqualmie, Enumclaw, and West Richard being the safest cities in Washington. This can be vital information to a UW student who’s primary concern/priority is safety when it comes to renting an apartment for the school year. But this is not limited to only students, take a newly hired faculty member for example, they could be looking for a home in a safe environment that’s not riddled with crime. Having a list of the safest cities would allow the faculty member to check which ones are closest to UW in order to have a short commute yet also have the comfortability that a safe city affords. This poses as one way to make the UW community feel more safe, ultimately answering our second research question. Another key finding was Tacoma, Spokane, and Fife being the most dangerous cities in Washington. This information could be life saving for a UW student who may be going to these cities for whatever reason (concert, event, etc.) because it allows them to not only plan ahead accordingly but also be aware of the risks that their surroundings can pose. It is important to recognize that our data holds power. Tacoma has often always been associated to be infested with gang activity, shootings, violence etc. and generally, for lack of better terms, not regarded to as a place you would want to visit. Through this ranking of safe cities, many stereotypes will be reinforced upon Tacoma and other lower income cities being violent, ghetto, and dangerous. This is mainly due to the drastic margin of safety scores, as a result, many people who view our visualizations may begin to hyperbolize how life in Tacoma really is. Though the crime statistics reveal that Tacoma has more violent crime, that doesn’t change the fact that real people with families live still live there, as well as other low-safety score cities. As students at the University of Washington we need to be cognizant of our position in working with this data. We are very privileged in not having to experience the disproportionate rate of danger/violence other people experience residing in more dangerous cities such as Tacoma. Our responsibility and duty is to inform others; not to reaffirm stereotypes. Our fourth research question was In What Ways Does Our Data Hold Power, and we believe this to be a prime example. In pointing out these instances of power, we hope to mitigate the implications they afford. To answer our third question, the UW community can keep each other informed by sharing our data visualizations! By spreading the word and making others more aware of the dangerous cities we are inherently keeping each other informed and more safe. As for our first research question, Are UW Student More Suceptible To Violent Crimes Than Washington State Residents, based on the data we can confidently say yes. In our visualization on the “Safe Cities” tab, Seattle can be seen with a -0.82 safety score, placing it far away from the baseline zero that is required for a city to be regarded as “safe”. 
"),
                  h3("Discussions"),
                  p("After going through our whole process–searching, analyzing, and visualizing the reliable crime data–we found insightful things that are presented in the previous section (Findings). However, we acknowledge that while WAC findings are important, they also have their own implications. 

The first importance is that it informs people about which place is safe and unsafe which means they can make informed decisions about which idea they should avoid going to (alone or with other people) and which idea is safe for them to go to (alone or with other people). It prevents them from putting themselves in a vulnerable situation to be attacked. Not only it is useful for people who live in Washington, but this is also highly useful for tourists or newcomers that have zero understanding of the area in order to prevent them from going to unsafe places (alone or with other people). 

Secondly, it can be used for reference to people who are looking for a neighborhood to live in (alone or with family). Families who have children in their houses need to find a safe place for the kids to explore and grow. Neighborhood and community situation influences children’s growing experience. For instance, children mostly find friends and play in the playground to practice their social skills. A community usually has its own playgrounds. However, it wouldn’t be good for the children if the playground is unsafe. Those who live alone need to find a safe neighborhood so they will also feel safe when they’re alone. 

Third, most business owners have warehouses to keep their goods, especially if they are in the retail business. This data can give them a reference to consider which place is the most compatible and safe when they’re looking for warehouses. If the warehouse is located in an unsafe area, it increases the risk of burglary, vandalism, robbery, and other crimes which badly impacts the business and security team’s safety. Last but not least, our other graphs give reference to the local authority so they can make policy that reduces crime in the area.

Nonetheless, as we mentioned before, our findings also have their own implications. We are not using real-time data because the data we are using is from the prior year. As a result, rather than providing you with a clear picture of how things might turn out or are currently, this data can simply serve as a reminder to be cautious about the future.

"),
                  h3("Conclusion"),
                  p("In conclusion, it is clear that the safety of our community and incarceration is a complex and multifaceted issue. There are many factors at play, with no easy solutions or answers. However, it is important to continue researching and discussing this issue in order to better understand it and identify potential ways to address it. It is also crucial to remember that the people affected by this issue are real, with their own hopes, fears, and dreams. We must approach this issue with empathy and a commitment to finding solutions that will benefit everyone involved. One potential way forward is to focus on education and awareness. By educating ourselves and others about the issue, we can gain a better understanding of its causes and potential solutions. Just as we have done on our project, we created charts that represent prison rates and the safety of our community, which raises awareness for our audience. This can also help to dispel any myths or misunderstandings that may be preventing progress. In addition, raising awareness about the issue can help to mobilize support and action from a wider range of individuals and organizations. Furthermore, promoting safety and preventing crime requires collaboration and coordination among different stakeholders, including law enforcement agencies, community organizations, local governments, and individuals. By working together, these stakeholders can develop and implement effective strategies for promoting safety and preventing crime, and create a safer and more secure environment for individuals and communities. Another important aspect of addressing this issue is to address its root causes. This may require addressing systemic issues such as inequality, discrimination, and other social and economic factors contributing to the problem. It may also require addressing individual behaviors and attitudes that contribute to the problem. It is essential to address the issue of racial bias and discrimination in the criminal justice system. This includes promoting diversity and inclusion in law enforcement agencies, addressing systemic racism and discrimination, and providing individuals with the support they need to overcome the challenges they face. This can be a challenging process, but it is necessary in order to create lasting and meaningful change. Overall, the conclusion is that while there is no easy solution to this issue, it is important to continue working towards finding ways to address it. By educating ourselves and others, addressing root causes, and working together, we can make progress toward creating a better future for all.
"),
                  h3("Acknowledgments"),
                  p("We want to express our gratitude to INFO 201 Instructors: Thomas Winegarden and Yubing Tian for guiding us through this Group Project and giving us great feedback."),
                
                  h3("References"),
                  p("FBI. (October 5, 2022). Total violent crime reported in the United States from 1990 to 2021, Statista. Retrieved November 01, 2022, from https://www.statista.com/statistics/191129/reported-violent-crime-in-the-us-since-1990/"),
                p("Lopez, G. (2022, September 23). A shift in crime. The New York Times. Retrieved October 31, 2022, from https://www.nytimes.com/2022/09/23/briefing/crime-rates-murder-robberies-us.html"),
                p("Magaña, D. Z., & Zhou, A. (2022, October 3). 4 injured in University District shooting were UW students._ The Seattle Times. Retrieved October 31, 2022, from https://www.seattletimes.com/seattle-news/law-justice/4-injured-in-university-district-shooting-were-uw-students/"),
                p("National Incident-Based Reporting System (NIBRS). Incident Based Reporting System. Retrieved November 14, 2022, from https://sac.ofm.wa.gov/sites/default/files/public/cjdb/nibrs.html
"),
                p("Safest cities in Washington, 2021. Background Checks.org. Retrieved November 14, 2022, from https://backgroundchecks.org/safest-cities-in-washington.html
"),
                p("Offenses Known to Law Enforcement by Metropolitan and Nonmetropolitan Counties, 2019. Retrieved November 14, 2022, from https://ucr.fbi.gov/crime-in-the-u.s/2019/crime-in-the-u.s.-2019/tables/table-10/table-10-state-cuts/washington.xls
")
                   
))

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