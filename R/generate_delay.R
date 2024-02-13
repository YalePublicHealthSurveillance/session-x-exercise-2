set.seed(123)


ds1 <- tibble(day_occur = sample(1:60, size=2100, replace=T,prob=1.06^(1:60)) ,
              delay_dist = rpois(2100, lambda=5),
              date_of_diagnosis = as.Date('2019-03-01') + days(day_occur),
              date_of_report =  date_of_diagnosis+ days(delay_dist) ) %>%
  select(date_of_diagnosis,date_of_report) 

ds1 %>%   
  filter(date_of_report<='2019-03-19') %>%
     saveRDS(., 'Data/reported_cases.rds')

ds1 %>%   
  saveRDS(., 'Data/reported_cases_full_final.rds')
