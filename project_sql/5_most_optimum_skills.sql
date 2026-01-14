with top_skills as (
    SELECT job_postings_fact.job_id,skill_id,salary_year_avg FROM job_postings_fact
    INNER JOIN skills_job_dim
    on job_postings_fact.job_id=skills_job_dim.job_id
    WHERE salary_year_avg is NOT NULL and job_title_short ='Data Scientist'
 
)
SELECT skills_dim.skill_id,skills,count(job_id) as number_of_jobs,round(avg(salary_year_avg),0) as average_salary FROM top_skills
INNER JOIN skills_dim
on top_skills.skill_id=skills_dim.skill_id
GROUP BY(skills_dim.skill_id) 
ORDER BY number_of_jobs desc, average_salary DESC 
LIMIT 25