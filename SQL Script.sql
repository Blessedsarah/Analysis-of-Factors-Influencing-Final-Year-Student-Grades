/*
Created by Blessedsarah Omolola
Created on October 14, 2024
Latest Version @October 30, 2024
*/

-- I created a new database 
CREATE DATABASE DataKliq_Project
USE DataKliq_Project

-- INITIAL DATA EXPLORATION
-- Total Number of Students
SELECT COUNT(StudentID) AS Total_Students
FROM [Student Profile]

-- Total Number of Lecturers
SELECT COUNT (LecturerID) AS Total_Lecturer
FROM Teachers_Profile

-- Total Number of Courses
SELECT COUNT (Course_Code) AS Total_Courses
FROM Courses

-- CALCULATING THE CGPA
-- Adding 'Grade_Point' Column (used to calculate CGPA)
ALTER TABLE Records
ADD Grade_Point INT

-- Calculating the values for 'Grade_Point' Column
UPDATE Records
SET Grade_Point = CASE
		WHEN Score BETWEEN 70 AND 100 THEN 5
		WHEN Score BETWEEN 60 AND 69 THEN 4
		WHEN Score BETWEEN 50 AND 59 THEN 3
		WHEN Score BETWEEN 45 AND 49 THEN 2
		WHEN Score BETWEEN 40 AND 44 THEN 1
	ELSE 0
	END

-- Adding 'CGPA' Column
ALTER TABLE Records
ADD CGPA DECIMAL (3, 2)

-- Calculating CGPA per student
UPDATE Records
SET CGPA = 
	(SELECT CAST(SUM(Grade_Point * Credit_Unit) AS DECIMAL (5,2))
	/SUM(Credit_Unit)
	FROM Records R2   -- Alias R2 refers to the Records table within the subquery
	WHERE R2.Student_ID = Records.Student_ID)

-- DESCRIPTIVE STATISTICS
-- Mean of the CGPA
SELECT CAST (AVG(CGPA)AS DECIMAL (5,2)) 
AS Mean_CGPA
FROM Records

-- Mode of the CGPA
SELECT TOP 1 CGPA, COUNT (CGPA) AS Occurrences
FROM Records
GROUP BY CGPA
ORDER BY Occurrences DESC

-- Median of the CGPA
SELECT TOP 1 PERCENTILE_CONT (0.5)
	WITHIN GROUP (ORDER BY CGPA)
	OVER () AS Median_CGPA
FROM Records

-- LEVEL/DEPARTMENTAL PERFORMANCE & ANALYSIS
-- Total Students by Department
SELECT Department, COUNT(StudentID) AS Total_Students
FROM [Student Profile]
GROUP BY Department

-- Total Lecturers by Department
SELECT Department, COUNT(LecturerID) AS Total_Lecturers
FROM Teachers_Profile
GROUP BY Department

-- Which Department has the highest Score?
SELECT TOP 1 Department, AVG(Score) AS Avg_Score
FROM Records
GROUP BY Department
ORDER BY Avg_Score DESC

-- CGPA by Department
SELECT Department, CAST(AVG(CGPA) AS DECIMAL (5,2)) AS Avg_CGPA
FROM Records
GROUP BY Department
ORDER BY Avg_CGPA DESC

-- CGPA by Level/Semester
SELECT Level_Semester, AVG(CGPA) AS Avg_CGPA
FROM Records
GROUP BY Level_Semester
ORDER BY Level_Semester

-- CGPA by Gender
SELECT Gender, AVG(CGPA) AS Avg_CGPA
FROM Records
GROUP BY Gender
ORDER BY Avg_CGPA DESC

-- STUDENTS & LECTURERS PERFORMANCE
-- Top 10 Students with the highest CGPA
SELECT TOP 10 Student_ID, CAST(AVG(CGPA) AS DECIMAL (5,2)) AS Avg_CGPA
FROM Records
GROUP BY Student_ID
ORDER BY Avg_CGPA DESC

--Top Performing Students in each Department
WITH RankedStudent as (
	SELECT  Department,
			Student_ID,
			CGPA,
			ROW_NUMBER () OVER (PARTITION BY Department ORDER BY CGPA DESC)
			AS Rank
	FROM Records)
	SELECT Department,
			Student_ID,
			CGPA
	FROM RankedStudent
	WHERE Rank = 1;

--Ranking Lecturers by Avg Score
SELECT TOP 5 Lecturer_ID, AVG(Score) AS Avg_Score
FROM Records
GROUP BY Lecturer_ID
ORDER BY Avg_Score DESC

-- COURSES AND ENROLLMENT ANALYSIS
--Total Enrollment across the years
SELECT COUNT(Course_Code) AS Total_Enrollment
FROM Enrollment

--Total Enrollment per Students
SELECT Student_ID,
		COUNT(Course_Code) AS Total_Enrollment
FROM Enrollment
GROUP BY Student_ID

-- Total Number of Courses per Semester
SELECT Level_Semester, 
COUNT(DISTINCT Course_code) AS Total_Courses
FROM Enrollment
GROUP BY Level_Semester
ORDER BY Level_Semester

-- Course with the Highest Failure Rate
WITH FailureRates AS(
	SELECT Course_Code,
			COUNT(CASE WHEN Score < 45 THEN 1 END)
			AS Failure_rate
	FROM Records
	GROUP BY Course_Code)
SELECT TOP 1 Course_Code, Failure_rate
FROM FailureRates
ORDER BY Failure_rate DESC







