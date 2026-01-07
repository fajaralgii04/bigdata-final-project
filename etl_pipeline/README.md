# ETL Pipeline

Folder ini berisi implementasi **ETL (Extract, Transform, Load)** berbasis Python
untuk memproses data janji temu medis hingga siap dimuat ke Data Warehouse.

## Sumber Data
- **CSV**: `raw/source1_appointments.csv` (data transaksi janji temu, mengandung noise)
- **JSON**: `raw/source2_regions.json` (data referensi wilayah)

## Struktur ETL
etl_pipeline/

├── extract_source1.py

├── extract_source2.py

├── transform_cleaning.py

├── transform_standardization.py

├── transform_enrichment.py

├── data_validation.py

└── load_warehouse.py



## Tahapan Proses
- **Extract**: membaca data CSV dan JSON dengan logging dasar.
- **Transform**:
  - Cleaning: deduplikasi, imputasi missing value, dan penghapusan outlier.
  - Standardisasi: format tanggal, rename kolom, encoding, dan normalisasi.
  - Enrichment: join data wilayah dan feature engineering.
- **Validation**: pengecekan kualitas data (unik, null, range, tipe data).
- **Load**: memuat data akhir ke Data Warehouse (SQLite).

## Cara Menjalankan
Jalankan script secara berurutan:
`extract → transform → validate → load`.

## Catatan
Pipeline bersifat modular dan dirancang untuk menjamin keterlacakan proses serta reproducibility.
