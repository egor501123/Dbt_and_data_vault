{{ config(materialized =  'incremental') }}

{%- set source_model = "monthlydetailtype_stage" -%}
{%- set src_pk = "hash_cre_loan_agreements_details" -%}
{%- set src_fk = ["loan_agreements_detail_hk", "loan_agreements_hk"] -%}
{%- set src_ldts = "load_dttm" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}

