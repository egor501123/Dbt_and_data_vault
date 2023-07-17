{{ config(materialized = 'view') }}

SELECT
    maxnextpmt,
    a.nextpmt,
    pmtpat,
    a.hjid,
	b.hjid_loc_loan ,
	a.loan_id,
    a.hdp_datetime AS load_dttm
FROM
    dbt_vault.sf_monthlydetailtype a
LEFT JOIN
dbt_vault.sf_loanstype1 b ON a.loan_id = b.hjid_loc_loan