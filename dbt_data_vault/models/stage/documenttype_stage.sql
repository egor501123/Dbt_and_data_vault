{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:  "raw_documenttype"

derived_columns:
  sourse_id : "!cre_sf_documenttype"
hashed_columns:
  party_individual_hjid_hk : "documenttypes_document_hjid"
  loan_agreements_hk: "loanstypes_loan_hjid"
  documenttype_hashdiff:
    is_hashdiff: true
    columns:
      - 'country_hk'
      - 'id_cart_num'
      - 'id_card_series_num'

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

SELECT *, CONCAT(party_individual_hjid_hk, loan_agreements_hk) AS hash_cre_loan_agreements_details
FROM staging