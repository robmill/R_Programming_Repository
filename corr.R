# Crrelation of complete cases
source("c:/users/robmill/Documents/Github/R_Programming_Repository/completeCases.R")

corr<-function(directory, threshold=0){
        
        path<-paste("c:/users/robmill/Documents/Github/R_Programming_Repository/"
                    ,directory,sep = "")
        setwd(path)
        
        # capture list of monitor files in dataframe df
        # subset dataframe df by id monitors
        df<-as.data.frame(list.files(path=".", pattern="^[0-3]"), 
                          stringsAsFactors=FALSE)
        
        df_complete<-as.data.frame(complete(directory))
        df_complete<-df_complete[df_complete$nobs>threshold,]

        
        


        
        df_complete
}