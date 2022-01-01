# Load Packages
library(plotly)
library(tidyverse)
library(gsheet)
library(zoo)
library(plyr)
library(htmlwidgets)
library(ggsci)
library(maps)

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
a = str_replace(a, "What country are you in\\?", "Country")
a = str_replace(a, "What state are you in\\? (Choose NA if not in U.S.)", "State")
a = str_replace(a, "What state/region/province are you in? (Write 'NA' if in U.S.)", "State")
a = str_replace(a, "What county (or equivalent) are you in\\?", "County")
a = str_replace(a, "What city (or equivalent) are you in\\?", "City")

# Make the data into a dataframe 
data <- as.data.frame(read.table(text = a, sep = sep), skip = 2, headers = T)
data <- data[-1]
data$V1 <- NULL 
colnames(data) = c("Date", "Test", "Positive", "State", "County", "City") # Fix column names 
data <- data[-c(1),] 
data$Positive<-ifelse(data$Positive=="Yes",1,0)
data

# Count positives and negatives 
positives = data %>%
  filter(Positive == 1)

negatives = data %>%
  filter(Positive == 0)

pn.data = data.frame("Result" = c("Negative", "Positive"), 
                     "n" = c(nrow(negatives), nrow(positives)))

pn.plot = ggplot(pn.data, aes(Result, n, fill = Result)) +
  geom_bar(stat = "identity") +
  theme_classic() +
  ylab("Total Tests Reported") +
  scale_fill_npg() +
  xlab("Reported Result") +
  ggtitle("Positive and Negative Test Comparison") +
  theme(plot.title = element_text(hjust = 0.5), legend.position = "none")
out4 = ggplotly(pn.plot)
saveWidget(out4, "/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/html/p4.html", selfcontained = T, libdir = "lib")

#Count the total number of reported tests 
rollingcount = read.csv("/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/rollingcount.csv")
today = nrow(rollingcount)

test1 = rollingcount[today, 1]
test2 = format(Sys.time(), "%m/%d/%y")
test = test1==test2
if(test == FALSE){
  hold.table = data.frame("Date" = format(Sys.time(), "%Y-%m-%d"), 
                          "Tests" = today)  
  rollingcount = rbind(hold.table, rollingcount)
  write_csv(rollingcount, "/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/rollingcount.csv")
}
  
r = ggplot(rollingcount, aes(Date, Tests)) +
  geom_bar(stat = "identity") +
  theme_classic() +
  ylab("Total Tests Reported") +
  ggtitle("Total Tests Reported") +
  theme(plot.title = element_text(hjust = 0.5))
out2 = ggplotly(r)
saveWidget(out2, "/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/html/p3.html", selfcontained = T, libdir = "lib")

# Summarize the testing data 
tests = data %>%
  select(Date, Test)

# Daily tests - implement this later on 

# Total tests 
abbott = data %>%
  filter(Test == "Abbott BinaxNOW COVID-19 Antigen Rapid Self-Test")
abbott = ddply(abbott, .(Test), .drop=TRUE, summarise, Tests = length(Test))

Quidel = data %>%
  filter(Test == "Quidel QuickVue At-Home OTC Covid-19 Test Kit")
Quidel = ddply(Quidel, .(Test), .drop=TRUE, summarise, Tests = length(Test))

iHealth = data %>%
  filter(Test == "iHealth Covid-19 Antigen Rapid Test")
iHealth = ddply(iHealth, .(Test), .drop=TRUE, summarise, Tests = length(Test))

Ellume = data %>%
  filter(Test == "Ellume Covid-19 Rapid Antigen Home Test")
Ellume = ddply(Ellume, .(Test), .drop=TRUE, summarise, Tests = length(Test))

On = data %>%
  filter(Test == "On/Go At-Home Covid-19 Rapid Self-Test")
On = ddply(On, .(Test), .drop=TRUE, summarise, Tests = length(Test))

CVX = data %>%
  filter(Test == "PCR CVX")
CVX = ddply(CVX, .(Test), .drop=TRUE, summarise, Tests = length(Test))

unk = data %>%
  filter(Test == "Unknown")
unk = ddply(unk, .(Test), .drop=TRUE, summarise, Tests = length(Test))

intelli = data %>%
  filter(Test == "Inteliswab")
intelli = ddply(intelli, .(Test), .drop=TRUE, summarise, Tests = length(Test))

ff = data %>%
  filter(Test == "Flowflex Covid-19 Antigen Home Test")
ff = ddply(ff, .(Test), .drop=TRUE, summarise, Tests = length(Test))

cvs = data %>%
  filter(Test == "CSV Rapid")
cvs = ddply(cvs, .(Test), .drop=TRUE, summarise, Tests = length(Test))

tests_final = rbind(abbott, Quidel, iHealth, Ellume, On, CVX, unk, intelli, ff, cvs)

t = ggplot(tests_final, aes(x = Test, y = Tests, fill = Test)) +
  geom_bar(stat = "identity") +
  scale_fill_npg() +
  theme_classic() +
  ylab("Test Type") +
  theme(axis.text.x=element_blank(), 
        legend.position="bottom") +
  ggtitle("Type of Each Test Reported") +
  theme(plot.title = element_text(hjust = 0.5))
out1 = ggplotly(t)
saveWidget(out1, "/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/html/p2.html", selfcontained = T, libdir = "lib")

##-----------------------------------------------
# Summarize our data (COVID)
summary_state_positive = data %>%
  filter(Positive == 1)
summary_state_positive = ddply(summary_state_positive, .(State, County, City, Date), .drop=TRUE, summarise, Cases = length(Positive))

summary_state_all <- ddply(data, .(State, County, City, Date), .drop=TRUE, summarise, Cases = length(Positive))

summary = data.frame("State" = summary_state_positive$State, 
                            "County" = summary_state_positive$County,
                            "City" = summary_state_positive$City, 
                            "Date" = as.Date.character(summary_state_positive$Date, "%m/%d/%y"), 
                            "Cases" = summary_state_positive$Cases)#, 
                            #"Percent" = ((summary_state_positive$Cases/summary_state_all$Cases)*100))

# Calculate rolling averages 
rolling <- summary %>%
  dplyr::arrange(desc(State)) %>% 
  dplyr::group_by(State) %>% 
  dplyr::mutate(Cases = zoo::rollmean(Cases, k = 7, fill = NA)) %>% 
                  dplyr::ungroup()
                
# Make our plot over time states
states = ggplot(summary, aes(Date, Cases, fill = State)) +
  geom_bar(stat = "identity") +
  #facet_wrap(~State) + # removed 12/31/2021
  theme_classic() +
  ylab("Positive Rapid Tests") +
  ggtitle("Positive Tests per State") +
  theme(plot.title = element_text(hjust = 0.5))
out = ggplotly(states)
saveWidget(out, "/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/html/p1.html", selfcontained = T, libdir = "lib")

# US Map + Data
MainStates <- map_data("state")
MainStates$State = MainStates$region
MainStates$State = str_to_title(MainStates$State)
MergedStates <- inner_join(summary, MainStates, by = "State")

state1 = ggplot() + 
  geom_polygon(data=MergedStates, aes(x=long, y=lat, group=group, fill = Cases), color="black") +
  theme_void() +
  scale_fill_continuous(name="Number of Positive Rapid Tests", low = "white", high = "#8B0000",limits = c(0,50)) 
out5 = ggplotly(state1)
saveWidget(out5, "/Users/patrick/Dropbox (University of Oregon)/Github/phorve.github.io/COVIDHome_R/html/p5.html", selfcontained = T, libdir = "lib")
# Output data to google for public access 
output1 = paste("/Volumes/GoogleDrive/My Drive/HomeCOVID/rawdata/rawdata_", date, ".csv", sep = "")
output2 = paste("/Volumes/GoogleDrive/My Drive/HomeCOVID/summarydata/summarydata_", date, ".csv", sep = "")
output3 = paste("/Volumes/GoogleDrive/My Drive/HomeCOVID/testdata/testdata_", date, ".csv", sep = "")

write.csv(data, output1)
write.csv(summary, output2)
write.csv(tests_final, output3)