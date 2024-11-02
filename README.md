# Analysis of Final Year Student Grades
## Project Overview
This project focuses on analyzing the factors influencing final-year student grades. The primary objective is to gain insights into student performance across various departments and courses, including calculating CGPAs, identifying top performers, and understanding enrollment patterns. The project also addresses key statistical analyses, such as the mean, median and mode of CGPAs, and aims to identify the courses with the highest failure rates.

## Tools Used
- Excel
- SQL Server

## Data Cleaning and Preparation
During the data cleaning phase, several steps were taken to ensure data quality and consistency. Below are the key cleaning activities carried out using Power Query in Excel:
1. **Removal of Duplicate Values**: I removed duplicate entries in the Courses table to ensure that each course is represented only once. 
2. **Correction of Student IDs**: For students in the Computer Science department, the Student ID prefix was incorrect. I changed all Student IDs with the prefix "CSC" to "COM" to maintain consistency with other records
3. **Removal of Inconsistent Course Codes**: In the Enrollment table, there were entries with course codes that did not exist in the Courses table. These invalid records were removed to avoid errors in further analysis.
4. **Table Merging**: To facilitate easier querying and analysis, I merged several tables into a unified table called Records using the Enrollment table as a base. The tables included: Courses, Student Profile, Grade_Conversion, and Teachers Profile.

# Data Analysis

## Initial Data Exploration 
This is to provide a simple overview of the dataset

![Screenshot 2024-11-02 175706](https://github.com/user-attachments/assets/d3f56a96-79db-4a5b-922d-3eb6cdca2d3b)


## Descriptive Analysis
To provide basic statistics of the dataset

![image](https://github.com/user-attachments/assets/dd527925-fd4e-4e12-b8c6-d55b63d664f8)


## Level/Departmental Performance & Analysis
- Total number of students per department
- Total number of lecturers per department
- Department with the highest Score
- CGPA by Department
- CGPA by Level/Semester
- CGPA by Gender
  
## Student & Lecturers Performance
- Top 10 Students with the highest CGPA
- Top Performing Students in each Department
- Ranking Lecturers by Avg Score

## Courses And Enrollment Analysis
- Total Enrollment across the year
- Total Courses per Semester
- Course has the Highest Failure Rate 
- 
