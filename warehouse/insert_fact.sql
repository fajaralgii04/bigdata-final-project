-- ================================
-- INSERT FACT TABLE
-- ================================

INSERT INTO fact_appointments (
    appointment_id,
    patient_id,
    neighbourhood,
    appointment_day,
    age,
    waiting_days,
    is_weekend,
    target
)
SELECT
    appointment_id,
    patient_id,
    neighbourhood,
    appointment_day,
    age,
    waiting_days,
    is_weekend,
    target
FROM staging_data;
