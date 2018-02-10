# Everyone with inpatient admission - their first visit
SELECT 
    `SHC_visit_de`.`patient_id`,
    `SHC_visit_de`.`contact_date`,
    `SHC_visit_de`.`enc_type_c`,
    `SHC_visit_de`.`department_id`,
    `SHC_visit_de`.`hosp_admsn_type_c`,
    `SHC_visit_de`.`visit_fc`,
    `SHC_visit_de`.`hosp_admsn_time`,
    `SHC_visit_de`.`hosp_disch_time`
FROM
    `stride7`.`SHC_visit_de`
WHERE
    YEAR(hosp_admsn_time) >= 2009
        AND hosp_admsn_time != '0000-00-00'
        AND hosp_disch_time != '0000-00-00';


SELECT 
    COUNT(*), COUNT(DISTINCT patient_id) 
FROM
    `stride7`.`SHC_visit_de`
WHERE
    YEAR(hosp_admsn_time) >= 2009
        AND hosp_admsn_time != '0000-00-00'
        AND hosp_disch_time != '0000-00-00'; 


### Check against the base_pat_class_c == 1 in the ADT table
SELECT 
    `SHC_ADT_de`.`patient_id`,
    `SHC_ADT_de`.`event_time`
FROM `stride7`.`SHC_ADT_de`
WHERE YEAR(event_time) >= 2009 
AND base_pat_class_c = 1; 

SELECT COUNT(*)
FROM `stride7`.`SHC_ADT_de`
WHERE YEAR(event_time) >= 2009 
AND base_pat_class_c = 1; # 177,710




# Everyone with inpatient admission 
#   - their medications while inpatient


# Everyone with inpatient admission 
#   - their medications while inpatient
#   - demographic data


# Everyone with inpatient admission 
#   - medications
#   - demographic data
#   - diagnoses (within time window after admissions?)


# Everyone with inpatient admission 
#   - medications
#   - demographic data
#   - diagnoses (within time window after admissions?)

# Everyone with inpatient admission 
#   - medications
#   - demographic data
#   - diagnoses (within time window after admissions?)