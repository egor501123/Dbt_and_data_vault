{{ config(materialized =  'incremental') }}

{%- set source_model = "maintype_stage" -%}
{%- set src_pk = "bki_report_hk" -%}
{%- set src_nk = "hjid" -%}
{%- set src_ldts = "hdp_datetime" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}











