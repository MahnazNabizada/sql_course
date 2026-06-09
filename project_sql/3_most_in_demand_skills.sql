--- what are the most in demand for my role (data analyst) ? ---

/* ans: SQL is the most in-demand skill for remote Data Analyst positions, appearing in 7,291 job postings.
Excel (4,611) and Python (4,330) are the next most requested skills.
Tableau (3,745) and Power BI (2,609) are also highly sought after for data visualization and reporting.
Overall, employers primarily seek candidates with strong SQL, Excel, Python, and visualization tool skills.*/


select 
    skills,
    count(skills_job_dim.job_id) as demand_count
from job_postings_fact
inner JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_work_from_home = TRUE
GROUP BY skills
order by demand_count DESC
LIMIT 5;