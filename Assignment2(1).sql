--For every program, return the program name, campus name, tuition fee and the average 
--tuition fee for the programs that are taught in in the same campus as this program. For 
--example if computer science program is taught in Davis campus then I want you to return the 
--program name, campus name, tuition fee of the program and the average tuition fee for all the 
--programs that are taught in Davis campus. A program can have multiple records (rows) if it is 
--taught in multiple campuses
SELECT
    P.P_Name AS Program_Name,
    C.C_Name AS Campus_Name,
    P.P_Tuition_Fee AS Tuition_Fee,
    AVG(P.P_Tuition_Fee) OVER(PARTITION BY C.CrmpID) AS Average_Tuition_Fee
FROM
    Program P
JOIN
    CampusProgram CP ON P.ProgID = CP.ProgID
JOIN
    Campus C ON CP.CrmpID = C.CrmpID;
    
    
--     Return the name of the student(s) who have the 4rth lowest GPA value

SELECT *
FROM (
    SELECT S_Name,S_GPA,
        DENSE_RANK() OVER (ORDER BY S_GPA ) AS GPA_Rank
    FROM Student
) RankedStudents
WHERE GPA_Rank = 4;
--For every student, return the difference between the GPA of the student and the average GPA 
--of the 30 students who were admitted right before the admission date of the student.

SELECT
    S_Name,
    S_GPA,
    S_ADMISSION_DATE,
    AVG(S_GPA) OVER (
        ORDER BY S_Admission_Date 
        ROWS BETWEEN 30 PRECEDING AND 1 PRECEDING
    ) AS Avg_GPA_30,
    S_GPA - AVG(S_GPA) OVER (
        ORDER BY S_Admission_Date 
        ROWS BETWEEN 30 PRECEDING AND 1 PRECEDING
    ) AS GPA_Difference
FROM
    Student;
--Return the name of three teachers who teach the lowest number of courses (you need to 
--return only 3 teachers
SELECT TeacherName, NumCourses
FROM (
    SELECT 
        T_Name AS TeacherName,
        (SELECT COUNT(*) FROM Course WHERE Course_Teacher = Teacher.TID) AS NumCourses,
        ROW_NUMBER() OVER (ORDER BY (SELECT COUNT(*) FROM Course WHERE Course_Teacher = Teacher.TID)) AS CourseRank
    FROM 
        Teacher
)
WHERE 
    CourseRank <= 3;