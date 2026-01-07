import pandas as pd
from sklearn.preprocessing import MinMaxScaler

def enrich_data(df, df_region):
    print("➕ Tahap Enrichment & Feature Engineering")

    df = pd.merge(df, df_region, left_on='neighbourhood', right_on='Lokasi', how='left')
    df.drop(columns=['Lokasi'], inplace=True)

    df['waiting_days'] = (df['appointmentday'] - df['scheduledday']).dt.days
    df['waiting_days'] = df['waiting_days'].apply(lambda x: x if x >= 0 else 0)

    df['is_same_day'] = (df['waiting_days'] == 0).astype(int)
    df['day_of_week'] = df['appointmentday'].dt.dayofweek
    df['is_weekend'] = df['day_of_week'].isin([5, 6]).astype(int)

    df['age_group'] = pd.cut(
        df['age'],
        bins=[-1, 12, 25, 60, 101],
        labels=['Anak', 'Remaja', 'Dewasa', 'Lansia']
    )

    scaler = MinMaxScaler()
    df[['waiting_days_norm']] = scaler.fit_transform(df[['waiting_days']])

    return df

if __name__ == "__main__":
    df = pd.read_csv('datalake/staging_standardized.csv')
    df_region = pd.read_json('raw/source2_regions.json')
    df_enrich = enrich_data(df, df_region)
    df_enrich.to_csv('datalake/staging_enriched.csv', index=False)
