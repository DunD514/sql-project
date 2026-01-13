SELECT salary_year_avg,job_title_short,job_id from(
SELECT salary_year_avg,job_title_short,job_id FROM jan_2023_jobs
UNION all
SELECT salary_year_avg,job_title_short,job_id FROM feb_2023_jobs
UNION all
SELECT salary_year_avg,job_title_short,job_id FROM mar_2023_jobs)
WHERE salary_year_avg>70000 and job_title_short='Data Analyst'
GROUP BY
ORDER BY salary_year_avg DESC