-- List top 5 highest-paid employees.

Select e.emp_id, e.emp_name, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id
order by s.salary desc
limit 5;

-- Count employees in each department.

Select d.dept_name, count(e.emp_id) as total_employees
from departments d
left join employees e on d.dept_id = e.dept_id
group by d.dept_name;

-- Find average salary by department.

Select d.dept_name, round(avg(s.salary),2) as avg_salary
from employees e
join departments d on e.dept_id = d.dept_id
join salaries s on e.emp_id = s.emp_id
group by d.dept_name;

-- Use of where, group by, order by, having, limit together.
-- Getting departments having average salary more than 70000.

Select d.dept_name, avg(s.salary) as avg_salary
from employees e
join departments d on e.dept_id = d.dept_id
join salaries s on e.emp_id = s.emp_id
where s.salary between 60000 and 100000
group by d.dept_name
having avg_salary > 70000
order by avg_salary desc
limit 3;

-- Apply filtering using BETWEEN, IN, LIKE.
-- Fetching employee names starting with 'A' or 'D', salary between 60000 and 90000.

Select e.emp_name, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id
where e.emp_name like 'a%' or e.emp_name like 'd%' and s.salary between 60000 and 90000;

-- Find employees earning more than average salary.
Select e.emp_name, s.salary
from employees e
join salaries s on e.emp_id = s.emp_id
where s.salary > (
    select avg(salary) from salaries
);

-- Find Top earners per department.
With ranked_salaries as (
    Select e.emp_name, d.dept_name, s.salary,
           rank() over (partition by d.dept_name order by s.salary desc) as dept_rank
    from employees e
    join departments d on e.dept_id = d.dept_id
    join salaries s on e.emp_id = s.emp_id
)
Select * from ranked_salaries
where dept_rank = 1;


