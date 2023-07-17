{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:  "raw_sf_loanstype"
derived_columns:
  sourse_id : "!cre_sf_loanstype"
hashed_columns:
  loan_agreements_hk : "loanstypes_loan_hjid"
  party_individual_hjid_hk : "documenttypes_document_hjid"
  loanstype_hashdiff :
    is_hashdiff: true
    columns:
      - 'currency_cd'
      - 'category'
      - 'creditlimit'
      - 'lastpaymentdate'

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

SELECT *, CONCAT(party_individual_hjid_hk, loan_agreements_hk) AS hash_cre_individual_loans
FROM staging

