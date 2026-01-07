import pandas as pd

def clean_data(df):
    print("🧹 Tahap Data Cleaning")

    awal = len(df)
    df = df.drop_duplicates(subset=['AppointmentID'], keep='first')
    print(f"Duplikat dihapus: {awal - len(df)} baris")

    median_age = df['Age'].median()
    df['Age'] = df['Age'].fillna(median_age)
    print("Missing value Age diisi median")

    sebelum = len(df)
    df = df[(df['Age'] >= 0) & (df['Age'] <= 100)]
    print(f"Outlier dihapus: {sebelum - len(df)} baris")

    return df

if __name__ == "__main__":
    df = pd.read_csv('raw/source1_appointments.csv')
    df_clean = clean_data(df)
    df_clean.to_csv('datalake/staging_clean.csv', index=False)
