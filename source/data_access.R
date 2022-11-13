# Example: Project Data Access Functions  ----
#----------------------------------------------------------------------------#
# These functions are used to access data sources ... 
#----------------------------------------------------------------------------#
library(tidyverse)

data_access_test <- function (name="World!") {
  t <- paste0("Hello: ", name)
  return(t)
}

# load .csv into variable 
wa_cities <- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-4-section-ad-ant/main/data/sorted-WA-cities.csv")

#plot chart
#hist(wa_cities$safetyScore)
#plot(x=wa_cities$state, y=wa_cities$safetyScore)


plot_wa <- function (df = wa_cities) {
  ggplot(df, aes(x = safetyScore, y = fct_reorder(state, safetyScore, .fun = mean))) +
    geom_point() + geom_vline(xintercept=0, color = "red", size=1) + theme_minimal() + 
    xlab("Safety Score") + ylab("Cities (Pop. > 10,000)") + 
    ggtitle("Safest Cities in Washington") 
}

