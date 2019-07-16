library(tidyverse)
library(reshape2)
library(here)
loc <- here()
data <- read_csv(here("personal","power","ic.csv"))

data_long <- melt(data,
                  # ID variables - all the variables to keep but not split apart on
                  id.vars=c("Year"),
                  # The source columns
                  measure.vars=c("Thermal", "Nuclear", "Hydro", "Res", "Total"),
                  # Name of the destination column that will identify the original
                  # column that the measurement came from
                  variable.name="type",
                  value.name="capacity"
)

ggplot(filter(data_long, type!="Total"), aes(Year, capacity, color =type))+
     geom_step(lwd = 1.5)+
     scale_x_continuous(breaks = c(1990,1995,2000,2005,2010,2015,2018))+
     labs(title="Installed Capacity of various types of Power Plants",
          subtitle = "in Mega Watts (MW)",
          caption = "Source : Ministry of Power",
          color = "Source")+
    theme_bw()+
     theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),
          axis.line = element_line(color = 'black'))
     


