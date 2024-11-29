# Analysis of Factors Influencing Final Year Student Grades

![Screenshot 2024-11-20 211810](https://github.com/user-attachments/assets/ab042004-c478-436c-a49e-deb4bc23103f)

## Table of Content
- [Project Overview](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#project-overview)
- [Tools Used](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#tools-used)
- [Steps I took](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#steps-i-took)
  - [Data Cleaning and Preparation](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#data-cleaning-and-preparation)
  - [SQL Queries and Analysis](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#sql-queries-and-analysis)
  - [Power BI Analysis and Visualization](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#power-bi-analysis-and-visualization)
- [Key Insights](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#key-insights)
  - [Overview](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#overview)
  - [Student Analysis](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#student-analysis)
  - [Teachers Analysis](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#teachers-analysis)
  - [Student Dashboard](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#student-dashboard)
- [Recommendations](https://github.com/Blessedsarah/Analysis-of-Factors-Influencing-Final-Year-Student-Grades#recommendation)
## Project Overview
This project focuses on analyzing the factors influencing final-year student grades. The primary objective is to gain insights into student performance across various departments and courses, including calculating CGPAs, identifying top performers, and understanding enrollment patterns. The project also addresses key statistical analyses, such as the mean, median and mode of CGPAs, and aims to identify the courses with the highest failure rates. 

## Tools Used
- Excel (Power Query) -  For data cleaning and table merging.
- Microsoft SQL Server - Queries for statistical analysis, CGPA calculations and deeper insights
- Power Bi - Dashboard creation for intuitive analysis and visualization.

## Steps I took
## Data Cleaning and Preparation
During the data cleaning phase, several steps were taken to ensure data quality and consistency. Below are the key cleaning activities carried out using Power Query in Excel:

1. **Removal of Duplicate Values**: I removed duplicate entries in the Courses table to ensure that each course is represented only once. 

2. **Correction of Student IDs**: For students in the Computer Science department, the Student ID prefix was incorrect. I changed all Student IDs with the prefix "CSC" to "COM" to maintain consistency with other records

3. **Removal of Inconsistent Course Codes**: In the Enrollment table, there were entries with course codes that did not exist in the Courses table. These invalid records were removed to avoid errors in further analysis.

4. **Table Merging**: To facilitate easier querying and analysis, I merged several tables into a unified table called Records using the Enrollment table as a base. This unified table included:

  - Courses Table: Details about course codes, titles, and credit units.
  - Student Profile Table: Student demographic information.
  - Grade_Conversion Table: Mapping of grades to grade points for GPA calculation.
  - Teachers Profile Table: Information about course instructors.

## SQL Queries and Analysis
View Code [Here](https://github.com/Blessedsarah/Analysis-of-Final-Year-Student-Grades/blob/main/SQL%20Script.sql)
SQL was utilized to query the cleaned and prepared dataset to extract key insights. The following analyses were performed: 

### Basic Dataset Statistics
Calculated basic statistical measures (e.g., mean, median, mode) for CGPA and scores.
### Level/Departmental Performance & Analysis
- Total number of students per department
- Total number of lecturers per department
- Department with the highest Score
- CGPA by Department
- CGPA by Level/Semester
- CGPA by Gender
  
### Student & Lecturers Performance
- Top 10 Students with the highest CGPA
- Top Performing Students in each Department
- Ranking Lecturers by Avg Score

### Courses And Enrollment Analysis
- Total Enrollment across the year
- Total Courses per Semester
- Course has the Highest Failure Rate 

## Power BI Analysis and Visualization
After completing the SQL-based analysis, the cleaned and prepared data was imported into Power BI to create an interactive dashboard. The following steps and features were implemented in Power BI to enhance the analysis and user experience:
### Data Modeling
- I imported the tables directly from the SQL database into Power BI.
- I established relationships between the tables, ensuring accurate data connections for analysis.
- I created calculated tables, including:
  - ***Student Age***: To analyze age distributions and trends.
  - ***Lecturers Working Years***: To evaluate lecturer experience and its correlation with performance.
  - ***Grade Category***: To categorize grade class (i.e first class honours, etc)
![image](https://github.com/user-attachments/assets/81efb612-872a-4081-9245-39de13b9f972)

### DAX Measures
DAX measures were used to perform advanced calculations and improve the analytical capabilities of the dashboard. 
![image](https://github.com/user-attachments/assets/0f349c42-eb90-46eb-8fcc-8be9dc6a5797)

## Key Insights
## Overview
- **Average CGPA**: The overall average CGPA is 3.42, indicating a generally good academic performance.
- **Course Load**: The course load seems to be relatively consistent across semesters. And there is no direct correlation between course load and students performance.
- **Grade Distribution**: There are no First Class students. The majority of students fall in the Second Class Lower category, with a significant portion also in the Second Class Upper category.
- **Top 5 Courses by Score**: The top-scoring courses are predominantly from the English department. While the department with the average highest CGPA is Psychology, with English following it with a slight difference.
- **Failure Rate**: The course failure rate is relatively low, with the highest being 11% for certain courses.

![Screenshot 2024-11-20 211835](https://github.com/user-attachments/assets/ec656c85-4902-4dfe-add5-026f739cbf40)

## Student Analysis
- **Age Distribution**: The majority of students are between 24 and 25 years old, with a few outliers on either end.
- **Age and Performance**: While there is a slight upward trend in CGPA with age, it's not a significant factor in determining academic performance.  Other factors like study habits, motivation, and department choice likely play a more significant role.
- **Gender and Performance**: The dashboard shows no discernible difference in the average CGPA between male and female students. This suggests that gender does not significantly impact academic performance in this dataset.
- **Average Score by Credit Unit**: The average score per credit unit is generally consistent across different credit units.

![Screenshot 2024-11-20 211859](https://github.com/user-attachments/assets/350d82de-599a-4524-a800-ffc878047b22)

## Teachers Analysis
- **Lecturer Performance**: There's a wide range of performance among lecturers, with some consistently achieving high scores and others consistently achieving lower scores.
- **Experience and Performance**: There seems to be a slight positive correlation between experience (working years) and average score/CGPA. However, this is not a strong correlation and sole determinant of students performance.
- **Designation and Performance**: Doctors and Professors tend to have slightly higher average scores and CGPA compared to Lecturers.

![Screenshot 2024-11-20 211935](https://github.com/user-attachments/assets/2d86150d-0ca2-4c55-9f6c-4959eb34268c)

## Student Dashboard
A Student Dashboard was developed to provide a personalized, detailed view of each student's academic performance and demographics. This dashboard serves as a mini transcript, offering insights into individual student details.

![Screenshot 2024-11-20 212004](https://github.com/user-attachments/assets/7380b15f-b26c-4a2f-961d-d6991fd2eb89)

## Recommendation
Based on the above insights, the following recommendations were suggested:
- **Consider External Factors**: Instead of focusing on age or gender, other factors like study habits, motivation, economic conditions, and department choice may likely have a more significant impact on academic performance.
- **Student Support**: Implement support systems like tutoring, counseling, or additional resources for students who are underperforming in specific courses.
- **Flexible Curriculum**: Review the curriculum to ensure it is flexible and adaptable to individual student needs and learning styles.
- **Syllabus Coverage**: Ensure lecturers cover the entire syllabus to prepare students adequately for exams.
- **Exam Question Alignment**: Ensure exam questions are aligned with the taught syllabus to prevent unfair assessments.
- **Student Feedback Mechanisms**: Implement effective mechanisms for students to provide feedback on teaching, courses, and overall academic experience.
- **Lecturer Evaluation**: Implement a comprehensive lecturer evaluation system to assess teaching effectiveness, identify areas for improvement, and provide targeted training and support
- **Workload Management**: Consider adjusting the course load of inexperienced lecturers, especially those with lower performance ratings, to ensure adequate preparation and delivery of quality teaching
- **Faculty Development**: Provide ongoing professional development opportunities for faculty to enhance their teaching skills and stay updated with the latest educational trends.
- **Technology Integration**: Utilize technology tools to enhance teaching and learning experiences, such as online learning resources, interactive tools, and virtual classrooms.
- **Student Engagement Strategies**: Encourage student engagement through active learning techniques, group projects, and hands-on activities to foster critical thinking and problem-solving skills.
- **Data-Driven Decision Making**: Continuously analyze student performance data to identify trends, areas of concern, and opportunities for improvement.

By implementing these recommendations, the institution can create a more supportive and effective learning environment for all students.




