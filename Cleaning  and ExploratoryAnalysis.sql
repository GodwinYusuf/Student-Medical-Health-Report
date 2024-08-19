/** 
Author :     	Godwin Yusuf
Date: 	     	22:55 23/11/2023
Title: 	     	Resturant Sales Report
Tool: 	     	SQL on Github 
Project Source: https://www.kaggle.com/datasets/shariful07/student-mental-health
**/

SELECT 
    *
FROM
    stmh;
    
desc stmh;

-- Converting the text DATE column to a DATE datatype columne

-- a. Replacing the "/" to "-" for the dateformat
update stmh
set date = replace(date, "/" ,"-");

-- b. Converting the date column from string "text" to "dateformat"
update stmh
set date = str_to_date(date, "%d-%m-%YYYY");

-- c. Modifying the datatype to a date on the date column
alter table stmh
modify date date;


-- Adding a column to assign student_id serial number.
ALTER TABLE STMH
add column Student_id  INT not null AUTO_INCREMENT UNIQUE key;



-- Separarting the date column  into D_Year, D_Month, Quarter, D_Day into newly created column
SELECT 
    date,
    EXTRACT(YEAR FROM `DATE`) AS Year, -- extracts just the year from date column 
    EXTRACT(MONTH FROM `DATE`) AS Month, -- extracts just the month from date column 
    EXTRACT(DAY FROM `DATE`) AS Day, -- extracts just the Day from date column 
    EXTRACT(QUARTER FROM `DATE`) AS Quarter -- extracts just the quarter from date column 
FROM
    stmh;

 -- Gender Distribution between male and female.
 SELECT 
    Gender, COUNT(gender) AS `No_students`
FROM
    stmh
GROUP BY 1
ORDER BY 1;


-- Marital count Status distribution.
SELECT 
    Gender,
    COUNT(CASE
        WHEN `marital status` = 'YES' THEN gender
        ELSE NULL
    END) AS Married,
    COUNT(CASE
        WHEN `marital status` = 'NO' THEN gender
        ELSE NULL
    END) AS Not_Married
FROM
    stmh
GROUP BY 1;


/** Grouping depressed and non depressed student into a column to see which gender has the most ill students
 Depressed, Anxiety, Panic attack and Specialist Treatment **/
 
 
-- Depressed students
SELECT 
    Gender,
    COUNT(CASE
        WHEN depression = "YES" THEN gender
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN depression = "NO" THEN gender
        ELSE NULL
    END) AS Not_Depressed
FROM
    stmh
GROUP BY gender;


-- Anxiety Students
SELECT 
    Gender,
    COUNT(CASE
        WHEN anxiety = "YES" THEN gender
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN anxiety = "NO" THEN gender
        ELSE NULL
    END) AS No_anxiety
FROM
    stmh
GROUP BY gender;


-- Panic attack students
SELECT 
    Gender,
    COUNT(CASE
        WHEN panic_attack = "YES" THEN gender
        ELSE NULL
    END) AS Panic_attacked,
    COUNT(CASE
        WHEN panic_attack = "NO" THEN gender
        ELSE NULL
    END) AS No_panic_attack
FROM
    stmh
GROUP BY gender;

-- Specialist treatment column 
SELECT 
    Gender,
    COUNT(CASE
        WHEN Specialist_treatment = "YES" THEN gender
        ELSE NULL
    END) AS SP_treatment,
    COUNT(CASE
        WHEN Specialist_treatment = "NO" THEN gender
        ELSE NULL
    END) AS No_Specialist_Treatment
FROM
    stmh
GROUP BY gender;

 -- choosing the right description for each grade on the CGPA column
SELECT DISTINCT
    cgpa,
    CASE
        WHEN cgpa BETWEEN 0 AND 1.99 THEN 'Poor '
        WHEN cgpa BETWEEN 2.00 AND 2.49 THEN 'Weak '
        WHEN cgpa BETWEEN 2.50 AND 2.99 THEN 'Average '
        WHEN cgpa BETWEEN 3.00 AND 3.49 THEN 'Good '
        WHEN cgpa BETWEEN 3.50 AND 4.00 THEN 'Distinction'
        ELSE NULL
    END result
FROM
    stmh;

--  Renaming column grade to Grade**/
alter TABLE stmh
rename column grade to Grade;


 -- update stmh table with new column grading the each CGPA with a description
update  stmh
set Grade =  CASE
        WHEN cgpa BETWEEN 0 AND 1.99 THEN 'Poor '
        WHEN cgpa BETWEEN 2.00 AND 2.49 THEN 'Weak '
        WHEN cgpa BETWEEN 2.50 AND 2.99 THEN 'Average '
        WHEN cgpa BETWEEN 3.00 AND 3.49 THEN 'Good '
        WHEN cgpa BETWEEN 3.50 AND 4.00 THEN 'Distinction'
        ELSE NULL
    END ;



    






