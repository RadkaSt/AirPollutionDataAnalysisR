getwd() #get current working directory
setwd("D:/programovani/R_Programming_for_Data_Science/week2") # if needed set the path to the directory containing your function

#test pollutantmean function
source("pollutantmean.R")
pollutantmean("specdata", "sulfate", 1:10) #4.064128
pollutantmean("specdata", "nitrate", 70:72) #1.706047
pollutantmean("specdata", "nitrate", 23) # 1.280833

#test complete function to count the amount of complete cases(without missing values)
source("complete.R")
complete("specdata", 1)
complete("specdata", c(2, 4, 8, 10, 12))
complete("specdata", 30:25)
complete("specdata", 3)

#test corr function to calculate correlation between sulfate and nitrate levels
source("corr.R")
source("complete.R")
cr <- corr("specdata", 150)
head(cr)
summary(cr)