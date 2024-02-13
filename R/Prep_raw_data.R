#Prep raw data downloaded from NYC website
d1<- read.table('./Data/A_EXPORT_QL_crosstab.csv',sep="\t", header=TRUE, skipNul = T, fileEncoding="UCS-2LE") # had to add "fileEncoding="UCS-2LE"" 

d1$date <- as.Date(d1$date, '%m/%d/%Y')

unique(d1$agec)

d1a <- d1[d1$agec=="Ages 65+ years" & d1$borrough=='Manhattan',c('date','count')]
saveRDS(d1a, './Data/65p_diarrhea_manhattan.rds')


d2 <- d1a[d1a$date>='2020-04-01',]
d2$week.date <- floor_date(d2$date, unit='week')

d3 <- d2 %>%
  group_by(week.date) %>%
  summarise('cases'=sum(count))
d3 <- as.data.frame(d3)
saveRDS(d3, './Data/weekly_65p_diarrhea_manhattan_pandemic.rds')
