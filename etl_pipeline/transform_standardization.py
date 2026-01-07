import pandas as pd
from sklearn.preprocessing import MinMaxScaler

def standardize_data(df):
    print("📐 Tahap Standardisasi Data")

    df['ScheduledDay'] = pd.to_datetime(df['ScheduledDay']).dt.normalize()
    df['AppointmentDay'] = pd.to_datetime(df['AppointmentDay']).dt.normalize()

    df.columns = [c.lower().replace('-', '_') for c in df.columns]
    df = df.rename(columns={
        'patientid': 'patient_id',
        'appointmentid': 'appointment_id'
    })

    df['gender_enc'] = df['gender'].map({'F': 0, 'M': 1})
    df['target'] = df['no_show'].map({'No': 0, 'Yes': 1})

    scaler = MinMaxScaler()
    df[['age_norm']] = scaler.fit_transform(df[['age']])

    return df

if __name__ == "__main__":
    df = pd.read_csv('datalake/staging_clean.csv')
    df_std = standardize_data(df)
    df_std.to_csv('datalake/staging_standardized.csv', index=False)
