# setwd("c:/Users/robmill/Documents/GitHub/R_Programming_Repository")

#setwd("./specdata/")

pollutantmean<-function(directory, pollutant, id=1:332){
        # location of the CSV files
        path<-paste("c:/users/robmill/Documents/Github/R_Programming_Repository/"
                    ,directory,sep = "")
        setwd(path)
        
        # pollutant is a character vector of length 1
        # the name of the pollutant for which we calculate the mean
        # either sulfate or nitrate
        if (pollutant != "sulfate" & pollutant != "nitrate")  {
                #print("Not a valid pollutant name.  Enter 'sulfate' or 'nitrate' for the name of the pollutant.")
                return("Not a valid pollutant name.  Enter 'sulfate' or 'nitrate' for the name of the pollutant.")
        }
        
        # capture list of monitor files in dataframe df
        # subset dataframe df by id monitors
        df<-as.data.frame(list.files(path=".", pattern="^[0-3]"), 
                          stringsAsFactors=FALSE)
        df<-as.data.frame(df[id,],stringsAsFactors=FALSE)

        # instantiate monitor
        # run for loop to read in monitor file
        # and rbind to monitor
        monitor<-NULL
        for (i in 1:nrow(df)) {
                temp<-read.csv(df[i,])
                monitor<-rbind(monitor,temp)
        }
   
        
        # subset monitor for complete cases of pollutant
        monitor<-monitor[complete.cases(monitor[,pollutant]),]
        
        # compute mean
        # round to significant figures matching example output
        pol_mean<-mean(monitor[,pollutant])
        round(pol_mean,3)
        
        
        
}
        