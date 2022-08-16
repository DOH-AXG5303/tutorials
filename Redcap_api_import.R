library(httr)
library(jsonlite)


url <- 'https://qa-redcap.doh.wa.gov/api/'
df_import <- read.csv("R_upload_test.csv")


df_import_json <- toJSON(df_import) #convert to json format



formData_import <- list(token='449E00C202A5360BD1448B82A6D95700', #copy of WAWBE_CDC in QA
                        content='record',
                        format='json',
                        data = df_import_json,
                        returnFormat = "csv")



data <- httr::POST(url, body = formData_import)

