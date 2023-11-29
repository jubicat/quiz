-- DB : myuniversity ---------------------------------------------------------------------------------------
-- TASKS: PROCEDURES ---------------------------------------------------------------------------------------
-- 1. Try to list all cources of student into one line and also average score by given student (use IN arg).
-- 2. Try to give count of students by given cource name (use IN argument).
-- 3. Try to give count of cources and also list of all cources by given teacher name (use IN argument)
-- 4. Try to list names of teachers and also count of teachers by given department (use IN argument)
-- 5. Try to list names of teachers and also count of teachers by given faculty position (use IN, OUT arguments)

-- PROCEDURE 1 ---------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE student_score_new(
    IN student_name VARCHAR(30)
)
BEGIN
    SELECT students.student_name, students.student_surname, 
    AVG(enrollment.course_score),
    GROUP_CONCAT(courses.course_name)
    FROM students, enrollment, courses
    WHERE student_name = students.student_name
    AND
    students.student_id = enrollment.student_id
    AND
    courses.course_id = enrollment.course_id
    GROUP BY students.student_id;
END//
DELIMITER ;

CALL student_score_new('Ismayil');
CALL student_score_new('Resul');
CALL student_score_new('Fatma');


-- PROCEDURE 2 ---------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE student_count(
    IN course_name VARCHAR(40)
)
BEGIN
    SELECT courses.course_name, count(*)
    FROM students, enrollment, courses
    WHERE course_name = courses.course_name
    AND
    students.student_id = enrollment.student_id
    AND
    courses.course_id = enrollment.course_id
    GROUP BY courses.course_id;
END//
DELIMITER ;

CALL student_count('Linear Algebra');
CALL student_count('Physics');


-- PROCEDURE 3 ---------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE teacher_subjects(
    IN teacher VARCHAR(70)
)
BEGIN
    SELECT teachers.teacher_name,
    GROUP_CONCAT(courses.course_name)
    FROM teachers
    INNER JOIN courses
    ON teachers.teacher_id = courses.teacher_id
    WHERE teacher = teachers.teacher_name
    GROUP BY teachers.teacher_id;
END//
DELIMITER ;

CALL teacher_subjects('Gordon Brown');


-- PROCEDURE 4 ---------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE department_staff(
    IN department VARCHAR(50)
)
BEGIN
    SELECT departments.department_name,
    GROUP_CONCAT(teachers.teacher_name)
    FROM departments
    INNER JOIN teachers
    ON departments.department_id = teachers.department_id
    WHERE department = departments.department_name
    GROUP BY departments.department_id;
END//
DELIMITER ;

CALL department_staff('Computer Science');

-- PROCEDURE 5 ---------------------------------------------------------------------------------------------
DELIMITER //
CREATE PROCEDURE GetTeachersByPosition (
    IN teacherPosition VARCHAR(30),
    OUT numTeachers INT,
    OUT teacherNames VARCHAR(255)
)
BEGIN
    SELECT COUNT(*) INTO numTeachers
    FROM teachers
    WHERE position = teacherPosition;

    SELECT GROUP_CONCAT(teacher_name) INTO teacherNames
    FROM teachers
    WHERE position = teacherPosition;
END //

DELIMITER ;
CALL GetTeachersByPosition('professor', @numTeachers, @teacherNames);
SELECT @numTeachers, @teacherNames;