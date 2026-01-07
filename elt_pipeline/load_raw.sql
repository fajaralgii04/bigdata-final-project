-- ======================================
-- ELT STEP 1: LOAD RAW DATA (AS-IS)
-- ======================================

DROP TABLE IF EXISTS raw_appointments;
DROP TABLE IF EXISTS raw_regions;

-- Tabel staging untuk data transaksi
CREATE TABLE raw_appointments AS
SELECT *
FROM source1_appointments;

-- Tabel staging untuk data wilayah
CREATE TABLE raw_regions AS
SELECT *
FROM source2_regions;
