SELECT * FROM StudentRecords
ORDER BY StudentID;

SELECT * FROM GradeRecords
ORDER BY StudentID;

SELECT * FROM GradeRecords
ORDER BY StudentID;

SELECT * FROM  GradeType
ORDER BY GradeID;

SELECT * FROM ScoreDetails
ORDER BY StudentID ASC;

SELECT * FROM GradeAReport
ORDER BY StudentID ASC;

SELECT * FROM HighGradeStudents
ORDER BY StudentID;


CREATE VIEW HighGradeStudents
AS
SELECT StudentRecords.StudentID, StudentRecords.FirstName, StudentRecords.LastName,
	   GradeRecords.Studentaverage,
	   GradeType.Grade
FROM StudentRecords INNER JOIN GradeRecords
ON StudentRecords.StudentID = GradeRecords.StudentID
INNER JOIN GradeType
ON GradeRecords.GradeID = GradeType.GradeID
WHERE studentaverage=0.93;

SELECT * FROM HighGradeStudents
ORDER BY StudentID;

CREATE VIEW LowGradeStudents
AS
SELECT StudentRecords.StudentID, StudentRecords.FirstName, StudentRecords.LastName,
	   GradeRecords.Studentaverage,
	   GradeType.Grade
FROM StudentRecords INNER JOIN GradeRecords
ON StudentRecords.StudentID = GradeRecords.StudentID
INNER JOIN GradeType
ON GradeRecords.GradeID = GradeType.GradeID
WHERE studentaverage=0.54;

SELECT * FROM LowGradeStudents
ORDER BY StudentID;
