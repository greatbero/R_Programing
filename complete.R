complete <- function(directory, id = 1:332) {
  
  Files <- list.files(directory)
  framica <- data.frame ()
  
  for (i in id) { 
    miki <- read.csv(file.path(directory, Files[i]))
    eli <- 0
    for (g in 1:nrow(miki)) { 
    
      if (!is.na(miki[g,2]) && !is.na(miki[g,3]))  {eli <- eli+1 }
      
    }
      
 
  framica <- rbind(framica, c(i,eli))
  }

  colnames(framica)[1] <- "id"
  colnames(framica)[2] <- "nobs"
  framica

}
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
  
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases