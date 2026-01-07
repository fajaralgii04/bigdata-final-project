-- ======================================
-- ELT STEP 3: ANALYTICAL AGGREGATION
-- ======================================

-- 1. Rasio No-Show per Region
SELECT
    region,
    COUNT(*) AS total_appointment,
    ROUND(AVG(target) * 100, 2) AS persen_no_show
FROM fact_elt_analytics
GROUP BY region
ORDER BY persen_no_show DESC;

-- 2. Rata-rata Waiting Days berdasarkan Status
SELECT
    CASE
        WHEN target = 1 THEN 'Tidak Hadir'
        ELSE 'Hadir'
    END AS status,
    ROUND(AVG(waiting_days), 1) AS avg_waiting_days
FROM fact_elt_analytics
GROUP BY target;

-- 3. No-Show berdasarkan Kelompok Umur
SELECT
    age_group,
    COUNT(*) AS total,
    ROUND(AVG(target) * 100, 2) AS persen_no_show
FROM fact_elt_analytics
GROUP BY age_group
ORDER BY persen_no_show DESC;
