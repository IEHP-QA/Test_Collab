/******************** 
08/27/2018 : This  is a Sample to demonstrate  GIt usage
08/28/2018: Publishing changes to MASTER branch in GIT 
*************************/

USe [LimeSurvey]
-- #1 . Retrieve Saved LimeSurvwy 

Select TOP 100 * 
  FROM [LimeSurvey].[dbo].[lime_saved_control]



-- #2 .GEt list of all Surveys


/* --------------------------------------------
--- Current VBuid of lime Survety iD: 541634
   *. Table name changes whenever new build is published
-----------------------------------------------------*/
SELECT * FROM 
[limesurvey].[dbo].[lime_survey_955733]



-- GEt Tokens to login :

SELECT  * FROM 
[LimeSurvey].[dbo].[lime_tokens_955733]

-- GET list of Url parameters to be passed in LimeSurvey
SELECT Distinct parameter 
  FROM [LimeSurvey].[dbo].[lime_survey_url_parameters]


/* ---------------------------------------------------------
Post Scoring Details  -TFS # 49781 -Itn 26
Question -4 :  {Cancer; Heart Problems ;Infectious Disease ;Kidney Disease ; Liver Disease ; Organ Transplant ;Sickle Cell Anemia }
Question -7 A: { Hospital Bed/Hoyer lift ;Tube Feeding Supplies ; Ostomy Supplies ;  Ventilator ;  Oxygen }
--> Sghould overide scoring to : 190.5
------------------------------------------------------------*/

-- a) verify from Lime survey total

-- test data : 112 : score 7
Select * FROm 
[limesurvey].[dbo].[lime_survey_955733]
Where   --id = ( select MAX( ID) FROM [limesurvey].[dbo].[lime_survey_541634]    ) 
 


-- b) verfiy from HRA d/b : (Health Risk assessment )
USE [HealthRiskAssessment] 
GO 








/***** --------
Rough 
******/
USe [LimeSurvey]
GO

DECLARE @SurveyId INT = 279892;
SELECT CAST(sid AS VARCHAR(25))+'X'+CAST(gid AS VARCHAR(25))+'X'+CAST(qid AS VARCHAR(25)), 
title,question,  mandatory, other, type, gid, qid,  question_order,  lq.*
FROM lime_questions lq WHERE sid = @SurveyId ORDER BY  lq.gid, lq.qid 



Select * FROm [limesurvey].[dbo].[lime_survey_541634]
Where--id =( select MAX( ID) FROm [limesurvey].[dbo].[lime_survey_541634]) and
 ID in (
1
,6
,10
,13
,20)  ; 