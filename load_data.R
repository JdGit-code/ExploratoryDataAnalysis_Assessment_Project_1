
#----- load_data.R : creates the dataset useful for the project
#----- We assume the R code is executed in the working directory and the file household_power_consumption is present. It's a function without any parameter 
#----- which simply returns the useful datas.
#----- For your information, here is a rough estimate of how much memory the dataset will require in memory 
#----- before reading into R
#----- 2,075,259 rows x 9 columns x 8 bytes/numeric = 149418648 bytes
#----- 149418648  bytes/2^20 bytes/MB = 142.5 MB

if (!require("data.table")) {
  install.packages("data.table")
}
require(data.table)

load.data <- function(){
  
  # read the file with fread from the package read.table 
  data <- fread(input="household_power_consumption.txt",
                sep=";",
                dec=".",
                header=TRUE,
                na.strings="?",
                colClasses=c("chr","chr",rep("num",7)))
  
  # convert the Date and Time variables to Date/Time classes. We use as.POSIXct() instead of strptime()
  data[,":=" (Date=as.Date(Date,format="%d/%m/%Y"),
              Time=as.POSIXct(paste(Date,Time,sep=" "),format="%d/%m/%Y %H:%M:%S"))]
  
  # subset data frome the date 2007-02-01 to the date 2007-02-01
  df <- data[Date%in%c(as.Date("2007-02-01"),as.Date("2007-02-02"))]
  
  return(df)
}
