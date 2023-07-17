{{ config(materialized =  'incremental') }}

{%- set source_model = "monthlydetailtype_stage" -%}
{%- set src_pk = "loan_agreements_detail_hk" -%}
{%- set src_nk = "loan_id" -%}
{%- set src_ldts = "load_dttm" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.hub(src_pk=src_pk, src_nk=src_nk, src_ldts=src_ldts,
                src_source=src_source, source_model=source_model) }}