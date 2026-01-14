with skill_id_selection as (
    SELECT job_postings_fact.job_id,job_title,job_location,job_schedule_type,salary_year_avg,job_posted_date,skill_id,name
    from job_postings_fact
    inner JOIN skills_job_dim
    on job_postings_fact.job_id=skills_job_dim.job_id
    LEFT JOIN company_dim
on job_postings_fact.company_id=company_dim.company_id
    WHERE  job_title_short='Data Scientist' and ( job_work_from_home=TRUE or job_location='India') and salary_year_avg is not NULL

)
SELECT job_id,name,job_title,skills,salary_year_avg,job_posted_date
FROM skill_id_selection
inner JOIN skills_dim
on skill_id_selection.skill_id=skills_dim.skill_id
ORDER BY(salary_year_avg) DESC
limit 10
