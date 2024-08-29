-- Create Departments Table
CREATE TABLE departments (
    dept_no VARCHAR(4) PRIMARY KEY,             
    dept_name VARCHAR(50) NOT NULL              
);

-- Create Titles Table
CREATE TABLE titles (
    title_id VARCHAR(5) PRIMARY KEY,            
    title VARCHAR(50) NOT NULL                  
);

-- Create Employees Table
CREATE TABLE employees (
    emp_no INT PRIMARY KEY,                     
    emp_title_id VARCHAR(5) NOT NULL,           
    birth_date DATE NOT NULL,                  
    first_name VARCHAR(50) NOT NULL,            
    last_name VARCHAR(50) NOT NULL,             
    sex CHAR(1) NOT NULL,                       
    hire_date DATE NOT NULL,                    
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id) 
);

-- Create Salaries Table
CREATE TABLE salaries (
    emp_no INT PRIMARY KEY,                     
    salary INT NOT NULL,                        
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);

-- Create Department Employees Table (dept_emp)
CREATE TABLE dept_emp (
    emp_no INT,                                 
    dept_no VARCHAR(4),                         
    PRIMARY KEY (emp_no, dept_no),             
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no),  
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no) 
);

-- Create Department Managers Table (dept_manager)
CREATE TABLE dept_manager (
    dept_no VARCHAR(4),                         
    emp_no INT,                                 
    PRIMARY KEY (dept_no, emp_no),              
    FOREIGN KEY (dept_no) REFERENCES departments(dept_no), 
    FOREIGN KEY (emp_no) REFERENCES employees(emp_no) 
);