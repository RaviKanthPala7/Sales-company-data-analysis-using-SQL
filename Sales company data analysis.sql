-- CREATE A TABLE BY THE NAME EMPLOYEE

CREATE TABLE employee
(
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(40),
    last_name VARCHAR(40),
    birth_date DATE,
    sex VARCHAR(1),
    salary INT,
    super_id INT,
    branch_id INT
);

ALTER TABLE employee
ADD FOREIGN KEY(super_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

ALTER TABLE employee
ADD FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL;

DESCRIBE employee;

-- CREATE A TABLE BY THE NAME BRANCH

CREATE TABLE branch
(
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(40),
    mgr_id INT,
    mgr_start_date DATE

);

ALTER TABLE branch
ADD FOREIGN KEY(mgr_id) REFERENCES employee(emp_id) ON DELETE SET NULL;

DESCRIBE branch;

DROP TABLE student;

-- CREATE A TABLE BY THE NAME BRANCH

CREATE TABLE client(
    client_id INT,
    client_name VARCHAR(40),
    branch_id INT,
    PRIMARY KEY(client_id),
    FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE SET NULL
);

DESCRIBE client;

-- CREATE A TABLE BY THE NAME WORKS_WITH

CREATE TABLE works_with(
    emp_id INT,
    client_id INT,
    total_sales VARCHAR(40),
    PRIMARY KEY(emp_id, client_id)
);

DESCRIBE works_with;

ALTER TABLE works_with
ADD FOREIGN KEY(emp_id) REFERENCES employee(emp_id) ON DELETE CASCADE;

ALTER TABLE works_with
ADD FOREIGN KEY(client_id) REFERENCES client(client_id) ON DELETE CASCADE;

-- CREATE A TABLE BY THE NAME works_with

CREATE TABLE branch_supplier(
        branch_id INT,
        supplier_name VARCHAR(40),
        supply_type VARCHAR(40),
        PRIMARY KEY(branch_id, supplier_name),
        FOREIGN KEY(branch_id) REFERENCES branch(branch_id) ON DELETE CASCADE
);

DESCRIBE branch_supplier;

-- INSERT VALUES INTO employee table

INSERT INTO employee VALUES(100,'David','Wallace','1967-11-17','M',250000,NULL,NULL);
INSERT INTO employee VALUES(101,'Jan','Levinson','1961-05-11','F','110000',100,NULL);
INSERT INTO employee VALUES(102,'Michael','Scott','1964-03-15','M',75000,100,NULL);
INSERT INTO employee VALUES(103,'Angela', 'Martin', '1971-06-25', 'F', 63000, 102, NULL);
INSERT INTO employee VALUES(104, 'Kelly', 'Kapoor', '1980-02-05' ,'F', 55000, 102, NULL);
INSERT INTO employee VALUES(105, 'Stanley', 'Hudson', '1958-02-19', 'M', 69000, 102, NULL);
INSERT INTO employee VALUES(106, 'Josh', 'Porter', '1969-09-05', 'M', 78000, 100, NULL);
INSERT INTO employee VALUES(107, 'Andy', 'Bernard', '1973-07-22', 'M', 65000, 106, NULL);
INSERT INTO employee VALUES(108, 'Jim', 'Halpert', '1978-10-01', 'M' ,71000, 106 ,NULL);



DESCRIBE employee;
SELECT *
FROM employee;

-- INSERT VALUES INTO branch table

INSERT INTO branch VALUES(1,'Corporate',100,'2006-02-09');
INSERT INTO branch VALUES(2, 'Scranton', 102, '1992-04-06');
INSERT INTO branch VALUES(3,'Stamford', 106, '1998-02-13');

SELECT *
FROM branch;

UPDATE employee
SET branch_id =1
WHERE emp_id=100;

SELECT *
FROM employee;

UPDATE employee
SET branch_id=1
WHERE emp_id=101;

UPDATE employee
SET branch_id=2
WHERE emp_id=102 OR emp_id=103 OR emp_id=104 OR emp_id=105;

UPDATE employee
SET branch_id=3
WHERE emp_id=106 OR emp_id=107 OR emp_id=108;


-- INSERT VALUES INTO client table

INSERT INTO client VALUES(400, 'Dunmore Highschool', 2);

SELECT *
FROM client;

INSERT INTO client VALUES(401, 'Lackawana Country', 2);
INSERT INTO client VALUES(402, 'FedEx', 3);
INSERT INTO client VALUES(403, 'John Daly Law, LLC', 3);
INSERT INTO client VALUES(404, 'Scranton Whitepages', 2);
INSERT INTO client VALUES(405, 'Times Newspaper',3);
INSERT INTO client VALUES(406, 'FedEx' ,2);

SELECT *
FROM works_with;

-- INSERT VALUES INTO works_with table

INSERT INTO works_with VALUES(105, 400, 55000);
INSERT INTO works_with VALUES(102, 401, 267000);
INSERT INTO works_with VALUES(108, 402, 22500);
INSERT INTO works_with VALUES(107, 403, 5000);
INSERT INTO works_with VALUES(108, 403, 12000);
INSERT INTO works_with VALUES(105, 404, 33000);
INSERT INTO works_with VALUES(107, 405, 26000);
INSERT INTO works_with VALUES(102, 406, 15000);
INSERT INTO works_with VALUES(105, 406, 130000);

SELECT *
FROM branch_supplier;

-- INSERT VALUES INTO branch_supplier table

INSERT INTO branch_supplier VALUES(2, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Patriot Paper', 'Paper');
INSERT INTO branch_supplier VALUES(2, 'J.T. Forms & Labels', 'Custom Forms');
INSERT INTO branch_supplier VALUES(3, 'Uni-ball', 'Writing Utensils');
INSERT INTO branch_supplier VALUES(3, 'Hammer Mill', 'Paper');
INSERT INTO branch_supplier VALUES(3, 'Stamford Lables', 'Custom Forms');

SELECT *
FROM employee;

--Find all employees


SELECT employee.first_name, employee.last_name
FROM employee;

--Find all clients

SELECT client.client_name
FROM client;

--Find all employees ordered by salary

SELECT employee.first_name, employee.last_name, employee.salary
FROM employee
ORDER BY employee.salary DESC;

--Find all employees ordered by sex then name

SELECT employee.first_name, employee.last_name, employee.sex
FROM employee
ORDER BY employee.sex, employee.first_name;

--Find the first 5 employees in the table

SELECT *
FROM employee
LIMIT 5;

--Find the first and last names of all employees

SELECT employee.first_name, employee.last_name
FROM employee;

--Find the forename and surnames names of all employees

SELECT employee.first_name, employee.last_name
FROM employee;

--Find out all the different genders

SELECT employee.sex
FROM employee
GROUP BY employee.sex;

--Find all male employees

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.sex='M';

--Find all employees at branch 2

SELECT employee.first_name, employee.last_name
FROM employee
WHERE branch_id=2;

--Find all employee's id's and names who were born after 1969

SELECT employee.emp_id, employee.first_name, employee.last_name, employee.birth_date
FROM employee
WHERE employee.birth_date>='1970-01-01';

--Find all female employees at branch 2

SELECT employee.first_name, employee.last_name, employee.sex, employee.branch_id
FROM employee
WHERE employee.sex='F' AND employee.branch_id=2;

--Find all employees who are female & born after 1969 or who make over 80000

SELECT employee.first_name, employee.last_name, employee.sex, employee.birth_date, employee.salary
FROM employee
WHERE  (employee.sex='F' AND employee.birth_date>='1970-01-01') OR employee.salary>80000;

--Find all employees born between 1970 and 1975

SELECT employee.first_name, employee.last_name, employee.birth_date
FROM employee
WHERE employee.birth_date BETWEEN '1970-01-01' AND '1975-12-31';

--Find all employees named Jim, Michael, Johnny or David

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.first_name IN ('Jim', 'Michael', 'Johnny', 'David');

-- Find the number of employees

SELECT COUNT(employee.emp_id)
FROM employee;

-- Find the average of all employee's salaries

SELECT AVG(employee.salary)
FROM employee;

-- Find the sum of all employee's salaries

SELECT SUM(employee.salary)
FROM employee;

-- Find out how many males and females there are

SELECT COUNT(employee.sex), employee.sex
FROM employee
GROUP BY employee.sex;

-- Find the total sales of each salesman

SELECT  works_with.emp_id, SUM(works_with.total_sales)
FROM works_with
GROUP BY works_with.emp_id;

-- Find the total amount of money spent by each client

SELECT works_with.client_id, SUM(works_with.total_sales)
FROM works_with
GROUP BY works_with.client_id;

-- Find any client's who are an LLC

SELECT *
FROM client
WHERE client.client_name LIKE '%LLC';

-- Find any branch suppliers who are in the label business

SELECT *
FROM branch_supplier
WHERE branch_supplier.supplier_name LIKE '%Label%';

-- Find any employee born on the 10th day of the month

SELECT employee.first_name, employee.last_name
FROM employee
WHERE employee.birth_date LIKE '____-__-10';

-- Find any clients who are schools

SELECT *
FROM client
WHERE client_name LIKE '%school%' ;

-- Find a list of employee and branch names

SELECT employee.first_name
FROM employee
UNION
SELECT branch_name
FROM branch;

---- Find a list of all clients & branch suppliers' names

SELECT client_name
FROM client
UNION
SELECT supplier_name
FROM branch_supplier;

-- Add the extra branch

INSERT INTO branch VALUES(4, "Buffalo", NULL, NULL);

--JOINS

SELECT employee.emp_id, employee.first_name, branch.branch_name
FROM employee
JOIN branch
ON employee.emp_id = branch.mgr_id;



-- Find names of all employees who have sold over 50,000

SELECT first_name
FROM employee
WHERE emp_id IN(
    SELECT emp_id
    FROM works_with
    WHERE total_sales>50000

);

-- Find all clients who are handles by the branch that Michael Scott manages -- Assume you know Michael's ID

SELECT client_name, BRANCH_ID
FROM client
WHERE branch_id IN(
    SELECT branch_id
   FROM BRANCH
   WHERE mgr_id=102

);

-- Find all clients who are handles by the branch that Michael Scott manages -- Assume you DONT'T know Michael's ID

SELECT *
FROM employee;

SELECT *
FROM branch;

SELECT client_name
FROM client
WHERE branch_id IN (
    SELECT branch_id
    FROM branch
    WHERE mgr_id = (
                     SELECT emp_id
                    FROM employee
                    WHERE first_name='Michael' AND last_name='Scott'
)
);

-- Find the names of employees who work with clients handled by the Scranton branch

SELECT first_name, last_name
FROM employee
WHERE emp_id IN (
    SELECT emp_id
FROM WORKS_WITH
WHERE client_id IN (
    SELECT client_id
FROM client
WHERE branch_id = (
    
SELECT branch_id
FROM branch
WHERE branch_name = 'Scranton'

)

)
);

---- Find the names of all clients who have spent more than 100,000 dollars

SELECT client_name
FROM client
WHERE client_id IN(
    SELECT client_id
FROM works_with
WHERE total_sales>100000


);

SELECT client.client_name
FROM client
WHERE client.client_id IN (
                          SELECT client_id
                          FROM (
                                SELECT SUM(works_with.total_sales) AS totals, client_id
                                FROM works_with
                                GROUP BY client_id) AS total_client_sales
                          WHERE totals > 100000
);

SELECT first_name, last_name, birth_date, CASE
WHEN birth_date<'1970-01-01' THEN 'old'
WHEN birth_date<'1975-01-01' THEN 'medium'
ELSE 'young'
END AS aaha
FROM employee;

SELECT sex , count(*)
FROM employee
GROUP BY sex
HAVING COUNT(*)>3
ORDER BY count(*) ASC;

SELECT first_name, branch_name
FROM employee
RIGHT JOIN branch
ON emp_id=mgr_id;


SELECT DISTINCT client_id
FROM works_with;

SELECT *
FROM branch;

DELETE FROM branch
WHERE branch_id=4;

INSERT INTO branch VALUES(4,'Buffalo',NULL,NULL);

WITH birth_table AS(
    SELECT first_name, birth_date
    FROM employee
)
SELECT birth_date
FROM birth_table;

SELECT sex, SUM(salary)
FROM employee
GROUP BY sex
HAVING SUM(salary)<229000;

SELECT first_name, branch_name
FROM employee
JOIN branch
ON emp_id=mgr_id;

