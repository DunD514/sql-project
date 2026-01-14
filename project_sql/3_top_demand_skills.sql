with top_skills AS(
    SELECT job_postings_fact.job_id,skill_id from job_postings_fact
    INNER JOIN skills_job_dim
    ON job_postings_fact.job_id=skills_job_dim.job_id
    WHERE job_title_short='Data Scientist'
    
)
SELECT skills,count(job_id) as number_of_jobs FROM top_skills
INNER JOIN skills_dim
on top_skills.skill_id=skills_dim.skill_id
GROUP BY(skills)
ORDER BY number_of_jobs DESC
LIMIT 5
