-- ================================
-- INSERT DIMENSION TABLES
-- ================================

-- Insert data ke dim_patient
-- (Data dimuat melalui proses ETL menggunakan Python)

INSERT INTO dim_patient (patient_id, gender)
SELECT DISTINCT patient_id, gender
FROM staging_data;

-- Insert data ke dim_location
INSERT INTO dim_location (neighbourhood, region)
SELECT DISTINCT neighbourhood, region
FROM staging_data;
