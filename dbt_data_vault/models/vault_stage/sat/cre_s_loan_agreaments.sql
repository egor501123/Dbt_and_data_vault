{{ config(materialized='incremental') }}

{%- set source_model = "loanstype_stage" -%}
{%- set src_pk = "loan_agreements_hk" -%}
{%- set src_hashdiff = "loanstype_hashdiff" -%}
{%- set src_payload = ["category", "creditlimit", "lastpaymentdate"] -%}
{%- set src_ldts = "load_dttm" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.sat(src_pk = src_pk, src_hashdiff= src_hashdiff,
                src_payload = src_payload, src_eff=src_eff,
                src_ldts = src_ldts, src_source=src_source,
                source_model=source_model) }}

