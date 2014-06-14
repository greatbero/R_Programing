pollutantmean <- function(directory, pollutant, id = 1:332) {
  
  Files <- list.files(directory)
  kompletno <- data.frame ()
  for (i in id) { 
    miki <- read.csv(file.path(directory, Files[i]))
    #miki <- read.csv(paste(directory, "/", Files[i], sep=""))
    kompletno <- rbind (kompletno, miki) 
        
   }
  pm <- mean(kompletno[, pollutant], na.rm=TRUE) #, digits = 3)
  
  pm
}
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'pollutant' is a character vector of length 1 indicating
  ## the name of the pollutant for which we will calculate the
  ## mean; either "sulfate" or "nitrate".
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return the mean of the pollutant across all monitors list
  ## in the 'id' vector (ignoring NA values)