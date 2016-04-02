library(data.table)

pollutantmean <- function(directory="specdata",pollutant="sulfate",id=1:332){
  
  ###
  
  #directory  - dir holding all the monitor data files, relative to getwd()
  #pollutant  - "sulfate" or "nitrate"
  #id         - vector of integers specifying monitor data files to work with
  
  #return the mean value of selected pollutant across all specified monitors
  
  #attempts to return sufate data from dir 'specdata' by default
  
  ###
  
  #select the input files from dir according to id. This works because
  #numeric filenames are correctly sorted ascending from list.files()
  input_files=file.path(directory,list.files(directory))[id]
  
  #map over list
  frames=lapply(input_files,read.csv)
  
  #stack 'em all up, instead of calculating mean of each
  #uses package data.table for rbindlist (install.packages("data.table"))
  stacked_frames=rbindlist(frames,use.names=TRUE)
  
  #return the mean asked for
  mean(stacked_frames[[pollutant]],na.rm=TRUE)
}



