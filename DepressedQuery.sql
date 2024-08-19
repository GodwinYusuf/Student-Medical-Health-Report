/** Author : 			@godwin.yusuf@outlook.com
	Date:  				16-12-2023
	Title: 				Student Mental Health (Project)
    Objective:  		Analysis.
    Project Source: 	https://www.kaggle.com/datasets/shariful07/student-mental-health
**/

SELECT 
    *
FROM
    STMH;

#########################################################################################

/** Gender distribution of depressed people, we found out that all married people are depressed
with women FIVE TIMES as more as men **/

-- @Total Number of Depressed Students

SELECT 
    GENDER,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN GENDER
        ELSE NULL
    END) AS Depressed
FROM
    STMH
GROUP BY 1;


#########################################################################################

-- @Total Number of  None Depressed Students
SELECT 
    GENDER,
    COUNT(CASE
        WHEN DEPRESSION = 'NO' THEN GENDER
        ELSE NULL
    END) AS NOTDepressed
FROM
    STMH
GROUP BY 1;


########################################################################################

-- @Depressed and Married Students
SELECT 
    GENDER, `Marital status` as Marital_status,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN GENDER
        ELSE NULL
    END) AS DEPRESSED
FROM
    STMH
WHERE
    `MARITAL STATUS` = "YES"
GROUP BY 1,2 ;


#######################################################################################

-- @Depressed and not married.
SELECT 
    GENDER, `MARITAL STATUS`,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN GENDER
        ELSE NULL
    END) AS NOT_DEPRESSED
FROM
    STMH
WHERE
    `MARITAL STATUS` = "NO"
GROUP BY 1,2 ;


#######################################################################################

-- @Age Distribution table of Depressed students
SELECT 
    Gender,
    age,
    COUNT(CASE
        WHEN Depression = 'yes' THEN gender
        ELSE NULL
    END) AS Depressed
FROM
    stmh
GROUP BY 1 , 2
ORDER BY 2;


#########################################################################################

-- @Age Distribution of student Depressed that are married.
SELECT 
    Gender,`Marital status`,
    Age,
    COUNT(CASE
        WHEN Depression = 'yes' THEN gender
        ELSE NULL
    END) AS No_Depressed
FROM
    stmh
WHERE `MARITAL STATUS` = "YES"
GROUP BY 1 , 2, 3
ORDER BY 3;


########################################################################################

-- @Courses taken by students that are married.
SELECT 
    Course,
    Gender,
    COUNT(CASE
        WHEN depression = 'yes' THEN gender
        ELSE NULL
    END) AS no_Depressed
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
    WHEN depression = 'yes' THEN gender
    ELSE NULL
END) > 0
ORDER BY 1;


#########################################################################################

-- @Depressed students by year study.
SELECT 
    `year Study`,
    COUNT(CASE
        WHEN depression = 'yes' THEN gender
        ELSE NULL
    END) AS Depressed_YearCount
FROM
    stmh
GROUP BY 1
;

#########################################################################################

-- @Depressed student gender distribution by year study
SELECT 
    Gender,`year Study`,
    COUNT(CASE
        WHEN depression = 'yes' THEN gender
        ELSE NULL
    END) AS Depressed_YearCount
FROM
    stmh
GROUP BY 1,2
ORDER BY 2
;


#######################################################################################

-- Count of @Depressed students from out date time column
SELECT 
     Gender, `year study`,
    COUNT(CASE
        WHEN depression = 'yes' THEN `year study`
        ELSE NULL
    END) AS No_Depressed
FROM
    stmh
GROUP BY 1,2
HAVING COUNT(CASE
    WHEN depression = 'yes' THEN `year study`
    ELSE NULL
END) > 0
 ORDER BY 2 desc;