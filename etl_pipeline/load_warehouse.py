import sqlite3
import pandas as pd

def load_to_warehouse(db='medical_warehouse.db'):
    print("📦 Load ke Data Warehouse")

    df = pd.read_csv('datalake/transformed_data_ready.csv')
    conn = sqlite3.connect(db)

    df.to_sql('fact_appointments', conn, if_exists='replace', index=False)
    conn.close()

    print("✅ Load selesai")

if __name__ == "__main__":
    load_to_warehouse()
