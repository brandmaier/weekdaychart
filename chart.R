library(gh)

repository <- Sys.getenv("REPOSITORY")
username <- Sys.getenv("USERNAME")

query <- gh("GET /repos/{username}/{repository}/commits",
               username = username, repository=repository per_page=100)

dates <- sapply(query, function(x) {

  date_string <- x$commit$committer$date
  
  date_time <- as.POSIXct(date_string, format = "%Y-%m-%dT%H:%M:%SZ")
  
  # Get the day of the week
  day_of_week <- weekdays(date_time)
  
})

library(dplyr)
library(ggplot2)

all_weekdays <- weekdays(as.POSIXct(paste0("1972-10-0",2:8," GMT")))

dates <- ordered(dates, levels=all_weekdays)

#data.frame(weekday=names(table(dates)),frequency=table(dates))
plt <- tibble(dates)%>% 
  ggplot(aes(x=dates,fill=dates))+
geom_bar(stat="count")+
theme(axis.text.x = element_text(angle=45, hjust=1))+
guides(fill = "none")+xlab("")

ggsave("weekdays.png", plot = plt, width = 6, height = 3)
