library(shiny)
library(dplyr)
library(tidyr)
library(shinydashboard)
library(ggplot2)
library(leaflet)
library(rsample)




accidents_sample_small = readRDS('Accidents_Strata.rds')


accidents_pop_totals = readRDS('Accidents_Population.rds')

palette_1 <- c("#87CEEB", "#6495ED", "#4169E1", "#000080")


pal_test = colorNumeric(palette_1, domain = accidents_sample_small$Severity)


logic_columns = c('Crossing', 'Junction', 'Stop', 'Traffic_Signal')

accidents_sample_small[, logic_columns] = lapply(accidents_sample_small[, logic_columns], as.logical)

accidents_sample_small[, logic_columns] = lapply(accidents_sample_small[, logic_columns], as.numeric)
