{{ config(materialized = 'view') }}

SELECT
    c.id_country AS country_hk,
    c.num AS id_cart_num,
    c.series AS id_card_series_num,
    c.hjid,
    c.documenttypes_document_hjid,
    a.loanstypes_loan_hjid AS loanstypes_loan_hjid,
    c.hdp_datetime AS load_dttm
FROM
    dbt_vault.sf_loanstype a
JOIN
    dbt_vault.sf_singleformattype b ON a.loanstypes_loan_hjid = b.loans
JOIN
    dbt_vault.sf_documenttype c ON b.documents = c.documenttypes_document_hjid

