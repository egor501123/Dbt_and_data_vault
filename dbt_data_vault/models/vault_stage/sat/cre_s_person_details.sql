{{ config(materialized='table') }}

{%- set source_model = "nametype_stage" -%}
{%- set src_pk = "party_individual_hjid_hk" -%}
{%- set src_hashdiff = "nametype_hashdiff" -%}
{%- set src_cdk = "hjid" -%}
{%- set src_payload = ["first_name", "middle_name","last_name","birth_dt","birth_place_nm"] -%}
{%- set src_ldts = "load_dttm" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.ma_sat(src_pk = src_pk, src_hashdiff = src_hashdiff,
                src_payload = src_payload, src_eff=src_eff,
                src_ldts = src_ldts, src_source=src_source,
                source_model=source_model) }}









