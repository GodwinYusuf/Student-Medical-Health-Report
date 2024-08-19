/** Author : 			@godwin.yusuf@outlook.com
	Date:  				16-12-2023
	Title: 				Student Mental Health (Project)
    Objective:  		Analysis.
    Project Source: 	https://www.kaggle.com/datasets/shariful07/student-mental-health
**/


 
 SELECT 
    *
FROM
    stmh;
 
-- Categorizing Mentally ill students to each course
SELECT DISTINCT
    COURSE,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN COURSE
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN COURSE
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN COURSE
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN COURSE
        ELSE NULL
    END) AS SP_treatment
FROM
    STMH
    GROUP BY COURSE
    ;
    
-- Top 3 Course with the most @depressed students
SELECT DISTINCT
    COURSE,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN COURSE
        ELSE NULL
    END) AS Depressed
    FROM STMH 
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 3;
 
 
-- Top 3 Course with the most @anxiety students
SELECT DISTINCT
    COURSE,
    COUNT(CASE
        WHEN ANXIETY = 'YES' THEN COURSE
        ELSE NULL
    END) AS Anxiety
    FROM STMH 
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 3;

    
-- Top 3 Course with the most @Panic_attack students
SELECT DISTINCT
    COURSE,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN COURSE
        ELSE NULL
    END) AS Panic_attack
    FROM STMH 
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 3;
  
  
-- Top 3 Course with the most with students who need special treatment @Specialist_treatment.


SELECT DISTINCT
    COURSE,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN COURSE
        ELSE NULL
    END) AS Specialist_treatment
    FROM STMH 
    GROUP BY 1
    ORDER BY 2 DESC
    LIMIT 3;
    
-- @CGPA grading system base on illness.
  SELECT DISTINCT
    CGPA,GRADE
FROM
    STMH;
   
   
-- showing the @grade distribution on various illness.
   SELECT DISTINCT
    Grade,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN COURSE
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN COURSE
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN COURSE
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN COURSE
        ELSE NULL
    END) AS SP_treatment
FROM
    STMH
    GROUP BY 1
    ORDER BY 1
    ;
    
-- The @gender distribution of grade across the dataset.
SELECT 
    Grade, Gender, COUNT(GRADE) AS No_Students
FROM
    STMH
GROUP BY 1 , 2
ORDER BY 3 DESC;





