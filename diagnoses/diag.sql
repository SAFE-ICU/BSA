
# dx_admit_de

SELECT * 
FROM `stride7`.`SHC_dx_admit_de`
ORDER BY patient_id;

SELECT COUNT(DISTINCT visit_id, dx_id) # KEY
FROM `stride7`.`SHC_dx_admit_de`;


SELECT MIN(admit_date_time), MAX(admit_date_time), COUNT(DISTINCT admit_date_time)
FROM `stride7`.`SHC_dx_admit_de`; 


# dx_master
SELECT COUNT(*)
FROM `stride7`.`dx_master`;

SELECT DISTINCT code_source
FROM `stride7`.`dx_master`;

SELECT COUNT(*)
FROM `stride7`.`dx_master`
WHERE code_source='TEMP';

SELECT `dx_master`.`patient_id`,
    `dx_master`.`visit_id`,
    `dx_master`.`contact_date_time`,
    `dx_master`.`code`,
    `dx_master`.`code_source`,
    `dx_master`.`table_source`,
FROM `stride7`.`dx_master`;


# shc_clarity_edg
SELECT COUNT(*)
FROM `stride7_dictionaries`.`shc_clarity_edg`;

SELECT COUNT( DISTINCT dx_id) 
FROM `stride7_dictionaries`.`shc_clarity_edg`; # KEY

SELECT `shc_clarity_edg`.`dx_id`,
    `shc_clarity_edg`.`dx_name`,
    `shc_clarity_edg`.`dx_group`,
    `shc_clarity_edg`.`ref_bill_code`,
    `shc_clarity_edg`.`ref_bill_code_set_c`,
    `shc_clarity_edg`.`current_icd9_list`,
    `shc_clarity_edg`.`current_icd10_list`
FROM `stride7_dictionaries`.`shc_clarity_edg`;
