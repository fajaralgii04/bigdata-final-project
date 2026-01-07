import pandas as pd
import os
from datetime import datetime

def log_process(nama_sumber, data, path_file):
    ukuran = os.path.getsize(path_file) / 1024
    waktu = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    print(f"📄 LOG: {nama_sumber}")
    print(f"   - Waktu   : {waktu}")
    print(f"   - Ukuran  : {ukuran:.2f} KB")
    print(f"   - Data    : {data.shape[0]} Baris, {data.shape[1]} Kolom")
    print("----------------------------------------")

def extract_source1(path='raw/source1_appointments.csv'):
    print("📥 Extract Source 1 (Appointments CSV)")
    df = pd.read_csv(path)
    log_process("Source 1 - Appointments", df, path)
    return df

if __name__ == "__main__":
    extract_source1()
