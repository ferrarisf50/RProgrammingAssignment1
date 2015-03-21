
source("complete.R")

corr <- function(directory, threshold = 0) {
 
  temp3<- complete(directory, 1:332)
  temp3<- subset(temp3,nobs>threshold)

if (length(temp3)==0) 
  {
  files_list <- list.files(directory, pattern="*.csv", full.names = TRUE)
  

  raw2csv <-vector()
  
  
    for ( i in 1:length(temp3[,1]) )
     {   raw1csv <-  read.csv(files_list[temp3[i,1]],header=TRUE)
      
      
      raw1csv <- na.omit(raw1csv)
      temp4 <- cor(raw1csv$sulfate,raw1csv$nitrate)
      raw2csv <- c(raw2csv,temp4)
     }
  
  return(raw2csv)
  }

else return(0)

}


cr <- corr("specdata", 150)
head(cr)
summary(cr)
cr <- corr("specdata", 400)
head(cr)
summary(cr)

cr <- corr("specdata", 5000)
summary(cr)
length(cr)

cr <- corr("specdata")
summary(cr)
length(cr)
