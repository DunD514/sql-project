SELECT job_id,job_title,name,job_location,job_schedule_type,salary_year_avg,job_posted_date FROM job_postings_fact
LEFT JOIN company_dim
on job_postings_fact.company_id=company_dim.company_id
WHERE  job_title_short='Data Scientist' and ( job_work_from_home=TRUE or job_location='India') and salary_year_avg is not NULL
ORDER BY(salary_year_avg) DESC
LIMIT 10