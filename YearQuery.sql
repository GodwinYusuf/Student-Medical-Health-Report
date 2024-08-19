/** Author : 			@godwin.yusuf@outlook.com
	Date:  				16-12-2023
	Title: 				Student Mental Health (Project)
    Objective:  		Analysis.
    Project Source: 	https://www.kaggle.com/datasets/shariful07/student-mental-health
**/

##################################################################################

SELECT 
    *
FROM
    stmh;

####################################################################################
  
-- The total number of Mentally ill students category for a @year  study
 SELECT DISTINCT 
    `Year Study`, 
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS SP_treatment
FROM
    STMH
    GROUP BY 1
    ORDER BY 1; 
    
#######################################################################################    
    
-- The total number of Mentally ill students category for a @year and  @gender study
 SELECT DISTINCT 
    `Year Study`, gender,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS SP_treatment
FROM
    STMH
    GROUP BY 1,2
    ORDER BY 1; 
    
#################################################################################    

-- The total number of Mentally ill @married students category for a @year study 

SELECT DISTINCT
    `Year Study`, gender,
    `marital status`,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS SP_treatment
FROM
    STMH
  WHERE `marital status` = "YES"
    GROUP BY 1, 2,3
    ORDER BY 1 ;

#################################################################################
    
 -- @marital_status is NO 
 
SELECT DISTINCT
    `Year Study`, gender,
    `marital status`,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN `Year Study`
        ELSE NULL
    END) AS SP_treatment
FROM
    STMH
  WHERE `marital status` = "NO"
    GROUP BY 1, 2,3
    ORDER BY 1 ;
 
 ##################################################################################
 
 
-- The illness to every age and gender in the dataset.
SELECT DISTINCT 
   Age, Gender ,
    COUNT(CASE
        WHEN DEPRESSION = 'YES' THEN gender
        ELSE NULL
    END) AS Depressed,
    COUNT(CASE
        WHEN anxiety = 'YES' THEN gender
        ELSE NULL
    END) AS Anxiety,
    COUNT(CASE
        WHEN Panic_attack = 'YES' THEN gender
        ELSE NULL
    END) AS Panic_Attack,
    COUNT(CASE
        WHEN Specialist_treatment = 'YES' THEN gender
        ELSE NULL
    END) AS Specialist_treatment
FROM
    STMH
    GROUP BY 1,2
    ORDER BY 1; 