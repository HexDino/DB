
--Assignment
--Alter Table--
--C1
alter table countries rename to country_new
--C2
alter table locations add region_id int;
--C3
alter table locations add ID int first;
--C4
alter table locations add region_id int after state_province;
--C5
alter table locations alter column country_id set datatype int;
--C6
alter table locations drop column city;
--C7
alter table locations rename column state to state_province;
--C8
alter table locations add primary key (location_id);
--C9
alter table locations add constraints locations_pk primary key(location_id, country_id);
--C10
alter table locations drop primary key;
--C11
alter table job_history add FOREIGN KEY (job_id) REFERENCES jobs(job_id);
--C12
alter table job_history add constraints jk_job_id foreign key (job_id) references jobs(job_id);
--C13
alter table job_history drop foreign key jk_job_id;
--C14
create index idx_job_id on job_history(job_id);
--C15
alter table job_history drop index idx_job_id;
--Create Table---
--C6:
alter table jobs add constraint max_salary_check
	CHECK (max_salary <= 25000);
select * from jobs;

--C7:
select * from countries;
alter table countries add constraint country_name_check
	check(country_name IN ('Italy','India','China'));


--C8:
select * from job_history;
alter table job_history add constraint end_date_check 
	--check(to char(end_date, 'dd/mm/yyyy'));

--C13
alter table countries 
	add constraint region_id_unique unique (region_id);

--C15
alter table departments
	add constraint manager_id_unique unique (manager_id);

alter table employees
	add foreign key (manager_id) references departments (manager_id);

	
---C17
alter table employees
	add foreign key (job_id) references jobs (job_id) on update restrict on delete restrict;
	
--insert--
--C1--
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('VN', 'Việt Nam', 1);
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('US', 'United States', 2);
INSERT INTO countries (COUNTRY_ID, COUNTRY_NAME, REGION_ID)
VALUES ('JP', 'Japan', 3);
--C2--
INSERT INTO countries (country_id, country_name)
VALUES ('VN', 'Việt Nam');
--C3--
CREATE TABLE country_new LIKE countries SELECT * INTO country_new FROM countries;
--C4--
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('US', 'United States', NULL);
--C5--
INSERT INTO countries (country_id, country_name, region_id)
VALUES ('VN', 'Việt Nam', 1),
       ('US', 'United States', 2),
       ('JP', 'Japan', 3);
--C6--
INSERT INTO countries (country_id, country_name, region_id)
SELECT country_id, country_name, region_id
FROM country_new;
--C7--
CREATE TABLE countries (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    country_name VARCHAR(40) NOT NULL,
    region_id DECIMAL(10,0)
);
INSERT INTO countries (country_name, region_id)
VALUES ('Việt Nam', 1);
--C8--
CREATE TABLE countries (
    country_id INT PRIMARY KEY UNIQUE,
    country_name VARCHAR(40) DEFAULT 'N/A'
);
INSERT INTO countries (country_id, country_name)
VALUES (1, 'Việt Nam');
INSERT INTO countries (country_id)
VALUES (2);
SELECT * FROM countries;

--Data for employees-
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commission_pct, manager_id, department_id)
VALUES (100, 'Steven', 'King', 'SKING', '515.123.4567', '1987-06-17', 'AD_PRES', 24000.00, 0.00, 0, 90),
       (101, 'Neena', 'Kochhar', 'NKOCHHAR', '515.123.4568', '1987-06-18', 'AD_VP', 17000.00, 0.00, 100, 90),
       (102, 'Lex', 'De Haan', 'LDEHAAN', '515.123.4569', '1987-06-19', 'AD_VP', 17000.00, 0.00, 100, 90),
		(103, 'Alexander', 'Hunold', 'AHUNOLD', '590.423.4567', '1987-06-20', 'IT_PROG', 9000.00, 0.00, 102, 60),
		(104, 'Bruce', 'Ernst', 'BERNST', '590.423.4568', '1987-06-21', 'IT_PROG', 6000.00, 0.00, 103, 60),
		(105, 'David', 'Austin', 'DAUSTIN', '590.423.4569', '1987-06-22', 'IT_PROG', 4800.00, 0.00, 103, 60),
		(106, 'Valli', 'Pataballa', 'VPATABAL', '590.423.4560', '1987-06-23', 'IT_PROG', 4800.00, 0.00, 103, 60),
		(107, 'Diana', 'Lorentz', 'DLORENTZ', '590.423.5567', '1987-06-24', 'IT_PROG', 4200.00, 0.00, 103, 60),
		(108, 'Nancy', 'Greenberg', 'NGREENBE', '515.124.4569', '1987-06-25', 'FI_MGR', 12008.00, 0.00, 101, 100),
		(109, 'Daniel', 'Faviet', 'DFAVIET', '515.124.4169', '1987-06-26', 'FI_ACCOUNT', 9000.00, 0.00, 108, 100),
		(110, 'John', 'Chen', 'JCHEN', '515.124.4269', '1987-06-27', 'FI_ACCOUNT', 8200.00, 0.00, 108, 100),
		(111, 'Ismael', 'Sciarra', 'ISCIARRA', '515.124.4369', '1987-06-28', 'FI_ACCOUNT', 7700.00, 0.00, 108, 100),
		(112, 'Jose Manuel', 'Urman', 'JMURMAN', '515.124.4469', '1987-06-29', 'FI_ACCOUNT', 7800.00, 0.00, 108, 100),
		(113, 'Luis', 'Popp', 'LPOPP', '515.124.4567', '1987-06-30', 'FI_ACCOUNT', 6900.00, 0.00, 108, 100),

       (155, 'Oliver', 'Tuvault', 'OTUVAULT', '011.44.1344.486508', '1987-08-11', 'SA_REP', 7000.00, 0.15, 145, 80);

	
	--department--
	insert into departments (department_id, department_name, manager_id, location_id)
	values 
	(10, 'Administration', 200, 1700),
	(20, 'Marketing', 201, 1800),
	(30, 'Purchasing', 114, 1700),
	(40, 'Human Resources', 203, 2400),
	(50, 'Shipping', 121, 1500),
	(60, 'IT', 103, 1400),
	(70, 'Public Relations', 204, 2700),
	(80, 'Sales', 145, 2500),
	(90, 'Executive', 100, 1700),
	(100, 'Finance', 108, 1700),
	(110, 'Accounting', 205, 1700);

SELECT department_id, department_name, manager_id, location_id
FROM departments;

insert into job_history (employee_id, start_date, end_date, job_id, department_id)
VALUE
(100, '1987-06-17', '1989-06-17', 'AD_PRES', 90),
(101, '1987-06-18', '1989-06-18', 'AD_VP', 90),
(102, '1987-06-19', '1989-06-19', 'AD_VP', 90),
(103, '1987-06-20', '1989-06-20', 'IT_PROG', 60),
(104, '1987-06-21', '1989-06-21', 'IT_PROG', 60),
(105, '1987-06-22', '1989-06-22', 'IT_PROG', 60),
(106, '1987-06-23', '1989-06-23', 'IT_PROG', 60),
(107, '1987-06-24', '1989-06-24', 'IT_PROG', 60),
(108, '1987-06-25', '1989-06-25', 'FI_MGR', 100),
(109, '1987-06-26', '1989-06-26', 'FI_ACCOUNT', 100),
(110, '1987-06-27', '1989-06-27', 'FI_ACCOUNT', 100),
(111, '1987-06-28', '1989-06-28', 'FI_ACCOUNT', 100),
(112, '1987-06-29', '1989-06-29', 'FI_ACCOUNT', 100),
(113, '1987-06-30', '1989-06-30', 'FI_ACCOUNT', 100),

insert into jobs (job_id, job_title, min_salary, max_salary)
VALUES
('AD_PRES', 'President', 20000, 40000),
('AD_VP', 'Administration Vice President', 15000, 30000),
('AD_ASST', 'Administration Assistant', 3000, 6000),
('FI_MGR', 'Finance Manager', 8200, 16000),
('FI_ACCOUNT', 'Accountant', 4200, 9000),
('AC_MGR', 'Accounting Manager', 8200, 16000),
('AC_ACCOUNT', 'Public Accountant', 4200, 9000);

SELECT 
  employees.employee_ID, 
  first_Name, 
  last_Name, 
  departments.department_name
  job_title,
  start_date,
  end_date
FROM employees
INNER JOIN job_history
ON employees.employee_id = departments.employee_id
INNER JOIN departments
ON job_history.department_id = departments.department_id
WHERE employees.employee_id = 'E0001' 
ORDER BY Start_Date DESC;

SELECT 
employees.employee_id, 
  first_name, 
  last_name, 
  job_title, 
  salary 
FROM employees 
INNER JOIN jobs
ON employees.job_id = jobs.job_id
WHERE salary BETWEEN 0 AND 5000
ORDER BY salary DESC;


