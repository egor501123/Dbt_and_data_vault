{{ config(materialized = 'view') }}

SELECT
    a.inquiry1day,
    a.inquiry1week,
    a.inquiry1month,
    a.hjid,
    d.loan_id,
    a.hdp_datetime AS load_dttm
FROM
    dbt_vault.sf_loansoverviewtype a
LEFT JOIN
	dbt_vault.sf_singleformattype b ON a.hjid = b.loansoverview
JOIN
    dbt_vault.sf_loanstype1 c ON b.loans = c.loanstypes_loan_hjid
JOIN
    dbt_vault.sf_monthlydetailtype d ON c.hjid_loc_loan = d.loan_id