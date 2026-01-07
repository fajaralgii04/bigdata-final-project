-- ======================================
-- ELT STEP 2: IN-DATABASE TRANSFORMATION
-- ======================================

DROP TABLE IF EXISTS fact_elt_analytics;

CREATE TABLE fact_elt_analytics AS
SELECT
    r.AppointmentID AS appointment_id,
    r.PatientId AS patient_id,
    r.Gender AS gender,
    r.Age AS age,
    w.Region AS region,

    -- Feature Engineering
    CAST((julianday(r.AppointmentDay) - julianday(r.ScheduledDay)) AS INTEGER)
        AS waiting_days,

    CASE
        WHEN r."No-show" = 'Yes' THEN 1
        ELSE 0
    END AS target,

    CASE
        WHEN r.Age <= 12 THEN 'Anak'
        WHEN r.Age <= 25 THEN 'Remaja'
        WHEN r.Age <= 60 THEN 'Dewasa'
        ELSE 'Lansia'
    END AS age_group

FROM raw_appointments r
LEFT JOIN raw_regions w
    ON r.Neighbourhood = w.Lokasi

WHERE r.Age BETWEEN 0 AND 100
GROUP BY r.AppointmentID;
