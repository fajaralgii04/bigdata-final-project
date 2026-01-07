import pandas as pd

def validate_data(df):
    rules = {
        "ID unik": df['appointment_id'].is_unique,
        "Tidak ada null Age": df['age'].isnull().sum() == 0,
        "Range umur valid": (df['age'].min() >= 0) and (df['age'].max() <= 100),
        "Waiting days >= 0": df['waiting_days'].min() >= 0,
        "Tipe tanggal benar": pd.api.types.is_datetime64_any_dtype(df['appointmentday']),
        "Region tidak null": df['Region'].notnull().all()
    }

    valid = True
    for k, v in rules.items():
        print(f"{k:<30}: {'✅' if v else '❌'}")
        if not v:
            valid = False

    return valid

if __name__ == "__main__":
    df = pd.read_csv('datalake/staging_enriched.csv')
    if validate_data(df):
        df.to_csv('datalake/transformed_data_ready.csv', index=False)
        print("✅ Data valid & siap load")
