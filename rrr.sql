-- Active: 1711074983112@@127.0.0.1@5432@word_7
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
	job_id varchar(10),
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
	grade_level varchar(2),
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
(2, '10 Downing Street', 'SW1A2AA', 'London', 'England','BR'),
(3, '5 Rue lElysée', '75008', 'Paris', 'Île-France','FR'),
(4, '1000000', 'Beijing', 'Beijing', 'China','CN'),
(5, '2775 Sandhurst', '2154 Sandton', 'Johannes', 'Gauteng','ZA'),
(6, '1 Treasury', 'Melbourne', 'Melbourne', 'Victoria','AU');

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
ALTER TABLE employees 
ALTER COLUMN email TYPE VARCHAR(100) USING email::VARCHAR(100);
-- ALTER TABLE employees ALTER COLUMN email TYPE varchar(50) 

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

-- Đồng bộ dữ liệu giữa job_history và employee_id
UPDATE job_history
SET job_id = (SELECT job_id FROM employees WHERE employees.employee_id = job_history.employee_id),
    department_id = (SELECT department_id FROM employees WHERE employees.employee_id = job_history.employee_id)
WHERE EXISTS (SELECT 1 FROM employees WHERE employees.employee_id = job_history.employee_id);

create table managers(
	manager_id INT PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	salary INT,
	commision_pct INT,
	department_id INT
);
INSERT INTO managers(manager_id, first_name, last_name, email, phone_number, hire_date, salary, commision_pct, department_id)
VALUES 
(101, 'A', 'Doe', 'john.doe@example.com', '1234567890', '2022-01-01', 50000, 10, 1),
(102, 'B', 'Doe', 'jane.doe@example.com', '1234567891', '2022-01-02', 60000, 20, 2),
(103, 'C', 'Doe', 'jim.doe@example.com', '1234567892', '2022-01-03', 70000, 30, 3),
(104, 'D', 'Doe', 'jill.doe@example.com', '1234567893', '2022-01-04', 80000, 40, 4),
(105, 'E', 'Doe', 'joe.doe@example.com', '1234567894', '2022-01-05', 90000, 50, 5);

ALTER TABLE departments ADD CONSTRAINT manager_id_fk_to_department Foreign Key (manager_id) REFERENCES managers(manager_id);
ALTER TABLE employees ADD CONSTRAINT manager_id_fk_to_employee Foreign Key (manager_id) REFERENCES managers(manager_id);

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
--3.	Tạo bảng dup_countries chỉ có lược đồ tương tự như bảng countries.
create table dup_countries(
	country_id CHAR(2),
	country_name VARCHAR(40),
	region_id INT
);
Drop table dup_countries;
--4.	Tạo bảng dup_countries có lược đồ và dữ liệu giống như bảng countries.
create table dup_countries(
	country_id CHAR(2),
	country_name VARCHAR(40),
	region_id INT
);
INSERT INTO dup_countries(country_id, country_name, region_id)
SELECT country_id, country_name, region_id FROM countries;

ALTER table dup_countries ADD CONSTRAINT dup_countries_pk PRIMARY KEY (country_id);
-- 5.	Tạo bảng countries có ràng buộc NOT NULL cho các thuộc tính.
ALTER TABLE countries ALTER COLUMN country_id SET NOT NULL;
ALTER TABLE countries ALTER COLUMN country_name SET NOT NULL;
ALTER TABLE countries ALTER COLUMN region_id SET NOT NULL;
-- 6.	Tạo bảng job2s bao gồm các cột thuộc tính job_id, job_title, min_salary, max_salary và ràng buộc max_salary phải nhỏ hơn hoặc bằng 25000.
CREATE TABLE job2s(
	job_id varchar(10),
	job_title varchar(35),
	min_salary INT,
	max_salary INT CHECK (max_salary <= 25000) -- CHECK để kiểm tra giá trị đầu vào
);

--7.	Tạo bảng countries2 bao gồm các cột country_id, country_name, region_id Và ràng buộc tên country_name phải là một trong các giá trị sau: Italy, India hay China
CREATE TABLE countries2(
	country_id CHAR(2),
	country_name VARCHAR(40) CHECK (country_name IN ('Italy', 'India', 'China')), -- CHECK để kiểm tra giá trị đầu vào IN để kiểm tra giá trị trong một tập hợp
	region_id INT
);
-- 8.	Tạo bảng job_histry2 gồm các cột employee_id, start_date, end_date, job_id, department_id và có ràng buộc end_date phải ở định dạng '--/--/----'.
CREATE TABLE job_history2 (
  employee_id INT NOT NULL,
  start_date DATE NOT NULL,
  end_date DATE CHECK (end_date::text ~ '^([0-3]{1}[0-9]{1})/([0-1]{1}[0-9]{1})/([0-9]{4})$'),
  job_id INT,
  department_id INT
);

drop table job_history2;
-- Hãy tạo bộ dữ liệu để kiểm tra ràng buộc INSERT INTO job_history2(employee_id, start_date, end_date, job_id, department_id)
INSERT INTO job_history2(employee_id, start_date, end_date, job_id, department_id)
VALUES
(1, '2020-01-01', TO_DATE('22/12/2004', 'DD/MM/YYYY'), 1, 1),
(2, '2019-02-01', TO_DATE('03/02/2005', 'DD/MM/YYYY'), 2, 2);
-- 10.	Tạo bảng jobs2 gồm các cột job_id, job_title, min_salary, max_salary, với giá trị mặc định của job_title là ‘ ‘, min_salary là 8000, max_salary là NULL.
CREATE TABLE jobs2(
	job_id varchar(10),
	job_title varchar(35) DEFAULT ' ',
	min_salary INT DEFAULT 8000,
	max_salary INT DEFAULT NULL
);

insert into jobs2(job_id) values ('JOB1');
-- 12.	Tạo bảng countries bao gồm các cột country_id, country_name, region_id với ràng buộc country_id là duy nhất và có giá trị tự động tăng khi INSERT. 
CREATE TABLE countries3(
	country_id SERIAL PRIMARY KEY,
	country_name VARCHAR(40),
	region_id INT
);

insert into countries3(country_name, region_id) values 
('My',2),
('Vietnam', 1);

-- 13.	Tạo bảng countries bao gồm các cột country_id, country_name, region_id và với khóa là cặp (country_id, region_id). 
CREATE TABLE countries4(
	country_id CHAR(2),
	country_name VARCHAR(40),
	region_id INT,
	PRIMARY KEY (country_id, region_id)
);

--14.	Tạo bảng job_history với các cột employee_id, start_date, end_date, job_id, department_id với khóa chính là employee_id và ràng buộc job_id phải là các giá trị tham chiếu được trong bảng jobs. 
CREATE TABLE job_history3(
	employee_id INT PRIMARY KEY,
	start_date DATE,
	end_date DATE,
	job_id varchar(10),
	department_id INT,
	CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);

-- Tạo dữ liệu mẫu để test
INSERT INTO job_history3(employee_id, start_date, end_date, job_id, department_id)
VALUES
(1, '2020-01-01', '2021-01-01', 'JOB1', 1),
(2, '2019-02-01', '2021-02-01', 'JOB2', 2),
(3, '2018-03-01', '2021-03-01', 'JOB3', 1),
(4, '2017-04-01', '2021-04-01', 'JOB4', 4),
(5, '2016-05-01', '2021-05-01', 'JOB5', 3),
(6, '2020-02-01', '2021-01-01', 'JOB1', 1),
(7, '2019-02-04', '2021-02-01', 'JOB2', 2);

-- 15.	Tạo bảng employees gồm các cột employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id, department_id với ràng buộc employee_id là khóa chính và cặp (department_id, manager_id) phải tồn tại trong bảng tham departments.
CREATE TABLE employees2(
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
-- Set thuộc tính unique cho manager id và department id
ALTER TABLE departments ADD CONSTRAINT manager_id_fk2 UNIQUE (manager_id, department_id);
alter table employees2 add constraint manager_id_fk3 foreign key (department_id, manager_id) references departments(department_id, manager_id);

-- 16.	Tạo bảng employees gồm các cột employee_id, first_name, last_name, email, phone_number hire_date, job_id, salary, commission, manager_id, department_id và ràng buộc khóa chính là employee_id, department_id là khóa ngoại tham chiếu tới khóa của bảng departments, job_id tham chiếu tới job_id trong bảng jobs. 
CREATE TABLE employees3(
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
	department_id INT,
	CONSTRAINT department_id_fk_to_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id)
);
--17.	Như trên với ràng buộc ON UPDATE, ON DELETE RESTRICT cho job_id
CREATE TABLE employees4(
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
	department_id INT,
	CONSTRAINT department_id_fk_to_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE RESTRICT ON UPDATE RESTRICT
);
-- Tác dụng của ON DELETE RESTRICT và ON UPDATE RESTRICT là khi có dữ liệu trong bảng cha thì không thể xóa hoặc cập nhật dữ liệu trong bảng cha

--18.	Như trên với ràng buộc ON DELETE CASCADE, ON UPDATE RESTRICT. Kiểm tra hiệu ứng.
CREATE TABLE employees5(
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
	department_id INT,
	CONSTRAINT department_id_fk_to_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE CASCADE ON UPDATE RESTRICT
);
-- ON DELETE CASCADE: Khi xóa dữ liệu trong bảng cha thì dữ liệu trong bảng con cũng bị xóa, không có con bơ vơ cơ nhỡ
-- ON UPDATE RESTRICT: Khi cập nhật dữ liệu trong bảng cha thì dữ liệu trong bảng con không thể cập nhật
-- 19.	Như trên với ràng buộc ON DELETE SET NULL, ON UPDATE SET NULL. Kiểm tra hiệu ứng.
CREATE TABLE employees6(
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
	department_id INT,
	CONSTRAINT department_id_fk_to_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE SET NULL ON UPDATE SET NULL
);
-- ON DELETE SET NULL: Khi xóa dữ liệu trong bảng cha thì dữ liệu trong bảng con sẽ được set NULL
-- ON UPDATE SET NULL: Khi cập nhật dữ liệu trong bảng cha thì dữ liệu trong bảng con sẽ được set NULL

--20.	Như trên với ràng buộc ON DELETE NO ACTION, ON UPDATE NO ACTION. Kiểm tra hiệu ứng
CREATE TABLE employees7(
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
	department_id INT,
	CONSTRAINT department_id_fk_to_department FOREIGN KEY (department_id) REFERENCES departments(department_id),
	CONSTRAINT job_id_fk_to_jobs FOREIGN KEY (job_id) REFERENCES jobs(job_id) ON DELETE NO ACTION ON UPDATE NO ACTION
);
-- ON DELETE NO ACTION: Khi xóa dữ liệu trong bảng cha thì dữ liệu trong bảng con không thể xóa
-- ON UPDATE NO ACTION: Khi cập nhật dữ liệu trong bảng cha thì dữ liệu trong bảng con không thể cập nhật

-- WORD 2
-- 1.	Đưa ra (first_name, last_name) sử dụng alias “First Name”, “Last Name” từ bảng employees.
SELECT first_name AS "First Name", last_name AS "Last Name" FROM employees;
--2.	Lấy ra các department ID duy nhất trong bảng employees.
DELETE FROM employees WHERE department_id = 5;
SELECT DISTINCT department_id FROM employees;
-- DISTINCT: Lấy ra các giá trị duy nhất	
--3.	Lấy ra thông tin chi tiết của các nhân viên và sắp xếp bởi first_name theo thứ tự giảm dần 
INSERT INTO employees (employee_id, first_name, last_name, email, phone_number, hire_date, job_id, salary, commision_pct, manager_id, department_id) VALUES
(15, 'Zack', 'Black', 'tesst@ex.com', '123-456-7890', '2024-01-01', 'JOB1', 50000, 10, 101, 1);
SELECT * FROM employees ORDER BY first_name DESC;
-- ORDER BY: Sắp xếp dữ liệu, DESC: Giảm dần, ASC: Tăng dần
--4.	Đưa ra (first_name, last_name), salary, PF của tất cả các nhân viên (PF là 15% của salary)
SELECT first_name, last_name, salary, salary * 0.15 AS PF FROM employees;
--5.	Đưa ra employee ID, names (first_name, last_name), salary theo thứ tự tăng dần của salary 
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary ASC;
--6.	Lấy về tổng lương phải trả cho nhân viên
SELECT SUM(salary) FROM employees;
--7.	Lấy về mức lương cao nhất và thấp nhất trong bảng employees 
SELECT MAX(salary) AS "Max Salary", MIN(salary) AS "Min Salary" FROM employees;
--8.	Lấy về mức lương trung bình và số nhân viên trong bảng employees 
SELECT AVG(salary) AS "Average Salary", COUNT(employee_id) AS "Number of Employees" FROM employees;
--9.	Lấy về mức lương trung bình của nhân viên theo từng phòng ban
SELECT department_id, AVG(salary) AS "Average Salary" FROM employees GROUP BY department_id;
--10.	Đưa ra số lượng các công việc có trong bảng employees 
SELECT COUNT(DISTINCT job_id) AS "Number of Jobs" FROM employees;
SELECT DISTINCT job_id FROM employees ORDER BY job_id ASC;
--11.	Lấy về first_name trong bảng employees nhưng hiển thị viết hoa
SELECT UPPER(first_name) FROM employees;
--12.	Lấy về danh sách 3 ký tự đầu tiên của first_name trong bảng employees 
SELECT SUBSTRING(first_name FROM 1 FOR 3) FROM employees;
--13.	Viết truy vấn để tính 171*214+625
SELECT 171*214+625;
--14.	Viết truy vấn để lấy về tên ghép từ first_name và last_name của các nhân viên trong bảng employees. Ví dụ: Ellen Abel, Sundar Ande etc
SELECT first_name || ' ' || last_name AS "Full Name" FROM employees;
--15.	Lấy về first_name từ employees và xóa hết các khoảng trắng nếu có ở 2 bên trái phải trong first_name
SELECT TRIM(first_name) FROM employees;
--16.	Lấy về độ dài tên (first_name, last_name) từ bảng employees
SELECT first_name, LENGTH(first_name) AS "Length" FROM employees;
--17.	Kiểm tra nếu trong bảng employees có nhân viên có first_name chứa ký tự số.
SELECT first_name FROM employees WHERE first_name ~ '[0-9]';
--18.	Lấy về 10 dòng đầu tiên trong bảng employees
SELECT * FROM employees LIMIT 10;
--19.	Lấy về 10 dòng tiếp theo trong bảng employees
SELECT * FROM employees OFFSET 10 LIMIT 10;
--19.	Lấy lương theo tháng (làm tròn 2 chữ số thập phân) cho mọi nhân viên. Giả định salary lưu trong CSDL là lương theo năm
SELECT employee_id, ROUND(salary/12,2) AS "Monthly Salary" FROM employees;

-- WORD 3
-- 1.	Thêm 1 bản ghi với giá trị ở tất cả các cột do bạn tự chọn vào bảng countries 
INSERT INTO countries (country_id, country_name, region_id) VALUES ('VN', 'Vietnam', 4);
-- 2.	Thêm một bản ghi với giá trị ở 2 cột (country_id và country_name) của bảng countries
INSERT INTO countries (country_id, country_name) VALUES ('UK', 'England');
-- 3.	Tạo bản sao country_new của bảng countries với cấu trúc và toàn bộ dữ liệu của bảng countries
CREATE TABLE country_new AS SELECT * FROM countries;
ALTER TABLE country_new ADD PRIMARY KEY (country_id);
-- 4.	Thêm vào 1 bản ghi với trường region_id là NULL
insert into regions(region_name) values (TEST);
--5.	Thêm vào 3 bản ghi trong cùng 1 truy vấn INSERT vào bảng countries
INSERT INTO countries (country_id, country_name, region_id) VALUES
('VN', 'Vietnam', 4),
('UK', 'England', 3),
('US', 'United States', 1);
--6.	Thêm vào bảng countries tất cả các dòng từ bảng country_new
INSERT INTO countries (country_id, country_name, region_id) SELECT country_id, country_name, region_id FROM country_new;
--Tạo bảng countries và viết câu lệnh INSERT sao cho trường country_id là tự động tăng mà không cần phải đưa vào trong câu lệnh INSERT.
CREATE TABLE countries3(
	country_id SERIAL PRIMARY KEY,
	country_name VARCHAR(40),
	region_id INT
);
-- Tạo bộ dữ liệu test
INSERT INTO countries3(country_name, region_id) VALUES
('My',2),
('Vietnam', 1);
--8.	Tạo bảng countries và viết câu lệnh INSERT sao cho country_id có tính duy nhất trong bảng, trường country_name có giá trị mặc định là ‘N/A’ nếu không được chỉ định trong câu lệnh INSERT. 
CREATE TABLE countries4(
	country_id CHAR(2) UNIQUE,
	country_name VARCHAR(40) DEFAULT 'N/A',
	region_id INT
);
-- WORD 3.2
-- Chuyển mọi giá trị cột email thành N/A
UPDATE employees SET email = 'N/A';
--1.	Thay đổi giá trị cột email cho mọi bản ghi trong bảng employees về giá trị ‘not available’.
UPDATE employees SET email = 'not available';
--2.	Thay đổi giá trị cột email thành ‘not available’ và cột commission_pct thành 0.10 cho tất cả bản ghi trong bảng employees.
ALTER TABLE employees ALTER COLUMN commision_pct TYPE REAL;
UPDATE employees SET email = 'not available', commision_pct = 0.10;
--3.	Thay đổi giá trị cột email thành ‘not available’ và cột commission_pct thành 0.10 cho tất cả bản ghi trong bảng employees mà thỏa mãn điều kiện department_id là 1. 
UPDATE employees SET email = 'not available', commision_pct = 0.10 WHERE department_id = 1;
--4.	Thay đổi giá trị cột email thành ‘not available’ cho bản ghi trong bảng employees mà department_id là 80 và commission_pct < 0.20%.
UPDATE employees SET email = 'not available' WHERE department_id = 80 AND commision_pct < 0.2;
--5.	Thay đổi cột email thành ‘not available” cho nhân viên trong bảng employees mà làm việc ở phòng ban ‘IT’.
UPDATE employees 
SET email = 'not available' 
WHERE department_id IN (SELECT department_id FROM departments WHERE department_name = 'IT');
--6.	Cập nhật salary cho nhân viên có ID là 15 lên 8000 nếu mức lương trước đó là ít hơn 5000
UPDATE employees SET salary = 8000 WHERE employee_id = 15 AND salary < 5000;
--7.	Cập nhật job_id thành ‘SH_CLERK’ cho nhân viên có ID là 14 nếu nhân viên đó thuộc department id là 4 và job_id hiện tại không bắt đầu với ‘SH’.
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) VALUES
('SH_CLERK', 'Sales Clerk', 50000, 100000); 
UPDATE employees SET job_id = 'SH_CLERK' WHERE employee_id = 14 AND department_id = 4 AND job_id NOT LIKE 'SH%';
--8.	Viết một câu truy vấn duy nhất tăng mức lương của những nhân viên thuộc department có id là 3, 4 và 5 với điều kiện tăng 25% cho department id là 3, 15% cho department id là 4 và 10% cho department id là 5. Các phòng ban còn lại giữ nguyên.
UPDATE employees 
SET salary = salary * CASE 
    WHEN department_id = 3 THEN 1.25
    WHEN department_id = 4 THEN 1.15
    WHEN department_id = 5 THEN 1.10
    ELSE 1
END;
--9.	Tăng mức lương minimum và maximum của nhân viên mà job id là “JOB1” lên thêm 2000 đơn vị đồng thời lương salary của các nhân viên này tăng 20% và commision_pct tăng thêm 0.10 đơn vị.
UPDATE jobs SET min_salary = min_salary + 2000, max_salary = max_salary + 2000 WHERE job_id = 'JOB1';
UPDATE employees SET salary = salary * 1.2, commision_pct = commision_pct + 0.1 where job_id =  'JOB1';

-- WORD 4

--1. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000.
SELECT first_name, last_name, salary FROM employees WHERE salary NOT BETWEEN 10000 AND 15000;
--2. Write a query to display the name (first_name, last_name) and department ID of all employees in departments 1 or 3 in ascending order. 
SELECT first_name, last_name, department_id FROM employees WHERE department_id IN (1, 3) ORDER BY department_id ASC;
--3. Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000 and are in department 3 or 5.
SELECT first_name, last_name, salary FROM employees WHERE salary NOT BETWEEN 10000 AND 15000 AND department_id IN (3, 5); 
--4. Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987. 
SELECT first_name, last_name, hire_date FROM employees WHERE EXTRACT(YEAR FROM hire_date) = 2023;
--5. Write a query to display the first_name of all employees who have both "a" and "e" in their first name
SELECT first_name FROM employees WHERE first_name LIKE '%a%' AND first_name LIKE '%e%';
--6.Write a query to display the last name, job, and salary for all employees whose job is that of a Software Engineer or a Product Manager, and whose salary is not equal to $76,000, $10,000, or $15,000
SELECT last_name, job_id, salary FROM employees WHERE job_id IN (SELECT job_id FROM jobs WHERE job_title = 'Software Engineer' or job_title = 'Product Manager') AND salary NOT IN (76000, 10000, 15000);
--7. Write a query to display the last name of employees whose names have exactly 6 characters. 
SELECT last_name FROM employees WHERE LENGTH(last_name) = 6;
--8.Write a query to display the last name of employees having 'e' as the third character
SELECT last_name FROM employees WHERE last_name LIKE '__e%';
--9. Write a query to display the jobs/designations available in the employees table. \
SELECT DISTINCT job_id FROM employees;
--10. Write a query to display the name (first_name, last_name), salary and PF (15% of salary) of all employees.
SELECT first_name, last_name, salary, salary * 0.15 AS PF FROM employees;
--11.Write a query to select all record from employees where last name in 'BLAKE', 'SCOTT', 'KING' and 'FORD'. 
SELECT * FROM employees WHERE last_name IN ('BLAKE', 'SCOTT', 'KING', 'FORD');

-- WORD 5
--1.	Viết truy vấn đưa ra (location_id, street_address, city, state_province, country_name) của tất cả các departments.
SELECT 
    d.department_id,
    l.location_id, 
    l.street_address, 
    l.city, 
    l.state_province, 
    c.country_name
FROM 
    departments d
JOIN 
    locations l ON d.location_id = l.location_id
JOIN 
    countries c ON l.country_id = c.country_id;
SELECT 
    d.department_id,
    l.location_id, 
    l.street_address, 
    l.city, 
    l.state_province, 
    c.country_name
FROM 
    departments d
NATURAL JOIN 
    locations l
NATURAL JOIN 
    countries c;

--2.	Tìm (first_name, last_name), department ID và department name của tất cả các nhân viên employees
SELECT 
	(e.first_name || ' ' || e.last_name) AS full_name, 
	e.department_id, 
	d.department_name
FROM
	employees e
JOIN
	departments d ON e.department_id = d.department_id;
--3.	Tìm (first_name, last_name), job, department ID và department name của tất cả các nhân viên làm việc tại London
SELECT
	(e.first_name || ' ' || e.last_name) AS full_name,
	j.job_title,
	d.department_id,
	d.department_name
FROM
	employees e
JOIN
	jobs j ON e.job_id = j.job_id
JOIN
	departments d ON e.department_id = d.department_id;

--4.	Tìm employee id, name (last_name) cùng với  manager_id and name (last_name) của quản lý của nhân viên đó

SELECT
	e.employee_id,
	e.last_name,
	e.manager_id,
	d.department_name
FROM
	employees e
JOIN
	departments d ON e.manager_id = d.manager_id;

--5. Tìm (first_name, last_name) và hire date của nhân viên được tuyển dụng sau ngày tuyển dụng của nhân viên “John Doe”
SELECT
	(e.first_name || ' ' || e.last_name) AS full_name,
	hire_date
FROM
	employees e
WHERE
	hire_date > (SELECT hire_date FROM employees WHERE last_name = 'Brown' AND first_name = 'Joe');

--6. Đưa ra department name và số nhân viên employees trong từng department. 
SELECT 
	d.department_name, 
    COUNT(e.employee_id) as number_of_employees
FROM 
    departments d
JOIN 
    employees e ON d.department_id = e.department_id
GROUP BY 
    d.department_name;


-- 7.	Đưa ra employee ID, job title, số ngày làm việc tính từ ngày bắt đầu và ngày kết thúc cho tất cả các công việc thuộc về department có ID là 1
-- Đồng bộ dữ liệu giữa job_history và employee_id
UPDATE job_history
SET job_id = (SELECT job_id FROM employees WHERE employees.employee_id = job_history.employee_id),
    department_id = (SELECT department_id FROM employees WHERE employees.employee_id = job_history.employee_id)
WHERE EXISTS (SELECT 1 FROM employees WHERE employees.employee_id = job_history.employee_id);
SELECT 
	jh.employee_id, 
	j.job_title, 
	jh.start_date, 
	jh.end_date,
	(jh.end_date - jh.start_date) as days_worked
FROM
	job_history jh
JOIN 
	jobs j ON jh.job_id = j.job_id
WHERE 
	jh.department_id = 1;

--8.	Viết truy vấn đưa ra department ID và  name và  first name của quản lý manager và đưa ra tên nhân viên họ quản lí
-- Tạo bảng manager để phục vụ câu này
create table managers(
	manager_id INT PRIMARY KEY,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	salary INT,
	commision_pct INT,
	department_id INT
);
INSERT INTO managers(manager_id, first_name, last_name, email, phone_number, hire_date, salary, commision_pct, department_id)
VALUES 
(101, 'A', 'Doe', 'john.doe@example.com', '1234567890', '2022-01-01', 50000, 10, 1),
(102, 'B', 'Doe', 'jane.doe@example.com', '1234567891', '2022-01-02', 60000, 20, 2),
(103, 'C', 'Doe', 'jim.doe@example.com', '1234567892', '2022-01-03', 70000, 30, 3),
(104, 'D', 'Doe', 'jill.doe@example.com', '1234567893', '2022-01-04', 80000, 40, 4),
(105, 'E', 'Doe', 'joe.doe@example.com', '1234567894', '2022-01-05', 90000, 50, 5);

ALTER TABLE departments ADD CONSTRAINT manager_id_fk_to_department Foreign Key (manager_id) REFERENCES managers(manager_id);
ALTER TABLE employees ADD CONSTRAINT manager_id_fk_to_employee Foreign Key (manager_id) REFERENCES managers(manager_id);

SELECT
	d.department_id,
	(m.first_name || ' ' || m.last_name) AS manager_name
FROM
	departments d
JOIN
	managers m ON d.manager_id = m.manager_id;

-- Nhóm các tên vào cùng 1 hàng
SELECT 
    m.manager_id, 
    string_agg((e.first_name || ' ' || e.last_name)::text, ', ') AS employee_names
FROM 
    managers m
JOIN 
    employees e ON m.manager_id = e.manager_id
GROUP BY 
    m.manager_id
ORDER BY
	m.manager_id;
-- Hiển thị tên kèm job
SELECT 
    m.manager_id, 
    (e.first_name || ' ' || e.last_name) AS employee_name,
	j.job_title
FROM 
    managers m
JOIN 
    employees e ON m.manager_id = e.manager_id
JOIN
    jobs j ON e.job_id = j.job_id
ORDER BY
    m.manager_id;

-- 9.	Viết truy vấn đưa ra department name, manager name và city. 
SELECT 
	d.department_name, 
	(m.first_name || ' ' || m.last_name) AS manager_name, 
	l.city
FROM
	departments d
JOIN
	managers m ON d.manager_id = m.manager_id
JOIN
	locations l ON d.location_id = l.location_id;

--10.	Đưa ra job title và mức lương trung bình của nhân viên ứng với job title đó
SELECT 
	j.job_title, 
	ROUND(AVG(e.salary),2) AS average_salary
FROM
	jobs j
JOIN	
	employees e ON j.job_id = e.job_id
GROUP BY
	j.job_title;

--11.	Đưa ra job title, employee name, và độ lệch về lương của nhân viên này với mức lương thấp nhất của job đó
SELECT
	jobs.job_title,
	(e.first_name || ' ' || e.last_name) AS employee_name,
	e.salary - jobs.min_salary AS salary_difference
FROM
	jobs
JOIN
	employees e ON jobs.job_id = e.job_id;

-- 12.	Đưa ra job history cuả nhân viên mà mức lương hiện tại lớn hơn 10000
SELECT 
	jh.employee_id, 
	j.job_title, 
	jh.start_date, 
	jh.end_date,
	e.salary
FROM
	job_history jh
JOIN
	jobs j ON jh.job_id = j.job_id
JOIN
	employees e ON jh.employee_id = e.employee_id
WHERE
	e.salary > 10000;
--13.	Đưa ra department name, name (first_name, last_name), hire date, salary của quản lý manager mà có kinh nghiệm lớn hơn 2 năm 
SELECT 
	d.department_name, 
	(m.first_name || ' ' || m.last_name) AS manager_name, 
	m.hire_date, 
	m.salary
FROM
	departments d
JOIN
	managers m ON d.manager_id = m.manager_id
WHERE
	m.hire_date < (CURRENT_DATE - INTERVAL '2 years');

--WORD 6
--1.	Đưa ra số lượng các job có trong bảng nhân viên employees
SELECT COUNT(DISTINCT job_id) AS "Number of Jobs" FROM employees;
--2.	Đưa ra tổng lương phải trả cho các nhân viên trong bảng employees
SELECT SUM(salary) FROM employees;
--3.	Đưa ra mức lương thấp nhất trong bảng employees. 
SELECT MIN(salary) AS "Min Salary" FROM employees;
--4.	Đưa ra mức lương cao nhất của một nhân viên là Software Engineer. 
SELECT MAX(salary) AS "Max Salary" FROM employees WHERE job_id = (SELECT job_id FROM jobs WHERE job_title = 'Software Engineer');
--5.	Đưa ra mức lương trung bình và số lượng nhân viên làm việc cho department có ID là 1.
SELECT ROUND(AVG(salary),2) AS "Average Salary", COUNT(employee_id) AS "Number of Employees" FROM employees WHERE department_id = 1;
--6.	Đưa ra mức lương cao nhất, thấp nhất, tổng, và trung bình của tất cả các nhân viên. 
SELECT MAX(salary) AS "Max Salary", MIN(salary) AS "Min Salary", SUM(salary) AS "Total Salary", AVG(salary) AS "Average Salary" FROM employees;
--7.	Đưa ra danh sách job title và số lượng nhân viên có job title tương ứng. 
SELECT 
    job_title, 
    COUNT(employee_id) AS employee_count
FROM 
    employees
JOIN
	jobs ON employees.job_id = jobs.job_id
GROUP BY 
    job_title
--8.	Đưa ra khoảng cách lương giữa mức lương cao nhất và thấp nhất. 
SELECT MAX(salary) - MIN(salary) AS "Salary Range" FROM employees;
--9.	Tìm manager ID và mức lương mà là mức lương thấp nhất của nhân viên mà vị trí manager quản lí
SELECT 
    manager_id, 
    MIN(salary) AS min_salary
FROM 
    employees
GROUP BY 
    manager_id;
--10.	Đưa ra danh sách department ID và tổng lương ứng với từng department đó. 
SELECT 
	department_id, 
	SUM(salary) AS total_salary
FROM
	employees
GROUP BY
	department_id;
--11.	Đưa ra mức lương trung bình cho mỗi job tilte loại trừ nghề UX Designer. 
SELECT 
    j.job_title, 
    ROUND(AVG(e.salary),2) AS average_salary
FROM 
    employees e
JOIN 
    jobs j ON e.job_id = j.job_id
WHERE 
    j.job_title != 'UX Designer'
GROUP BY 
    j.job_title;
--12.	Đưa ra tổng lương, lương cao nhất, thấp nhất, trung bình của mỗi job ID mà thuộc về department có ID là 1.
SELECT 
	job_id, 
	SUM(salary) AS total_salary, 
	MAX(salary) AS max_salary, 
	MIN(salary) AS min_salary, 
	ROUND(AVG(salary),2) AS average_salary
FROM
	employees
WHERE
	department_id = 1 
GROUP BY
	job_id;
--13.	Đưa ra job ID, mà mức lương cao nhất của nhân viên có vị trí này lớn hơn hoặc bằng $76000
SELECT
	j.job_title,
	MAX(e.salary) AS max_salary
FROM
	employees e
JOIN
	jobs j ON e.job_id = j.job_id
WHERE 
	e.salary >= 76000
GROUP BY
	j.job_title;
--14.	Đưa ra mức lương trung bình của tất cả các department mà có ít hơn 10 nhân viên. 
SELECT 
	department_id, 
	ROUND(AVG(salary),2) AS average_salary
FROM
	employees
GROUP BY
	department_id
HAVING
	COUNT(employee_id) < 4;

-- WORD_7
-- 1.	Đưa ra first_name, last_name và lương của những nhân viên mà có mức lương cao hơn nhân viên có last_name là ‘Bull’.
SELECT 
	first_name,
	last_name,
	salary
FROM employees
WHERE 
	salary > (SELECT salary FROM employees WHERE last_name = 'Smith');

--2.	Đưa ra first_name, last_name của tất cả các nhân viên làm việc ở department IT 
SELECT 
    first_name,
    last_name 
FROM employees 
WHERE 
    manager_id IS NOT NULL AND department_id = (SELECT department_id FROM departments WHERE department_name = 'IT');
SELECT 
    e.first_name,
    e.last_name 
FROM 
    employees e
JOIN 
    departments d ON e.department_id = d.department_id
WHERE 
    d.department_name = 'IT';
--3.	Đưa ra first_name, last_name của tất cả nhân viên mà có quản lý và làm việc tại department ở USA
SELECT 
    first_name,
    last_name
FROM
    employees
WHERE
    manager_id IS NOT NULL AND department_id IN (SELECT department_id FROM departments WHERE location_id IN (SELECT location_id FROM locations WHERE country_id = 'US'));
--4.Đưa ra first_name, last_name của nhân viên mà là quản lý. 
SELECT 
	first_name,
	last_name
FROM
	employees
WHERE
	manager_id IS NOT NULL;
--5.	Đưa ra first_name, last_name và lương của nhân viên mà mức lương của họ cao hơn mức lương trung bình 
SELECT 
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary > (SELECT AVG(salary) FROM employees);
--6.	Đưa ra first_name, last_name và mức lương của nhân viên mà mức lương bằng mức lương tối thiểu của job grade của họ
SELECT 
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary = (SELECT min_salary FROM jobs WHERE job_id = employees.job_id);
--7.	Đưa ra first_name, last_name và mức lương của nhân viên mà thu nhập nhiều hơn mức lương trung bình và làm việc trong một trong các department IT 
SELECT 
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary > (SELECT AVG(salary) FROM employees) AND department_id IN (SELECT department_id FROM departments WHERE department_name = 'IT');
--8.	Đưa ra first_name, last_name và mức lương của nhân viên mà thu nhập cao hơn mức lương của Mr. Jeremy
SELECT 
	first_name,
	last_name,
	salary
FROM 
	employees
WHERE
	salary > (SELECT salary FROM employees WHERE first_name = 'Jeremy');
--9.	Đưa ra first_name, last_name và mức lương của nhân viên mà thu nhập bằng mức lương tối thiểu của tất cả các departments
SELECT 
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary = (SELECT MIN(salary) FROM employees);
--10.	Đưa ra first_name, last_name và mức lương của nhân viên mà mức lương lớn hơn mức lương tối thiểu của tất cả các departments
SELECT 
	first_name,
	last_name,
	salary
FROM
	employees
WHERE
	salary > (SELECT MIN(salary) FROM employees);
--11.	Đưa ra first_name, last_name và mức lương của nhân viên mà mức lương cao hơn mức lương của những người có JOB_ID = ‘Systems Administrator’. Sắp xếp mức lương từ thấp nhất tới cao nhất
SELECT 
    first_name,
    last_name,
    salary
FROM 
    employees
WHERE 
    salary > (SELECT MAX(salary) FROM employees WHERE job_id IN (SELECT job_id FROM jobs WHERE job_title = 'Systems Administrator'))
ORDER BY 
    salary ASC;
--12.	Đưa ra first_name, last_name của nhân viên mà không phải supervisor.
SELECT 
	first_name,
	last_name
FROM
	employees
WHERE
	manager_id IS NULL;
--13.	Đưa ra employee ID, first_name, last_name, department name của tất cả các nhân viên. 
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	d.department_name
FROM
	employees e
JOIN
	departments d ON e.department_id = d.department_id;
--14.	Đưa ra employee ID, first_name, last_name, department name của tất cả các nhân viên mà mức lương cao hơn mức lương trung bình ở department mà họ làm việc.
SELECT 
	e.employee_id,
	e.first_name,
	e.last_name,
	e.salary,
	d.department_name
FROM
	employees e
JOIN
	departments d ON e.department_id = d.department_id
WHERE
	e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);
--15.	Đưa ra các bản ghi có thứ tự lẻ từ bảng employees. 
SELECT * FROM employees WHERE MOD(employee_id, 2) = 1;
--16.	Đưa ra mức lương cao thứ 5 trong bảng employees. 
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET 4;
--17.	Đưa ra mức lương thấp thứ 4 trong bảng employees. 
SELECT DISTINCT salary
FROM employees
ORDER BY salary ASC
LIMIT 1 OFFSET 3;
--18.	Lấy 10 bản ghi cuối cùng của 1 bảng bất kỳ. 
SELECT * FROM employees ORDER BY employee_id DESC LIMIT 10;
--19.	Đưa ra danh sách department ID và tên của tất cả các departments mà không có nhân viên nào
SELECT 
	department_id,
	department_name
FROM
	departments
WHERE
	department_id NOT IN (SELECT department_id FROM employees);
--20.	Đưa ra 3 mức lương cao nhất 
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 3;
--21.	Đưa ra 3 mức lương thấp nhất
SELECT DISTINCT salary
FROM employees
ORDER BY salary ASC
LIMIT 3;
--22.	Đưa ra mức lương cao thứ n trong bảng employees. 
SELECT DISTINCT salary
FROM employees
ORDER BY salary DESC
LIMIT 1 OFFSET n-1;




