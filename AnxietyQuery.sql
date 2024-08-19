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

#################################################################################

/** Gender distribution of depressed people, we found out that all married people are depressed
with women FOUR TIMES as more as men **/

-- @Total Number of Anxiety Students

SELECT 
    GENDER,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN GENDER
        ELSE NULL
    END) AS anxiety
FROM
    STMH
GROUP BY 1;

-- @Total Number of none Anxiety Students
SELECT 
    GENDER,
    COUNT(CASE
        WHEN anxiety = 'NO' THEN GENDER
        ELSE NULL
    END) AS anxiety
FROM
    STMH
GROUP BY 1;


#############################################################################

-- @Anxiety and Married Students
SELECT 
    GENDER, `Marital status` as Marital_status,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN GENDER
        ELSE NULL
    END) AS anxiety
FROM
    STMH
WHERE
    `MARITAL STATUS` = "YES"
GROUP BY 1,2 ;

##############################################################################
-- @Anxiety and not married.
SELECT 
    GENDER, `MARITAL STATUS`,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN GENDER
        ELSE NULL
    END) AS NO_anxiety
FROM
    STMH
WHERE
    `MARITAL STATUS` = "NO"
GROUP BY 1,2 ;

#############################################################################
-- @Age Distribution table of @anxiety students
SELECT 
    Gender,
    Age,
    COUNT(CASE
        WHEN Anxiety = 'YES' THEN gender
        ELSE NULL
    END) AS Anxiety
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
        WHEN Anxiety = 'YES' THEN gender
        ELSE NULL
    END) > 0
ORDER BY 2;

#############################################################################

-- @Age Distribution of student @anxiety that are married.
SELECT 
    Gender,`Marital status`,
    Age,
    COUNT(CASE
        WHEN Anxiety = 'yes' THEN gender
        ELSE NULL
    END) AS No_Anxiety
FROM
    stmh
WHERE `MARITAL STATUS` = "YES"
GROUP BY 1 , 2, 3
Having COUNT(CASE
        WHEN Anxiety = 'yes' THEN gender
        ELSE NULL
    END)  >0
ORDER BY 3;


###############################################################################

-- @Course taken by students that are married.
SELECT 
    Course,
    Gender,
    COUNT(CASE
        WHEN anxiety = 'yes' THEN gender
        ELSE NULL
    END) AS no_Anxiety
FROM
    stmh
GROUP BY 1 , 2
HAVING COUNT(CASE
    WHEN anxiety = 'yes' THEN gender
    ELSE NULL
END) > 0
ORDER BY 1;


##################################################################################

-- @Anxiety students by @year study.
SELECT 
    `year Study`,
    COUNT(CASE
        WHEN anxiety = 'yes' THEN gender
        ELSE NULL
    END) AS Anxiety_YearCount
FROM
    stmh
GROUP BY 1
;

-- @Anxiety student @gender distribution by @year study
SELECT 
    Gender,`year Study`,
    COUNT(CASE
        WHEN anxiety = 'yes' THEN gender
        ELSE NULL
    END) AS Anxiety_YearCount
FROM
    stmh
GROUP BY 1,2
ORDER BY 2
;

#################################################################################

/** Count of @Anxiety students from  date column, group by gender through out
all school year **/
SELECT 
    `date`, Gender, `year study`,
    COUNT(CASE
        WHEN anxiety = 'yes' THEN `date`
        ELSE NULL
    END) AS No_anxiety
FROM
    stmh
GROUP BY 1,2,3
HAVING COUNT(CASE
    WHEN anxiety = 'yes' THEN `date`
    ELSE NULL
END) > 0
 ORDER BY 4 desc;