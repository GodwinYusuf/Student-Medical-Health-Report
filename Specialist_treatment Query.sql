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

######################################################################################

-- @Total Number of Specialist_Treatment Students

SELECT 
    GENDER,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
GROUP BY 1;


######################################################################################

-- @Total Number of none Specialist_Treatment Students
SELECT 
    GENDER,
    COUNT(CASE
        WHEN Specialist_Treatment = 'NO' THEN GENDER
        ELSE NULL
    END) AS none_Specialist_students
FROM
    STMH
GROUP BY 1;

######################################################################################

-- @Specialist_Treatment and Married Students
SELECT 
    GENDER, `Marital status` as Marital_status,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
WHERE
    `MARITAL STATUS` = "YES"
GROUP BY 1,2 ;

######################################################################################

-- @Specialist_Treatment and not married.
SELECT 
    GENDER, `MARITAL STATUS`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN GENDER
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    STMH
WHERE
    `MARITAL STATUS` = "NO"
GROUP BY 1,2 ;

####################################################################################

-- @Age Distribution table of @Specialist_Treatment students
SELECT 
    Gender,
    Age,
    COUNT(CASE
        WHEN Specialist_Treatment = 'YES' THEN gender
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
        WHEN Specialist_Treatment= 'YES' THEN gender
        ELSE NULL
    END) > 0
ORDER BY 2;

######################################################################################

-- @Age Distribution of student @Specialist_Treatment that are married.
SELECT 
    Gender,`Marital status`,
    Age,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS no_of_specialist_students
FROM
    stmh
WHERE `MARITAL STATUS` = "YES"
GROUP BY 1 , 2, 3
Having COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END)  >0
ORDER BY 3;

####################################################################################

-- @Course taken by students that are married.
SELECT 
    Course,
    Gender,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS Specialist_Treatment
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
    WHEN Specialist_Treatment = 'yes' THEN gender
    ELSE NULL
END) > 0
ORDER BY 1;

#######################################################################################

-- @Specialist_Treatment students by @year study.
SELECT 
    `year Study`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN gender
        ELSE NULL
    END) AS no_of_Specialist
FROM
    stmh
GROUP BY 1
;

#####################################################################################

-- Count of @Specialist_Treatment students from out date time column
SELECT 
    `date`, Gender, `year study`,
    COUNT(CASE
        WHEN Specialist_Treatment = 'yes' THEN `date`
        ELSE NULL
    END) AS No_Specialist_Treatment
FROM
    stmh
GROUP BY 1,2,3
HAVING COUNT(CASE
    WHEN Specialist_Treatment = 'yes' THEN `date`
    ELSE NULL
END) > 0
 ORDER BY 4 desc;

