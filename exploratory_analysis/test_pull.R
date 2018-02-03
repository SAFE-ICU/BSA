library(DBI)
library(RMySQL)
library(dplyr)

rm(list=ls())
con <- dbConnect(MySQL(),  
                 user="tnarasim",
                 password="XM812Ohq-TTz", 
                 host="shahlab-db1.stanford.edu", 
                 port=3306
                  )

rs <- dbSendQuery(con, "SELECT `dictionary_component_LPCH`.`component_id`,
                   `dictionary_component_LPCH`.`name`,
                   `dictionary_component_LPCH`.`base_name`
                   FROM `stride7`.`dictionary_component_LPCH`
                   LIMIT 50;")

d1a <- dbFetch(rs, n = 10)
d1b <- dbFetch(rs)

d2 <- d1b %>% 
  mutate(foo = 2)
