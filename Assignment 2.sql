--SELECT 
--    p.P_Name AS ProgramName,
--    c.C_Name AS CampusName,
--    p.P_Tuition_Fee AS TuitionFee,
--    AVG(p2.P_Tuition_Fee) OVER (PARTITION BY cp.CrmpID) AS AverageTuitionFee
--FROM 
--    Program p, CampusProgram cp, Campus c, Program p2
--WHERE 
--    p.ProgID = cp.ProgID
--    AND cp.CrmpID = c.CrmpID
--    AND p2.ProgID = cp.ProgID
--ORDER BY 
--    ProgramName, CampusName;
--

--SELECT S_Name
--FROM (
--    SELECT S_Name, 
--        DENSE_RANK() OVER (ORDER BY S_GPA DESC) AS GPA_Rank
--    FROM Student
--) RankedStudents
--WHERE GPA_Rank = 4;

--SELECT 
--    S_Name AS StudentName,
--    S_GPA AS StudentGPA,
--    AVG(S_GPA) OVER (
--        ORDER BY S_Admission_Date 
--        RANGE BETWEEN INTERVAL '30' DAY PRECEDING AND INTERVAL '1' DAY PRECEDING
--    ) AS AvgPrev30GPA,
--    ROUND(S_GPA - AVG(S_GPA) OVER (
--        ORDER BY S_Admission_Date 
--        RANGE BETWEEN INTERVAL '30' DAY PRECEDING AND INTERVAL '1' DAY PRECEDING
--    ), 2) AS GPA_Difference
--FROM 
--    Student
--ORDER BY 
--    S_Admission_Date DESC, S_Name;




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