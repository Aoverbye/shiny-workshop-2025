# Load libraries
library(shiny)
library(shinydashboard)
library(shinyjs)
library(shinyWidgets)
library(tidyverse)
library(leaflet)
library(shinycssloaders)
library(markdown)


#read data

# read in data ----
lake_data <- read_csv("data/lake_data_processed.csv")

