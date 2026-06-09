/* what are the top skills based on salary on my role?*/


select 
    skills,
    round (Avg(salary_year_avg), 0) as average_salary
from job_postings_fact
inner JOIN skills_job_dim on job_postings_fact.job_id = skills_job_dim.job_id
inner join skills_dim on skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst' 
    and salary_year_avg is not null
    AND job_work_from_home = TRUE
GROUP BY skills
order by average_salary DESC
LIMIT 25;


/* Ans: 
  Highest pay = Big data tools: PySpark (~$208K) leads by a large margin, showing strong demand for large-scale data processing.
  Data engineering skills dominate: Databricks, Airflow, Scala, Kubernetes all indicate higher salaries when analysts can build/maintain data pipelines.
  Cloud + infrastructure is key: GCP, Linux, Kubernetes show cloud-ready analysts earn more.
  ML/AI boosts salary: DataRobot, Watson, Scikit-learn show predictive/AI skills increase pay.
  Programming > reporting: Languages/tools (Golang, Swift, Python libs) outperform traditional BI roles.
  DevOps tools matter: GitLab, Bitbucket, Jenkins suggest collaboration with engineering teams increases value.
  Databases still important: PostgreSQL, Elasticsearch, Couchbase remain high-value but secondary to big data/cloud skills.

Main trend: salaries rise as data analysts move toward data engineering + cloud + ML roles, not pure reporting.*/
