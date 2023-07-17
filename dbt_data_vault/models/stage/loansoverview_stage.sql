{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:  "raw_loansoverviewtype"

derived_columns:
  sourse_id : "!cre_loansoverview"
hashed_columns:
  loan_agreements_detail_hk : "loan_id"
  bki_report_hk : "hjid"
  loansoverview_hashdiff :
    is_hashdiff: true
    columns:
      - 'inquiry1day'
      - 'inquiry1week'
      - 'inquiry1month'

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

SELECT *, CONCAT( bki_report_hk, loan_agreements_detail_hk) AS hash_cre_individual_loans
FROM staging