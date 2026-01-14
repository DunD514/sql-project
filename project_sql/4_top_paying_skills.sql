with top_skills as (
    SELECT salary_year_avg,skills_job_dim.skill_id,job_title_short FROM job_postings_fact
    INNER JOIN skills_job_dim
    on job_postings_fact.job_id=skills_job_dim.job_id
    WHERE salary_year_avg is NOT NULL and job_title_short ='Data Scientist'

)
SELECT skills,round(avg(salary_year_avg),0) as average_salary
FROM top_skills
INNER JOIN skills_dim
on top_skills.skill_id=skills_dim.skill_id
GROUP BY(skills)
ORDER BY average_salary DESC
LIMIT 5