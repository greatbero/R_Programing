corr <- function(directory, threshold = 0) {
    Files <- list.files(directory)
    vektor <- c()
    for (i in 1:332) {
        miki <- read.csv(file.path(directory, Files[i]))
        eli <- 0
        redalica <- c()
        for (g in 1:nrow(miki)) 
            {
            if (!is.na(miki[g,2]) && !is.na(miki[g,3])) 
                {
                eli <- eli+1
                redalica <- append(redalica, TRUE)
                }  else {
                    redalica <- append(redalica, FALSE)
                }
            }
        if (eli>=threshold) { 
            milkicor <- subset(miki, redalica)
            vektor <- append(vektor, cor(subset(milkicor, select = sulfate), subset(milkicor, select = nitrate)))
            } 
    }
vektor
}

## 'directory' is a character vector of length 1 indicating
## the location of the CSV files

## 'threshold' is a numeric vector of length 1 indicating the
## number of completely observed observations (on all
## variables) required to compute the correlation between
## nitrate and sulfate; the default is 0

## Return a numeric vector of correlations
