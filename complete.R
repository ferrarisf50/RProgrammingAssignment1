complete <- function(directory, id = 1:332) {
  files_list <- list.files(directory, pattern="*.csv", full.names = TRUE)
  
  temp <- data.frame(id=numeric(),nobs=numeric())
  length(id) 
  
  for ( i in 1:length(id)  )
  {   raw1csv <-  read.csv(files_list[id[i]],header=TRUE)
      
      temp[i,1] <- id[i]
      temp[i,2] <- nrow(na.omit(raw1csv))
      ## temp<- rbind(temp,c(id[i], nrow(na.omit(raw1csv))))
      
  }
  print(temp)
}

##complete("specdata", 1)
##complete("specdata", c(2, 4, 8, 10, 12))
##complete("specdata", 30:25)
##complete("specdata", 3)
