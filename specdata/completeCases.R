# Complete Cases

complete<-function(directory, id=1:332){
        # location of the CSV files
        setwd(directory)
        

        
        # capture list of monitor files in dataframe df
        # subset dataframe df by id monitors
        df<-as.data.frame(list.files(path=directory, pattern="^[0-3]"), 
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
        rownames(output)<-1:nrow(output)
        output
        

}