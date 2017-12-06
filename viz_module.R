###  Course file for Visualization module

# Chapter 1 - Introduction
library(ggplot2)
library(RColorBrewer)
library(plyr)
library(dplyr)
library(scales)

rm(list = ls())


# Chapter 3 - Bar Charts
## Load data (if not already a dataframe in the environment)
subsahara_jan17 <- read.csv("subsahara_jan17.csv")

summary(subsahara_jan17$QuadClass)

ggplot(data = subsahara_jan17, aes(x = QuadClass))

ggplot(data = subsahara_jan17, aes(x = QuadClass)) +
  




# Chapter 4 - Change the Look
#4.2
ggplot(subsahara_jan17, aes(x = QuadClass)) +
  geom_bar(fill = , colour = , width = )

#4.4
ggplot(subsahara_jan17, aes(x = QuadClass)) +
  geom_bar(fill = "lightblue",color = "darkblue", width = .5)+
  scale

#4.5
ggplot(subsahara_jan17, aes(x = QuadClass)) +
  geom_bar(fill = "lightblue", colour = "darkblue", width = .5) +
  xlab +
  theme +
  ggtitle



# Chapter 5 - Bar Charts with Y Values

## 5.1
quadTone <- summarise(group_by(subsahara_jan17, QuadClass), meanTone )
quadTone

ggplot(quadTone, aes(x = QuadClass, y = meanTone)) +
  geom_bar

## 5.2 Multiple variables
china_2weeks <- read.csv("china_2weeks.csv", stringsAsFactors = FALSE)

head(china_2weeks)

str(china_2weeks)

ggplot(china_2weeks, aes())+
  geom_bar(stat = )


## 5.3 Date Sequence
dailybreaks <- seq()

ggplot(china_2weeks, aes(x , y = n, fill = country)) +
  geom_bar(stat = "identity", width = .5, color = "black") +
  scale_x_date() 

## 5.4 hjust and vjust
ggplot(china_2weeks, aes(x = as.Date(days), y = n, fill = country)) +
  geom_bar(stat = "identity", width = .5, color = "black") +
  scale_x_date(breaks = dailybreaks) +
  theme(axis.text.x = element_text())

## 5.5 Stacked to Grouped
ggplot(china_2weeks, aes(x = as.Date(days), y = n, fill = country)) +
  geom_bar(stat = "identity", width = .5, color = "black", position = ) +
  scale_x_date(breaks = dailybreaks) +
  theme(axis.text.x = element_text(angle = 90, hjust= .5, vjust= .5))



## 5.6 Legends
ggplot(china_2weeks, aes(x = as.Date(days), y = n, fill = country))+
  geom_bar(stat = "identity", position = "dodge", width = .5, color = "black")+
  scale_x_date(breaks = dailybreaks) +
  theme(axis.text.x = element_text(angle = 90, hjust= .5, vjust= .5)) +
  theme(axis.title.x = element_blank()) +
  ylab("Number of Events") +
  theme()+
  labs() +
  scale_fill_discrete()



## 5.7  Color palette 
ggplot(china_2weeks, aes(x = as.Date(days), y = n, fill = country))+
  geom_bar(stat = "identity", position = "dodge", width = .5, color = "black")+
  scale_x_date(breaks = dailybreaks) +
  theme(axis.text.x = element_text(angle = 90, hjust= .5, vjust= .5)) +
  theme(axis.title.x = element_blank()) +
  ylab("Number of Events") +
  theme()+
  labs() +
  scale_fill_brewer()





# Chapter 6 - Line Charts
china_all <- summarize(group_by(china_2weeks, days), total = sum(n))
china_all$days <- as.Date(china_all$days)

## 6.1 Basic Line
ggplot(china_all, aes(x = days, y = total))+
  

## 6.2 Multi-Variable Line
ggplot(china_2weeks, aes())+
  geom_line()

## 6.3 Adjust the Look
ggplot(china_2weeks, aes(x = as.Date(days), y = n, linetype = ))+
  geom_line(size = ) +
  geom_point(shape = , size = )




# Chapter 7 - Histogram

ggplot(subsahara_jan17, aes(x=NumMentions))+
  geom_histogram()

summary(subsahara_jan17$NumMentions)

## Set binwidth = 2
ggplot(subsahara_jan17, aes(x = NumMentions)) +
  geom_histogram(binwidth )

## Set bins = 5
ggplot(subsahara_jan17, aes(x = NumMentions)) +
  geom_histogram(bins )




# Exercise Solutions

# Change the Look Exericise
ggplot(subsahara_jan17, aes(x = QuadClass)) +
  geom_bar(fill = "lightblue", colour = "darkblue", width = .5) +
  xlab("Quad Class of the Events") +
  theme(axis.title.y = element_blank()) +
  ggtitle("Number of Events by Quad Class") +
  theme(axis.title.x = element_text(color = 'blue')) +
  theme(plot.title = element_text(size = 20))

# PE Part 1
subsahara_jan17$EventBaseCode <- as.factor(subsahara_jan17$EventBaseCode)
ggplot(subsahara_jan17, aes(x = EventBaseCode)) +
  geom_bar(fill = "red", colour = "black", width = .5) +
  theme(axis.text.x = element_text(angle = 90, hjust = .5, vjust = .5)) +
  xlab("Event Code") + 
  theme(axis.title.y = element_blank()) +  
  ggtitle("Number of Events by Event Code")

# PE Part 2
ggplot(china_2weeks, aes(x = as.Date(days), y = n, color = country))+
  geom_line(size = 1) +
  ggtitle("Events Involving the Chinese Government in 3 Countries")+
  theme(plot.title = element_text(hjust = .5)) +  #Center the plot title
  theme(axis.title.y = element_blank()) +
  theme(axis.title.x = element_blank()) +
  scale_x_date(breaks = dailybreaks) +
  theme(axis.text.x = element_text(angle = 90, hjust = 1, vjust = 0)) +  #change angle of axis text
  theme(legend.position = "top")+  #legend to top of chart
  labs(color = "Location of Activity") +
  geom_point(shape = 18, size = 4) +
  scale_color_brewer(palette = "Set1", labels = c("Nigeria","Zambia","Zimbabwe"))

# PE Part 3
sub51 <- dplyr::filter(subsahara_jan17, EventBaseCode == 51)
ggplot(sub51, aes(x= EventBaseCode, fill = ActionGeo_ADM1Code))+
  geom_bar(position = 'dodge', color = "black")+
  ggtitle("Number of Events by Action Geographic Location\n for Event Code with the Most Events") +
  xlab("Event Code") +
  labs(fill = "Geographic Location")+
  scale_fill_brewer(palette = "Set3")






