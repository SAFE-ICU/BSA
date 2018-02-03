SELECT COUNT(*) 
FROM stride7.SHC_med_de;
# 30,000,000

SELECT COUNT(*) 
FROM stride7.dictionary_medications_SHC_EPIC;
# 170,387

SELECT COUNT(*)
FROM stride7.SHC_med_de
INNER JOIN stride7.dictionary_medications_SHC_EPIC 
ON stride7.SHC_med_de.medication_id=stride7.dictionary_medications_SHC_EPIC.medication_id ; 
# 37,000,00


SELECT *
FROM stride7.SHC_med_de
INNER JOIN stride7.dictionary_medications_SHC_EPIC 
ON stride7.SHC_med_de.medication_id=stride7.dictionary_medications_SHC_EPIC.medication_id ; 