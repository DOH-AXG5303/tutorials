library(httr)

url <- 'https://redcap.doh.wa.gov/api/'
key <- '32_character_API_token_string'

formData <- list(token=key,
                 content='record',
                 format='csv',
                 returnFormat='csv',
                 rawOrLabel = 'raw'
)

full_response <- httr::POST(url, body = formData)
data <- httr::content(full_response)

