-- 1. Total transaksi
SELECT COUNT(*) AS total_antrean
FROM fact_appointments;

-- 2. Rasio no-show
SELECT
    CASE WHEN target = 1 THEN 'Tidak Hadir' ELSE 'Hadir' END AS status,
    COUNT(*) AS jumlah,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM fact_appointments), 2) AS persentase
FROM fact_appointments
GROUP BY target;

-- 3. Top 5 neighbourhood
SELECT neighbourhood, COUNT(*) AS total_pasien
FROM fact_appointments
GROUP BY neighbourhood
ORDER BY total_pasien DESC
LIMIT 5;

-- 4. Analisis gender
SELECT
    p.gender,
    COUNT(f.appointment_id) AS total_janji,
    ROUND(AVG(f.target) * 100, 2) AS persen_no_show
FROM fact_appointments f
JOIN dim_patient p ON f.patient_id = p.patient_id
GROUP BY p.gender;

-- 5. Waiting days vs kehadiran
SELECT
    CASE WHEN target = 1 THEN 'Tidak Hadir' ELSE 'Hadir' END AS status,
    ROUND(AVG(waiting_days), 1) AS rata_rata_hari_tunggu
FROM fact_appointments
GROUP BY target;

-- 6. Weekend analysis
SELECT
    CASE WHEN is_weekend = 1 THEN 'Akhir Pekan' ELSE 'Hari Kerja' END AS tipe_hari,
    ROUND(AVG(target) * 100, 2) AS persen_no_show
FROM fact_appointments
GROUP BY is_weekend;

-- 7. Sebaran region
SELECT
    l.region,
    COUNT(*) AS jumlah_pasien
FROM fact_appointments f
JOIN dim_location l ON f.neighbourhood = l.neighbourhood
GROUP BY l.region;

-- 8. Kelompok umur
SELECT
    CASE
        WHEN age <= 12 THEN 'Anak-anak'
        WHEN age <= 25 THEN 'Remaja'
        WHEN age <= 60 THEN 'Dewasa'
        ELSE 'Lansia'
    END AS kategori_umur,
    ROUND(AVG(target) * 100, 2) AS persen_no_show
FROM fact_appointments
GROUP BY kategori_umur;
