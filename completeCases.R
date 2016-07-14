# Complete Cases

complete<-function(directory, id=1:332){
        
        path<-paste("c:/users/robmill/Documents/Github/R_Programming_Repository/"
                    ,directory,sep = "")
        setwd(path)
        
        # capture list of monitor files in dataframe df
        # subset dataframe df by id monitors
        df<-as.data.frame(list.files(path=".", pattern="^[0-3]"), 
                          stringsAsFactors=FALSE)
        df<-as.data.frame(df[id,],stringsAsFactors=FALSE)
        
        output<-NULL
        temp<-NULL
        
        # read each monitor file, rbind to dataframe monitor
        for (i in 1:nrow(df)) {
                
                monitor<-read.csv(df[i,])
                id<-unique(monitor[,"ID"])
                monitor<-monitor[complete.cases(monitor),]
                temp$id<-id
                temp$nobs<-nrow(monitor)
                output<-rbind(output,temp)
        
        }
        
        # reset row names, return output
        rownames(output)<-1:nrow(output)
        output
        

}