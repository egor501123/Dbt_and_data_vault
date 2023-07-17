{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:  "raw_monthlydetailtype"

derived_columns:
  sourse_id : "!cre_monthlydetailtype"
hashed_columns:
  loan_agreements_detail_hk : "loan_id"
  loan_agreements_hk : "hjid"
  monthlydetailtype_hashdiff :
    is_hashdiff: true
    columns:
      - 'maxnextpmt'
      - 'nextpmt'
      - 'pmtpat'

{%- endset -%}

{% set metadata_dict = fromyaml(yaml_metadata) %}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set hashed_columns = metadata_dict['hashed_columns'] %}

WITH staging AS (
{{ dbtvault.stage(include_source_columns=true,
                  source_model=source_model,
                  derived_columns=derived_columns,
                  hashed_columns=hashed_columns,
                  ranked_columns=none) }}
)

SELECT *, CONCAT(loan_agreements_detail_hk, loan_agreements_hk) AS hash_cre_loan_agreements_details
FROM staging