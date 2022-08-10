-- Membuat tabel teachers
CREATE TABLE teachers(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   first_name VARCHAR(25) not NULL,
   last_name VARCHAR(50),
   school VARCHAR(50) not NULL,
   hire_date DATE,
   salary numeric
);

-- Memasukkan data ke tabel teachers dengan id
INSERT INTO
  teachers(id,first_name, last_name, school, hire_date, salary)
VALUES
           (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
-- Memasukkan data ke tabel teachers tanpa id   
INSERT INTO
  teachers(first_name, last_name, school, hire_date, salary)
VALUES
           ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
           
-- Membuat tabel courses
CREATE TABLE courses(
   id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   name VARCHAR(20),
   teachers_id INT,
   total_students INT
);

-- Memasukkan data ke tabel courses
INSERT INTO
  courses (name, teachers_id, total_students)
VALUES
            ('Calculus', 2, 20),
            ('Physics', 2, 10),
            ('Calculus', 1, 30),
            ('Computer Science', 1, 20),
            ('Politic', 13, 15),
            ('Algebra', 2, 10),
            ('Algebra', 13, 30),
            ('Computer Science', 10, 35),
            ('Life Science', 11, 20),
            ('Chemistry', 9, 22),
            ('Chemistry', 8, 16),
            ('Calculus', 5, 19),
            ('Politic', 4, 17),
            ('Biology', 6, 22),
            ('Physics', 3, 29),
            ('Biology', 8, 28),
            ('Calculus', 12, 34),
            ('Physics', 13, 34),
            ('Biology', 14, 25),
            ('Calculus', 15, 20);

-- Soal
SELECT *
From teachers a
JOIN courses b
ON   a.id = b.teachers_id
ORDER BY name
;

-- Case1 group by
-- Case 1 teacher with highest salary for each university
SELECT first_name, last_name, MAX(salary) AS salary, school
FROM teachers
GROUP BY school
;


-- Case 2 teacher with highest salary from stanford university
SELECT first_name, last_name, MAX(salary) AS salary, school
FROM teachers
WHERE school = 'Standford University'
;

-- Case 2 Join
-- Case 1 Display all courses with teacher's identity
SELECT
  *
FROM 
  teachers a
RIGHT JOIN
  courses b
ON
  a.id = b.teachers_id;
  
-- Case 2 Display how many courses per universities
SELECT
  COUNT(*) as number_of_courses, school
FROM 
  courses 
LEFT JOIN
  teachers
ON
  courses.teachers_id = teachers.id
GROUP BY
  school;
  
-- Case 3 Display how many total_students per teacher
SELECT 
  first_name, last_name, SUM(total_students) as 'total_students'
FROM
  teachers a
LEFT JOIN
  courses b
ON
  a.id = b.teachers_id
GROUP BY
  teachers_id;
  
-- Case 4 Display how many courses per teachers
SELECT DISTINCT
 first_name, last_name, COUNT(name) AS number_of_courses
FROM
 teachers a
left JOIN
  courses b
ON 
  a.id = b.teachers_id
group BY
  teachers_id;
  




  
