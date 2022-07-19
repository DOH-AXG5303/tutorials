library(httr)
library(png)

url <- "https://apod.nasa.gov/apod/image/2207/STScI-WebbSouthernRing.png"

full_response <- httr::GET(url)

data <- httr::content(full_response, "raw")

writeBin(data, "my_file.png")
