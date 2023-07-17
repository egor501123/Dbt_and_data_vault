{{ config(materialized='table') }}

{%- set source_model = "monthlydetailtype_stage" -%}
{%- set src_pk = "loan_agreements_detail_hk" -%}
{%- set src_hashdiff = "monthlydetailtype_hashdiff" -%}
{%- set src_cdk = "hjid" -%}
{%- set src_payload = ["maxnextpmt", "nextpmt", "pmtpat"] -%}
{%- set src_ldts = "load_dttm" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.ma_sat(src_pk = src_pk, src_hashdiff = src_hashdiff,
                src_payload = src_payload, src_eff=src_eff,
                src_ldts = src_ldts, src_source=src_source,
                source_model=source_model) }}
