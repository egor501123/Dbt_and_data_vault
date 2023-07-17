{{ config(materialized= 'view') }}

SELECT
	a.currency_cd AS currency_cd,
    a.category AS category,
    a.creditlimit,
    a.lastpaymentdate,
    a.loanstypes_loan_hjid,
	c.documenttypes_document_hjid,
	a.load_dttm


FROM
    dbt_vault.sf_loanstype a
JOIN
    dbt_vault.sf_singleformattype b ON a.loanstypes_loan_hjid = b.loans
JOIN
    dbt_vault.sf_documenttype c ON b.documents = c.documenttypes_document_hjid