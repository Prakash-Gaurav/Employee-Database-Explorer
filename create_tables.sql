Create Database Employee_Database_Explorer;
Use Employee_Database_Explorer;

-- Creating Tables

Create table departments (
    dept_id int primary key,
    dept_name varchar(100)
);

Create table employees (
    emp_id int primary key,
    emp_name varchar(100),
    dept_id int,
    hire_date date,
    foreign key (dept_id) references departments(dept_id)
);

Create table salaries (
    emp_id int,
    salary decimal(10,2),
    from_date date,
    to_date date,
    foreign key (emp_id) references employees(emp_id)
);

