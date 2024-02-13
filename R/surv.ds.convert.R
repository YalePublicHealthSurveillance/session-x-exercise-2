surv.ds.convert <- function(ds, datevar='date', casevar='cases'){
  year.start <- min(lubridate::year(ds[,datevar]))
  week.start <- min(lubridate::week(ds[,datevar])[lubridate::year(ds[,datevar])==year.start])
  
  SurvObj <- create.disProg(
    week = 1:nrow(ds), #Index of observations
    observed = ds[,casevar] ,  #cases
    state=matrix(0, nrow=nrow(ds), ncol=1), #just 0s
    start = c(year.start, week.start)) #start date; 1st week of 1990
  return(SurvObj)
}