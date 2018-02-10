# Visit data

SELECT COUNT(*) 
FROM `stride7`.`SHC_visit_de`;  # 35,516,210

SELECT COUNT(*) 
FROM `stride7`.`SHC_visit_de` 
WHERE YEAR(contact_date) >= 2009;  # 33,588,165

SELECT COUNT(DISTINCT patient_id) # 1,746,856
FROM `stride7`.`SHC_visit_de`;


SELECT COUNT(DISTINCT visit_id) # KEY 
FROM `stride7`.`SHC_visit_de`;

SELECT MIN(contact_date), MAX(contact_date)
FROM `stride7`.`SHC_visit_de`; 

SELECT MIN(contact_date) 
FROM `stride7`.`SHC_visit_de`; # 1989-10-26

# Med data

SELECT COUNT(*) 
FROM `stride7`.`SHC_med_de`; 

SELECT COUNT(DISTINCT patient_id, med_id, medication_id) # KEY (or visit_id)
FROM `stride7`.`SHC_med_de`; 

SELECT COUNT(*) 
FROM `stride7`.`SHC_med_de`
WHERE ordering_mode_c=1;

SELECT MIN(end_time), MAX(end_time), COUNT(DISTINCT end_time)
FROM `stride7`.`SHC_med_de`; 

SELECT COUNT(*) 
FROM `stride7`.`SHC_med_de`
WHERE order_time IS NULL; # zero

SELECT COUNT(*) 
FROM `stride7`.`SHC_med_de`
WHERE medication_id IS NULL;


######## dictionary_medications_SHC_epic

SELECT `dictionary_medications_SHC_EPIC`.`medication_id`,
    `dictionary_medications_SHC_EPIC`.`medication_name`,
    `dictionary_medications_SHC_EPIC`.`generic_name`,
    `dictionary_medications_SHC_EPIC`.`rxcui_str`,
    `dictionary_medications_SHC_EPIC`.`rxcui`,
    `dictionary_medications_SHC_EPIC`.`tty`
FROM `stride7`.`dictionary_medications_SHC_EPIC`;

SELECT DISTINCT(rxcui_str)
FROM `stride7`.`dictionary_medications_SHC_EPIC`;


SELECT COUNT(DISTINCT rxcui_str ) 
FROM `stride7`.`dictionary_medications_SHC_EPIC`;

######## dictionary_medications_SHC_epic

SELECT COUNT(*) 
FROM `stride7`.`dictionary_medications_SHC_EPIC`;
# 170,387

SELECT COUNT(DISTINCT medication_id ) 
FROM `stride7`.`dictionary_medications_SHC_EPIC`;
# 98,872

######## dictionary_medications_hl7

SELECT `dictionary_medications_hl7`.`medication_id`,
    `dictionary_medications_hl7`.`description`,
    `dictionary_medications_hl7`.`rxcui`,
    `dictionary_medications_hl7`.`tty`,
    `dictionary_medications_hl7`.`rxcui_str`,
    `dictionary_medications_hl7`.`USED_AT_STANFORD`
FROM `stride7`.`dictionary_medications_hl7`;

SELECT DISTINCT(tty) 
FROM `stride7`.`dictionary_medications_hl7`;

# ADT

SELECT COUNT(*) 
FROM `stride7`.`SHC_ADT_de`; 

SELECT COUNT(*) 
FROM `stride7`.`SHC_ADT_de`
WHERE event_type_c=1;

SELECT COUNT(*) 
FROM `stride7`.`SHC_ADT_de`
WHERE base_pat_class_c=1; # 177,710

SELECT COUNT(*)
FROM `stride7`.`SHC_ADT_de`
WHERE event_time IS NOT NULL; 

SELECT COUNT(*)
FROM `stride7`.`SHC_ADT_de`
WHERE effective_time IS NOT NULL; 

SELECT COUNT(DISTINCT event_id) # KEY
FROM `stride7`.`SHC_ADT_de`;

SELECT COUNT(DISTINCT patient_id) 
FROM `stride7`.`SHC_ADT_de`;  # 554,528

SELECT COUNT(DISTINCT patient_id) 
FROM `stride7`.`SHC_ADT_de`
WHERE base_pat_class_c = 1; # 102,121

# dx_admit_de

SELECT COUNT(DISTINCT visit_id, dx_id) # KEY
FROM `stride7`.`SHC_dx_admit_de`;


SELECT MIN(admit_date_time), MAX(admit_date_time), COUNT(DISTINCT admit_date_time)
FROM `stride7`.`SHC_dx_admit_de`; 


# dx_hl7_de
SELECT COUNT(*) 
FROM `stride7`.`SHC_dx_hl7_de`
WHERE code IS NOT NULL; # zero

SELECT MIN(contact_date), MAX(contact_date), COUNT(DISTINCT contact_date)
FROM `stride7`.`SHC_dx_hl7_de`; 


# dx_hsp_acct_de

SELECT COUNT(DISTINCT visit_id, dx_id), COUNT(*) 
FROM `stride7`.`SHC_dx_hsp_acct_de`;

SELECT COUNT(*) 
FROM `stride7`.`SHC_dx_hsp_acct_de`
WHERE dx_id IS NOT NULL; # zero

SELECT MIN(admit_date_time), MAX(admit_date_time), COUNT(DISTINCT admit_date_time)
FROM `stride7`.`SHC_dx_hsp_acct_de`; 

# dx_pat_enc_de

SELECT COUNT(DISTINCT visit_id, dx_id), COUNT(DISTINCT visit_id, dx_id, line), COUNT(*) 
FROM `stride7`.`SHC_dx_pat_enc_de`;

SELECT COUNT(*) 
FROM `stride7`.`SHC_dx_pat_enc_de`
WHERE dx_id IS NOT NULL; # zero

SELECT MIN(contact_date), MAX(contact_date), COUNT(DISTINCT contact_date)
FROM `stride7`.`SHC_dx_pat_enc_de`; 

# Demographics

SELECT COUNT(*) 
FROM `stride7`.`demographics`; 


# dx_master

SELECT `dx_master`.`patient_id`,
    `dx_master`.`visit_id`,
    `dx_master`.`contact_date_time`,
    `dx_master`.`AGE_AT_CONTACT_IN_DAYS`,
    `dx_master`.`code`,
    `dx_master`.`code_source`,
    `dx_master`.`table_source`,
    `dx_master`.`dx_hospital`
FROM `stride7`.`dx_master`;

# shc_zc_hosp_admsn_type
SELECT * FROM stride7_dictionaries.shc_zc_hosp_admsn_type;