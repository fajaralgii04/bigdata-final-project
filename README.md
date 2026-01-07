# Big Data Final Project  
## Medical Appointment No-Show Analysis

Repositori ini merupakan implementasi teknis Tugas Besar Big Data yang bertujuan
menganalisis fenomena **ketidakhadiran pasien (No-Show)** pada janji temu medis.
Repositori ini disusun sebagai bukti implementasi pipeline data end-to-end
dan untuk menjamin **reproducibility** serta **transparansi teknis**.

---

## Deskripsi Studi Kasus
Studi kasus menggunakan dataset **Medical Appointment No Shows**
(KaggleV2-May-2016) yang berisi data janji temu pasien rumah sakit.
Dataset mencakup lebih dari 110.000 baris data dengan informasi demografis,
jadwal janji temu, serta status kehadiran pasien.

Untuk memenuhi kriteria multisumber dan multiformat, proyek ini menggunakan:
- Data transaksi janji temu (CSV)
- Data referensi wilayah kesehatan (JSON)

---

## Arsitektur Sistem (Ringkas)
Alur sistem yang diimplementasikan adalah sebagai berikut:

**Raw Data → ETL Pipeline (Python) → Data Lake →  
Data Warehouse (SQLite, Star Schema) → Analisis SQL → Dashboard**

Selain pendekatan ETL, proyek ini juga mengimplementasikan pendekatan **ELT**
sebagai pembanding, di mana transformasi dilakukan langsung di dalam database.

---

## Perbedaan ETL dan ELT pada Proyek Ini

### ETL (Extract, Transform, Load)
- Data diekstraksi dari sumber CSV dan JSON
- Transformasi (cleaning, standardisasi, enrichment, validasi) dilakukan di Python
- Data hasil transformasi disimpan di Data Lake
- Data bersih dimuat ke Data Warehouse

### ELT (Extract, Load, Transform)
- Data mentah dimuat langsung ke database tanpa preprocessing
- Transformasi, filtering, dan feature engineering dilakukan menggunakan SQL
- Hasil ELT disimpan sebagai tabel analitik terpisah

Kedua pipeline **tidak identik** dan diimplementasikan secara terpisah.

---

## Cara Menjalankan Pipeline (Step-by-Step)

### Menjalankan ETL
1. Pastikan data mentah tersedia di folder `raw/`
2. Jalankan script extract pada folder `etl_pipeline/`
3. Jalankan transformasi data (cleaning, standardization, enrichment)
4. Jalankan validasi kualitas data
5. Hasil akhir disimpan sebagai `datalake/transformed_data_ready.csv`
6. Jalankan proses load ke Data Warehouse (SQLite)

### Menjalankan ELT
1. Pastikan data mentah tersedia di folder `raw/`
2. Jalankan script `load_raw.sql` untuk memuat data mentah ke database
3. Jalankan `transform_elt.sql` untuk transformasi in-database
4. Jalankan `aggregation.sql` untuk query agregasi dan analitik ELT

---

## Tools dan Teknologi
- **Python** 3.x  
- **pandas**, **numpy**, **scikit-learn**  
- **SQLite**  
- **SQL**  
- **Looker Studio** (Dashboard)

---

## Catatan
Repositori ini disusun sesuai ketentuan Tugas Besar Big Data.
Seluruh pipeline yang terdokumentasi merupakan implementasi yang benar-benar dijalankan,
bukan sekadar ilustrasi konseptual.
