{{ config(materialized='incremental') }}

{%- set source_model = "maintype_stage" -%}
{%- set src_pk = "bki_report_hk" -%}
{%- set src_hashdiff = "maintype_hashdiff" -%}
{%- set src_payload = ["applicantid", "applicationuid", "connectordatadetails",
"createdatetime","uid_","reportdatetime","groupid","infosources" ,"extension"] -%}
{%- set src_ldts = "hdp_datetime" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.sat(src_pk = src_pk, src_hashdiff= src_hashdiff,
                src_payload = src_payload, src_eff=src_eff,
                src_ldts = src_ldts, src_source=src_source,
                source_model=source_model) }}

