with req_skills as (
    SELECT skill_id,skills FROM skills_dim
    GROUP BY(skill_id)

)
select req_skills.skill_id,number_of_jobs,skills FROM (
SELECT count(job_postings_fact.job_id) as number_of_jobs,skill_id 
FROM job_postings_fact
left join skills_job_dim
on job_postings_fact.job_id=skills_job_dim.job_id
GROUP BY(skill_id)) as job_count
LEFT JOIN req_skills
on job_count.skill_id=req_skills.skill_id
ORDER BY (number_of_jobs) desc
LIMIT 5