{{ config(materialized= 'view') }}

SELECT
    a.firstname AS first_name,
    a.secondname AS middle_name,
    a.lastname AS last_name,
	a.nametypes_name__hjid,
    a.hjid as hjid,
    c.loanstypes_loan_hjid,
    a.birthplace AS birth_place_nm,
    a.birthdate AS birth_dt,
    TO_TIMESTAMP(a.hdp_datetime, 'YYYY-MM-DD HH24:MI:SS') AS load_dttm
FROM
    dbt_vault.sf_nametype a
JOIN
    dbt_vault.sf_singleformattype b ON a.nametypes_name__hjid = b.names_
JOIN
    dbt_vault.sf_loanstype c ON c.loanstypes_loan_hjid = b.loans










