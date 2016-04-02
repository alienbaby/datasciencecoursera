source(complete)
source()
corr <- function(directory="specdata",threshold=0){
  
  #complete cases per dataset
  ds_c=complete(directory)
  
  #datasets with >threshold complete cases (id col is file index)
  ds_t=ds_c[ds_c$nobs>threshold,]
  
  #files for those datasets
  ds_filenames=file.path(directory,list.files(directory))[ds_t$id]
  
  #dataframes for those datasets
  frames=lapply(ds_filenames,read.csv)
  
  #get vector of correlations between sulfate and nitrate
  #for the dataframes
  unlist(
    lapply(frames,function(x) cor(x["sulfate"],x["nitrate"],
                                  use="complete.obs")))
  
}
