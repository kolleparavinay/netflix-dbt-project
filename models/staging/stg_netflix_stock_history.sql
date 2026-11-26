{{ config(materialized='view', schema='staging') }}

select
    cast(TRADE_DATE AS DATE) as date,
    cast(OPEN_PRICE AS DOUBLE) as open,
    cast(HIGH_PRICE AS DOUBLE) as high,
    cast(LOW_PRICE AS DOUBLE) as low,
    cast(CLOSE_PRICE AS DOUBLE) as close,
    cast(VOLUME AS BIGINT) as volume,
    cast(DIVIDENDS AS DOUBLE) as dividends,
    cast(STOCK_SPLITS AS DOUBLE) as stock_splits,

    INGEST_DT as ingest_dt,
    cast(_RESCUED_DATA AS STRING) as _rescued_data,
    cast(_SOURCE_NAME AS STRING) as _source_name,
    cast(_DATASET_NAME AS STRING) as _dataset_name,
    cast(_SOURCE_FILE_PATH AS STRING) as _source_file_path,
    _INGESTION_TIMESTAMP as _ingestion_timestamp,
    cast(_INGESTION_DATE AS DATE) as _ingestion_date,
    cast(_RUN_ID AS STRING) as _run_id

from {{ source('bronze','netflix_stock_history') }}