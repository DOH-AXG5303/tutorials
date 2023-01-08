# Script information ----

## Title: ----

#Pull WDRS ELR cases into a table to reconcile with excel line list 

## Purpose: ----

# The purpose of this script is to scrape new ELR results from WDRS/
#   relevant information for easy entry into the MPV excel line list. 
# This is meant to be a stop gap until REDCap case reporting is fully actualized.

# Note: this could remain in place to estimate new suspect/probable/confirmed cases
# received daily. 

## Version date: -----

# 07/12/2022 - code created

## Author: ----

# Nailah Smith Nailah.Smith@doh.wa.gov


# Setup ----

## Load libraries

library(pacman)
library(dplyr)

p_load(odbc,
       tidyverse,
       lubridate,
       sqldf,
       rio,
       here)

## connect to WDRS 

wdrs <- DBI::dbConnect(odbc::odbc(),
                       Driver = "SQL Server",
                       Server = "WDRSDBPR,9799",
                       Database = "WDRS",
                       Trusted_connection = "yes",
                       ApplicationIntent = "ReadOnly")

# Data wrangling ----

## select orthopox tests from ELR table ----

elr <- dbGetQuery(wdrs,
                  "select distinct
                  CASE_ID,
                  CREATE_DATE,
                  FIRST_NAME,
                  LAST_NAME,
                  PATIENT__DATE__OF__BIRTH,
                  PATIENT__AGE,
                  PATIENT__ADDRESS__COUNTY,
                 PATIENT__RACE,
                  WDRS__LAB__RACE,
                  WDRS__LAB__RACE__SPECIFY,
                  WDRS__LAB__ETHNICITY,
                  WDRS__LAB__ETHNICITY__SPECIFY,
                  PATIENT__ETHNICITY,
                  SUBMITTER,[]
                  SPECIMEN__COLLECTION__DTTM,
                  SPECIMEN__RECEIVED__DTTM,
                  RESULT__REPORT__DTTM,
                  TEST__PERFORMED__DESC,
                  OBSERVATION__DTTM,
                  ANALYSIS__DTTM,
                  TEST__RESULT
                  from
                    DD_ELR_DD_ENTIRE_VALUES
                  where
                    CODE = 'RARE'
                  AND
                    (TEST__PERFORMED__DESC
                  LIKE
                    '%monkeypox%' 
                  OR
                     TEST__PERFORMED__DESC
                  LIKE 
                    '%orthopox%')"
)

