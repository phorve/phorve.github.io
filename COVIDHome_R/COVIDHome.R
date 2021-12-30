# Load Packages
library(plotly)
library(tidyverse)
library(gsheet)
library(zoo)
library(plyr)

# Set variables we'll need later 
date = format(Sys.time(), "%Y%m%d")
sep = ","

# Load in the data from today
url <- "https://docs.google.com/spreadsheets/d/1EoGQqiZIAtq-4_-hEi0JEgbgf9-_tqXbsQnCZBQ8x1w/edit?usp=sharing"
a <- gsheet2text(url, format = "csv")

# Clean up the column names so we can actually access the data
a = str_replace(a, "Today's Date", "Date")
a = str_replace(a, "What Test did you use\\?", "Test")
a = str_replace(a, "Did you test positive for COVID-19\\?", "Positive")
a = str_replace(a, "What state are you in\\?", "State")
a = str_replace(a, "What county are you in\\?", "County")
a = str_replace(a, "What city are you in\\?", "City")

# Make the data into a dataframe 
data <- as.data.frame(read.table(text = a, sep = sep), skip = 2, headers = T)
data <- data[-1]
data$V1 <- NULL 
colnames(data) = c("Date", "Test", "Positive", "State", "County", "City") # Fix column names 
data <- data[-c(1),] 
data$Positive<-ifelse(data$Positive=="Yes",1,0)
data

# Summarize our data
summary_state_positive = data %>%
  filter(Positive == 1)
summary_state_positive = ddply(summary_state_positive, .(State, County, City, Date), .drop=TRUE, summarise, Cases = length(Positive))

summary_state_all <- ddply(data, .(State, County, City, Date), .drop=TRUE, summarise, Cases = length(Positive))

summary = data.frame("State" = summary_state_positive$State, 
                            "County" = summary_state_positive$County,
                            "City" = summary_state_positive$City, 
                            "Date" = as.Date.character(summary_state_positive$Date, "%m/%d/%y"), 
                            "Cases" = summary_state_positive$Cases, 
                            "Percent" = ((summary_state_positive$Cases/summary_state_all$Cases)*100))

# Calculate rolling averages 
rolling <- data %>%
  dplyr::arrange(desc(State)) %>% 
  dplyr::group_by(State) %>% 
  dplyr::mutate(death_03da = zoo::rollmean(deaths, k = 7, fill = NA) %>% 
                  dplyr::ungroup()
                
# Make our plot over time 