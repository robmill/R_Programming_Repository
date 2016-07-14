# Crrelation of complete cases

corr<-function(directory, threshold=0){
        
        path<-paste("c:/users/robmill/Documents/Github/R_Programming_Repository/"
                    ,directory,sep = "")
        setwd(path)
        
        # capture list of monitor files in dataframe df
        # subset dataframe df by id monitors
        df<-as.data.frame(list.files(path=".", pattern="^[0-3]"), 
                          stringsAsFactors=FALSE)
        df<-as.data.frame(df[id,],stringsAsFactors=FALSE)
        
        df_complete<-complete(directory)
        df_complete<-df_complete[df_complete$nobs>threshold,]

        
        
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

        
        
}