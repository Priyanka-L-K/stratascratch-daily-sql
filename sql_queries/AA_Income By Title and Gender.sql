SELECT 
    se.employee_title, 
    se.sex, 
    AVG(se.salary + total_bonus) AS avg_total_compensation
FROM 
    sf_employee se
JOIN (
    SELECT 
        worker_ref_id, 
        SUM(bonus) AS total_bonus
    FROM 
        sf_bonus
    GROUP BY 
        worker_ref_id
) sb ON se.id = sb.worker_ref_id
GROUP BY 
    se.employee_title, se.sex
ORDER BY 
    avg_total_compensation DESC;

-- Bonus duplication:
-- Since employees can receive multiple bonuses, doing a direct INNER JOIN and summing se.salary + sb.bonus 
-- overcounts salary, repeating it per bonus row.

-- Requirement:
-- You need to calculate total compensation = salary + total bonuses per employee, then average that grouped 
-- by employee_title and sex.
