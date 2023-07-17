{{ config(materialized= 'view') }}

SELECT
    a.*,
    d.loan_id
FROM
    dbt_vault.sf_maintype  a
LEFT JOIN
	dbt_vault.sf_singleformattype b ON a.hjid = b.main
JOIN
dbt_vault.sf_loanstype1 c ON b.loans = c.loanstypes_loan_hjid
JOIN
 dbt_vault.sf_monthlydetailtype d ON c.hjid_loc_loan = d.loan_id