library(httr)

url <- 'https://redcap.doh.wa.gov/api/'

formData <- list(token='',
                 content='record',
                 format='csv',
                 returnFormat='csv',
                 rawOrLabel = 'raw'
)

data <- httr::POST(url, body = formData, encode = "form")
data <- httr::content(data)

