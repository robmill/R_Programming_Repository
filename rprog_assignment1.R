# setwd("c:/Users/robmill/Documents/GitHub/R_Programming_Repository")

#setwd("./specdata/")

pollutantmean<-function(directory, pollutant, id=1:332){
        # location of the CSV files
        setwd(directory)
        
        pollutant<-tolower(pollutant)
        
        # pollutant is a character vector of length 1
        # the name of the pollutant for which we calculate the mean
        # either sulfate or nitrate
        if (pollutant != "sulfate" & pollutant != "nitrate")  {
                #print("Not a valid pollutant name.  Enter 'sulfate' or 'nitrate' for the name of the pollutant.")
                return("Not a valid pollutant name.  Enter 'sulfate' or 'nitrate' for the name of the pollutant.")
        }
        
        # capture list of monitor files in dataframe df
        # subset dataframe df by id monitors
        df<-as.data.frame(list.files(path=directory, pattern="^[0-3]"), 
                          stringsAsFactors=FALSE)
        df<-as.data.frame(df[id,],stringsAsFactors=FALSE)
        
        # read each monitor file, rbind to dataframe monitor
        monitor<-read.csv(df[1,])
        if(nrow(df)>1){
                for (i in 2:nrow(df)) {
                        temp<-read.csv(df[i,])
                        monitor<-rbind(monitor,temp)
                }
        }
        
        # subset monitor for complete cases of pollutant
        monitor<-monitor[complete.cases(monitor[,pollutant]),]
        
        # return mean
        pol_mean<-mean(monitor[,pollutant])
        round(pol_mean,3)
        
        
        
}
        