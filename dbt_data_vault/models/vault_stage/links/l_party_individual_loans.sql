{{ config(materialized =  'incremental') }}

{%- set source_model = "nametype_stage" -%}
{%- set src_pk = "hash_cre_individual_loans" -%}
{%- set src_fk = ["loan_agreements_hk", "party_individual_hjid_hk"] -%}
{%- set src_ldts = "load_dttm" -%}
{%- set src_source = "sourse_id" -%}

{{ dbtvault.link(src_pk=src_pk, src_fk=src_fk, src_ldts=src_ldts,
                 src_source=src_source, source_model=source_model) }}