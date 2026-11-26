{{ config(materialized='view', schema='staging') }}

select
cast(review_Id AS STRING) as review_id,
cast(user_Name AS STRING) as user_name,
cast(content AS STRING) as content,
try_cast(score AS DOUBLE) as score,
try_cast(thumbs_Up_Count AS BIGINT) as thumbs_up_count,
cast(review_Created_Version AS STRING) as review_created_version,
try_cast(at AS TIMESTAMP) as at,
cast(app_Version AS STRING) as app_version,
ingest_dt as ingest_dt,
cast(_rescued_data AS STRING) as _rescued_data,
cast(_source_name AS STRING) as _source_name,
cast(_dataset_name AS STRING) as _dataset_name,
cast(_source_file_path AS STRING) as _source_file_path,
_ingestion_timestamp as _ingestion_timestamp,
_ingestion_date  as _ingestion_date,
cast(_run_id AS STRING) as _run_id 

from {{ source('bronze','netflix_reviews') }}
