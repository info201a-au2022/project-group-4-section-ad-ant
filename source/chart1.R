# Example: Project Data Access Functions  ----
#----------------------------------------------------------------------------#
# These functions are used to access data sources ... 
#----------------------------------------------------------------------------#
library(tidyverse)
library(dplyr)

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


