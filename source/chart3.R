library("ggplot2")
library("tidyverse")
library("dplyr")


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




