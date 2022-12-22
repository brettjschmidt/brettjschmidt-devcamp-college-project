USE brett_devcamp_college_project;

SELECT *
FROM professors;

SELECT *
FROM courses;

SELECT *
FROM students;

SELECT *
FROM grades;

-- Average grade from professors 
SELECT grades_professors_id, AVG(grades_students_class)
FROM grades
GROUP BY grades_professors_id 
ORDER BY grades_professors_id;

-- Top grade for student
SELECT grades_students_id, MAX(grades_students_class)
FROM grades
GROUP BY grades_students_id
ORDER BY grades_students_id, MAX(grades_students_class);

-- Common course for students and professors
SELECT students_professors_id, count(*)
FROM students
GROUP BY students_professors_id;

-- Group students by course
SELECT 
	s.students_name,
	s.students_professors_id,
	c.course_name
FROM students s
JOIN courses c
ON s.students_course_id = c.courses_id;


SELECT 
	p.professors_id AS 'Professors ID',
	p.professors_name AS 'Professors Name',
	c.course_name AS 'Major',
	s.students_name AS 'Name of Student',
	AVG(grades_students_class) AS 'Students Grades'
FROM professors p
JOIN courses c
ON c.course_professors_id = p.professors_id
JOIN students s
ON s.students_professors_id = p.professors_id
JOIN grades g
ON g.grades_professors_id = p.professors_id
GROUP BY students_id
ORDER BY 5 ASC;	