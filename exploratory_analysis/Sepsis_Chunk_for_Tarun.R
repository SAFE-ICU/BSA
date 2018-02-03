


########## Sepsis defined by Angus criteria

########### Explicit Sepsis

sepsis_codes <- c("995.91","995.92","785.52") #### Code 995.91 ###########  Alsolook at ICD 10 codes for septicemia

########## Infection + Organ Dysfunction


infection3digit <- c('001','002','003','004','005','008',
                     '009','010','011','012','013','014','015','016','017','018',
                     '020','021','022','023','024','025','026','027','030','031',
                     '032','033','034','035','036','037','038','039','040','041',
                     '090','091','092','093','094','095','096','097','098','100',
                     '101','102','103','104','110','111','112','114','115','116',
                     '117','118','320','322','324','325','420','421','451','461',
                     '462','463','464','465','481','482','485','486','494','510',
                     '513','540','541','542','566','567','590','597','601','614',
                     '615','616','681','682','683','686','730')
infection4digit <- c('569.5','572.0','572.1','575.0','599.0','711.0',
                     '790.7','996.6','998.5','999.3')
infection5digit <- c('491.21','562.01','562.03','562.11','562.13', '569.83')

infection_codes <- c(infection3digit, infection4digit, infection5digit)

infection_table <- con %>% 
  tbl("dictionary_diagnoses_SHC_exploded_icd9") %>%
  filter(icd9_split %in% infection_codes) %>%
  collect() 

########### Make sure that the ICD 9 codes are also queried 

infection_dx <- unique(infection_table$dx_id)

OD_Codes <- c('785.5','458','348.3','293','348.1','287.4','287.5','286.9')
OD_table <- con %>% 
  tbl("dictionary_diagnoses_SHC_exploded_icd9") %>%
  filter(icd9_split %in% OD_Codes) %>%
  collect() 

OD_dx <- unique(OD_table$dx_id)