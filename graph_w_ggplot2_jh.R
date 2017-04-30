# load ggplot
library(ggplot2)
library(scales)
... + scale_y_continuous(breaks=pretty_breaks(n=5))

setwd("C:/Users/hospitaj/Desktop")
# import data
dat <- read.csv("ACLGroups_2000-2015_FishersSold_SUMMARY.csv")
names(dat)

## 1. Bar chart of Other (cat_name=Other) pound sold (tot_lbs_sold) by year (2000-2015)
## usage: ggplot(dat, aes(x=xvalue), y=yvalue) + geom_bar(stat="identity")

mydat <- dat[dat$CAT_NAME=="OTHER",]
p <- ggplot(mydat, aes(x= factor(YEAR),y = tot_lbs_sold)) +  xlab("Year") + ylab("Total fish sold (lbs)")+labs(title = "New plot title") +geom_bar(stat="identity",fill="#fec44f", colour="grey") 
p

## 2. Same Bar chart in (1) with horizontal 10-year average (2006-2015) line 
p+geom_hline(colour= "#756bb1",size= 1,linetype="dashed", aes( yintercept=mean(dat[dat$CAT_NAME=="OTHER" & dat$YEAR %in% c(2006:20015), "tot_lbs_sold"])))
p


## 3. Bar chart of pounds sold for BMUS (group_name = Deep 7 and Non-D7) by year (2000-2015)
##  Dodged bar charts

p <- ggplot(dat[dat$CAT_NAME=="BMUS",], aes(x= factor(YEAR), fill=GROUP_NAME, y=tot_lbs_sold)) +  xlab("Year") + ylab("Total fish sold (lbs)") +
  geom_bar(position="dodge", stat="identity") + theme(legend.position="bottom")
p

## Stacked bar charts
p <- ggplot(dat[dat$CAT_NAME=="BMUS",], aes(x= factor(YEAR), fill=GROUP_NAME, y=tot_fishers_sold)) +  xlab("Year") + ylab("Total fish sold (lbs)") +
  geom_bar(position="stack", stat="identity") + theme(legend.position="bottom")
p

p <- ggplot(dat[dat$GROUP_NAME=="BMUS",], aes(x= factor(YEAR), fill=_NAME, y=tot_lbs_sold)) +  xlab("Year") + ylab("Total fish sold (lbs)") +
  geom_bar(position="stack", stat="identity") 
p


## 5. Line chart for price trends for Deep 7 (group_name = Deep 7) nominal (nom_price) and inflation adjusted prices (real_price) by year 


subdat <- dat[dat$GROUP_NAME=="Bottomfish - Main Hawaiian Islands (MHI) Deep 7 Multi-Species",]
 ggplot(subdat, aes(YEAR))+
   geom_line(aes(y=nom_price, colour="nom_price"))+
   geom_line(aes(y=real_price, colour="real_price"))       

 
