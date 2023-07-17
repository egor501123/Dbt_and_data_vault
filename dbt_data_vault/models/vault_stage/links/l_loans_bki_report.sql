{{ config(materialized =  'incremental') }}

{%- set source_model = "maintype_stage" -%}
{%- set src_pk = "hash_cre_report_loan" -%}
{%- set src_fk = ["loan_agreements_detail_hk", "bki_report_hk"] -%}
{%- set src_ldts = "hdp_datetime" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}
