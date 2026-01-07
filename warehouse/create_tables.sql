-- ================================
-- CREATE TABLES (STAR SCHEMA)
-- ================================

-- Dimension: Patient
CREATE TABLE IF NOT EXISTS dim_patient (
    patient_id REAL PRIMARY KEY,
    gender TEXT
);

-- Dimension: Location
CREATE TABLE IF NOT EXISTS dim_location (
    neighbourhood TEXT PRIMARY KEY,
    region TEXT
);

-- Fact Table: Appointments
CREATE TABLE IF NOT EXISTS fact_appointments (
    appointment_id INTEGER PRIMARY KEY,
    patient_id REAL,
    neighbourhood TEXT,
    appointment_day DATE,
    age REAL,
    waiting_days INTEGER,
    is_weekend INTEGER,
    target INTEGER,
    FOREIGN KEY (patient_id) REFERENCES dim_patient(patient_id),
    FOREIGN KEY (neighbourhood) REFERENCES dim_location(neighbourhood)
);
