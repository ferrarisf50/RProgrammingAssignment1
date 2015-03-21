##setwd("C:/Users/ferrarisf50/Desktop/RProgrammingAssignment1")
##source("pollutantmean.R")


pollutantmean <- function(directory, pollutant, id = 1:332) {
    
       
     files_list <- list.files(directory, pattern="*.csv", full.names = TRUE)
     
     raw2csv <-vector()
  
     
     for ( i in id) 
        {   raw1csv <-  read.csv(files_list[i],header=TRUE)
            
            raw1csv <- subset(raw1csv,select=pollutant)
            
            removena <- is.na(raw1csv)    
            
            raw1csv <- raw1csv[!removena]
            
            raw2csv <- c(raw2csv,raw1csv)
        }
      
     mean(raw2csv)
   
                 
  
}


##pollutantmean("specdata", "sulfate", 1:10)
##pollutantmean("specdata", "nitrate", 70:72)
##pollutantmean("specdata", "nitrate", 23)



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
