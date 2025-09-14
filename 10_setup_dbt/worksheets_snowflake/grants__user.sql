USE ROLE USERADMIN;

CREATE ROLE job_ads_dbt_role;

grant role job_ads_dbt_role TO USER transformer;

GRANT ROLE job_ads_dbt_role TO USER VDeilert;