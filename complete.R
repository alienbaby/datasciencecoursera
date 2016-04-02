complete <- function(directory="specdata",id=1:332){
  
  #files for datasets
  filenames=file.path(directory,list.files(directory))[id]
  
  #dataframes for the datasets
  frames=lapply(filenames,read.csv)
  
  #get number of complete cases per frame
  df=data.frame(id=as.integer(sub(".csv","",basename(filenames))),
                nobs=unlist(
                  lapply(
                    lapply(
                      frames,complete.cases), 
                    sum)
                  )
                )
  df
}

