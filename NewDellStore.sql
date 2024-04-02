-- Active: 1711113301897@@127.0.0.1@5432@Test
CREATE TABLE regions(
	region_id INT PRIMARY KEY,
	region_name VARCHAR(25)
);

create table countries(
	country_id CHAR(2),
	country_name VARCHAR(40),
	region_id INT
);

create table locations(
	location_id INT,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12),
	country_id char(2)
)

create table departments(
	department_id INT PRIMARY KEY,
	department_name varchar(30),
	manager_id INT,
	location_id INT
);

create table employees(
	employee_id INT PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary INT,
	commision_pct INT,
	manager_id INT,
	department_id INT
);

create table jobs(
	job_id varchar(10) UNIQUE,
	job_title varchar(35),
	min_salary INT,
	max_salary INT
);

create table job_history(
	employee_id INT PRIMARY KEY,
	start_date DATE,
	end_date DATE,
	job_id varchar(10),
	department_id INT,
	CONSTRAINT start_date_pk UNIQUE (start_date)
);

create table job_grades(
	grade_level varchar(2) UNIQUE,
	lowest_sal int,
	highest_sal int
);

ALTER TABLE countries ADD constraint region_id_fk foreign key (region_id) references regions(region_id);
ALTER TABLE countries ADD PRIMARY KEY (country_id);
ALTER TABLE locations ADD constraint country_id_fk foreign key (country_id) references countries(country_id);
ALTER TABLE locations ADD PRIMARY KEY (location_id);
ALTER TABLE departments ADD constraint location_id_fk foreign key (location_id) references locations(location_id);
ALTER TABLE jobs ADD PRIMARY KEY (job_id);
ALTER TABLE job_grades ADD PRIMARY KEY (grade_level);
ALTER TABLE employees add constraint employee_id_fk_to_job_his foreign key (employee_id) references job_history(employee_id);
ALTER TABLE employees add constraint job_id_fk_to_jobs foreign key (job_id) references jobs(job_id);
ALTER TABLE employees add constraint department_id_fk_to_department foreign key (department_id) references departments(department_id);
ALTER TABLE job_history add constraint department_id_fk_to_department foreign key (department_id) references departments(department_id);
ALTER TABLE job_history add constraint job_id_fk_to_jobs foreign key (job_id) references jobs(job_id);

INSERT INTO regions (region_id, region_name) VALUES
(1, 'North America'),
(2, 'South America'),
(3, 'Europe'),
(4, 'Asia'),
(5, 'Africa'),
(6, 'Oceania');

INSERT INTO countries (country_id, country_name, region_id) VALUES
('US', 'United States', 1),
('CA', 'Canada', 1),
('MX', 'Mexico', 1),
('BR', 'Brazil', 2),
('AR', 'Argentina', 2),
('CL', 'Chile', 2),
('FR', 'France', 3),
('DE', 'Germany', 3),
('IT', 'Italy', 3),
('CH', 'Switzerland', 3),
('CN', 'China', 4),
('JP', 'Japan', 4),
('KR', 'South Korea', 4),
('IN', 'India', 4),
('EG', 'Egypt', 5),
('ZA', 'South Africa', 5),
('NG', 'Nigeria', 5),
('AU', 'Australia', 6),
('NZ', 'New Zealand', 6),
('FJ', 'Fiji', 6);

INSERT INTO locations (location_id, street_address, postal_code, city, state_province,country_id) VALUES
(1, '1600 Pennsylvania', '20500', 'Washington D.C.', 'District','US'),
(2, '10 Downing Street', 'SW1A2AA', 'London', 'England','CA'),
(3, '5 Rue lElysée', '75008', 'Paris', 'Île-France','MX'),
(4, '1000000', 'Beijing', 'Beijing', 'China','BR'),
(5, '2775 Sandhurst', '2154 Sandton', 'Johannes', 'Gauteng','AR'),
(6, '1 Treasury', 'Melbourne', 'Melbourne', 'Victoria','CL'),
(7, '1 The Terrace', 'Wellington', 'Wellington', 'Wellington','FR'),
(8, '1 Queen', 'Suva', 'Suva', 'Central','DE'),
(9, '1600 Pennsylvania', '20500', 'Washington D.C.', 'District','IT'),
(10, '10 Downing Street', 'SW1A2AA', 'London', 'England','CH'),
(11, '5 Rue lElysée', '75008', 'Paris', 'Île-France','CN'),
(12, '1000000', 'Beijing', 'Beijing', 'Australia','JP'),
(13, '2775 Sandhurst', '2154 Sandton', 'Johannes', 'Nigeria','KR'),
(14, '1 Treasury', 'Melbourne', 'Melbourne', 'Victoria','IN'),
(15, '1 The Terrace', 'Wellington', 'Wellington', 'Wellington','EG'),
(16, '1 Queen', 'Suva', 'Suva', 'Central','ZA'),
(17, '1600 Pennsylvania', '20500', 'Washington D.C.', 'District','NG'),
(18, '10 Downing Street', 'SW1A2AA', 'London', 'England','AU'),
(19, '5 Rue lElysée', '75008', 'Paris', 'Île-France','NZ'),
(20, '1000000', 'Beijing', 'Beijing', 'China','FJ');


INSERT INTO departments (department_id, department_name, manager_id, location_id) VALUES
(1, 'Sales', 101, 1),
(2, 'Marketing', 102, 2),
(3, 'Human Resources', 103, 3),
(4, 'IT', 104, 4),
(5, 'Customer Service', 105, 5);
INSERT INTO job_grades (grade_level, lowest_sal, highest_sal) VALUES
('A', 10000, 20000),
('B', 20001, 30000),
('C', 30001, 40000),
('D', 40001, 50000),
('E', 50001, 60000);

INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
('JOB1', 'Software Engineer', 50000, 100000),
('JOB2', 'Data Analyst', 60000, 110000),
('JOB3', 'Product Manager', 70000, 120000),
('JOB4', 'UX Designer', 80000, 130000),
('JOB5', 'Systems Administrator', 90000, 140000),
('JOB6', 'Database Administrator', 55000, 105000),
('JOB7', 'Network Engineer', 65000, 115000),
('JOB8', 'Security Analyst', 75000, 125000),
('JOB9', 'Technical Writer', 85000, 135000),
('JOB10', 'Sales Representative', 95000, 145000);
ALTER TABLE employees ALTER COLUMN email TYPE varchar(50) ;

INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id) VALUES
(1, '2020-01-01', '2021-01-01', 'JOB1', 1),
(2, '2019-02-01', '2021-02-01', 'JOB2', 2),
(3, '2018-03-01', '2021-03-01', 'JOB3', 1),
(4, '2017-04-01', '2021-04-01', 'JOB4', 4),
(5, '2016-05-01', '2021-05-01', 'JOB5', 3),
(6, '2020-02-01', '2021-01-01', 'JOB1', 1),
(7, '2019-02-04', '2021-02-01', 'JOB2', 2),
(8, '2018-03-06', '2021-03-01', 'JOB2', 1),
(9, '2017-04-03', '2021-04-01', 'JOB4', 4),
(10, '2016-05-09', '2021-05-01', 'JOB5', 5),
(11, '2020-01-10', '2021-01-01', 'JOB3', 1),
(12, '2019-02-02', '2021-02-01', 'JOB4', 5),
(13, '2018-03-03', '2021-03-01', 'JOB8', 1),
(14, '2017-04-06', '2021-04-01', 'JOB10', 4),
(15, '2016-05-08', '2021-05-01', 'JOB9', 3);

INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commision_pct, manager_id, department_id) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', '2022-01-01', 'JOB1', 50000, 10, 101, 1),
(2, 'Jane', 'Doe', 'jane.doe@example.com', '123-456-7891', '2022-02-01', 'JOB2', 60000, 15, 102, 2),
(3, 'Jim', 'Smith', 'jim.smith@example.com', '123-456-7892', '2022-03-01', 'JOB3', 70000, 20, 103, 3),
(4, 'Jill', 'Johnson', 'jill.johnson@example.com', '123-456-7893', '2022-04-01', 'JOB4', 80000, 25, 104, 4),
(5, 'Joe', 'Brown', 'joe.brown@example.com', '123-456-7894', '2022-05-01', 'JOB5', 90000, 30, 105, 5),
(6, 'Julia', 'Roberts', 'julia.roberts@example.com', '123-456-7895', '2022-06-01', 'JOB6', 55000, 12, 101, 1),
(7, 'Jessica', 'Alba', 'jessica.alba@example.com', '123-456-7896', '2022-07-01', 'JOB7', 65000, 14, 102, 2),
(8, 'Jennifer', 'Aniston', 'jennifer.aniston@example.com', '123-456-7897', '2022-08-01', 'JOB8', 75000, 16, 103, 3),
(9, 'Judy', 'Dench', 'judy.dench@example.com', '123-456-7898', '2022-09-01', 'JOB9', 85000, 18, 104, 4),
(10, 'Jodie', 'Foster', 'jodie.foster@example.com', '123-456-7899', '2022-10-01', 'JOB10', 95000, 20, 105, 5),
(11, 'Jack', 'Black', 'jack.black@example.com', '123-456-7800', '2022-11-01', 'JOB8', 56000, 22, 101, 1),
(12, 'Jake', 'Gyllenhaal', 'jake.gyllenhaal@example.com', '123-456-7801', '2022-12-01', 'JOB7', 66000, 24, 102, 2),
(13, 'Jared', 'Leto', 'jared.leto@example.com', '123-456-7802', '2023-01-01', 'JOB1', 76000, 26, 103, 3),
(14, 'Jeremy', 'Renner', 'jeremy.renner@example.com', '123-456-7803', '2023-02-01', 'JOB2', 86000, 28, 104, 4),
(15, 'Jason', 'Statham', 'jason.statham@example.com', '123-456-7804', '2023-03-01', 'JOB4', 96000, 30, 105, 5);

-- WORD 1.1
-- 1. Đổi tên bảng countries thành country_new
ALTER TABLE countries RENAME TO country_new
-- 2. Thêm cột region_id tới bảng locations
ALTER TABLE locations ADD COLUMN region_id INT
-- 3. Thêm cột ID vào bảng locations với điều kiện cột ID là cột đầu tiên của bảng.
CREATE TABLE locantions2
(
	ID SERIAL,
    location_id INT primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12),
	country_id char(2)
);
INSERT INTO locantions2(location_id, street_address, postal_code, city, state_province, country_id)
SELECT location_id, street_address, postal_code, city, state_province, country_id FROM locations;
ALTER TABLE locantions2 ADD constraint country_id_fk foreign key (country_id) references country_new(country_id)

DROP TABLE locations CASCADE;

-- Đổi tên bảng mới thành tên bảng cũ
ALTER TABLE locantions2 RENAME TO locations;
-- 4.	Thêm cột region_id đứng liền sau cột state_province của bảng locations.
CREATE TABLE locations_new
(
	ID SERIAL,
    location_id INT,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12),
    region_id INT, -- new column
    country_id char(2)
);

INSERT INTO locations_new(location_id, street_address, postal_code, city, state_province, country_id)
SELECT location_id, street_address, postal_code, city, state_province, country_id FROM locations;

DROP TABLE locations;

ALTER TABLE locations_new RENAME TO locations;
ALTER TABLE locations ADD constraint country_id_fk foreign key (country_id) references country_new(country_id)

-- 5.	Thay đổi kiểu dữ liệu của cột country_id thành integer trong bảng locations.
-- Xoá quan hệ trước
UPDATE locations SET country_id = NULL;
ALTER TABLE locations ALTER COLUMN country_id TYPE INT USING country_id::INT;
-- 6.	Xóa cột city trong bảng locations
ALTER TABLE locations DROP COLUMN city;
--7.	Đổi tên cột state_province thành cột state, giữa nguyên kiểu và kích thước của cột. 
ALTER TABLE locations RENAME COLUMN state_province TO state;
ALTER TABLE locations RENAME COLUMN state TO state_province;
-- 8.	Thêm khóa chính cho cột location_id trong bảng location 
ALTER TABLE locations ADD PRIMARY KEY (location_id);
-- 9.	Thêm khóa chính là cặp 2 cột (location_id, country_id) cho bảng locations.
-- XOÁ Primary key cũ và thêm dữ liệu để 2 cột là NOT NULL
ALTER TABLE locations ADD CONSTRAINT location_id_country_id_pk PRIMARY KEY (location_id, country_id);
-- 10.	Xóa khóa chính là cặp (location_id, country_id) đã tạo.
ALTER TABLE locations DROP CONSTRAINT location_id_country_id_pk;
-- Tạo khóa ngoại job_id cho bảng job_history mà tham chiếu tới job_id của bảng jobs
ALTER TABLE job_history ADD CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id);
-- 12.	Tạo ràng buộc có tên là fk_job_id với job_id của bảng job_history tham chiếu tới job_id của bảng jobs. 
ALTER TABLE job_history ADD CONSTRAINT fk_job_id FOREIGN KEY (job_id) REFERENCES jobs(job_id);
-- 13.	Xóa khóa ngoại fk_job_id trong bảng job_history đã tạo. 
ALTER TABLE job_history DROP CONSTRAINT fk_job_id;
-- 14.	Thêm chỉ mục có tên indx_job_id trên thuộc tính job_id của bảng job_history.
CREATE INDEX indx_job_id ON job_history(job_id);
--15.	Xóa chỉ mục indx_job_id trong bảng job_history. 
DROP INDEX indx_job_id;

-- WORD 1.2
-- 