{{ config(materialized='view') }}

{%- set yaml_metadata -%}
source_model:  "raw_nametype"

derived_columns:
  sourse_id : "!cre_sf_nametype"
hashed_columns:
  party_individual_hjid_hk : "nametypes_name__hjid"
  loan_agreements_hk: "loanstypes_loan_hjid"
  nametype_hashdiff :
    is_hashdiff: true
    columns:
      - 'first_name'
      - 'middle_name'
      - 'last_name'
      - 'birth_dt'
      - 'birth_place_nm'
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