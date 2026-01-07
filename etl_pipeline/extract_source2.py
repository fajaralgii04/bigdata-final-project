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

def extract_source2(path='raw/source2_regions.json'):
    print("📥 Extract Source 2 (Regions JSON)")
    df = pd.read_json(path)
    log_process("Source 2 - Regions", df, path)
    return df

if __name__ == "__main__":
    extract_source2()
