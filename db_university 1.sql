-- -- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
-- --
-- -- Host: localhost    Database: myuniversity
-- -- ------------------------------------------------------
-- -- Server version	8.0.22

-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
-- /*!50503 SET NAMES utf8mb4 */;
-- /*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
-- /*!40103 SET TIME_ZONE='+00:00' */;
-- /*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
-- /*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
-- /*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
-- /*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- --
-- -- Table structure for table `courses`
-- --

-- DROP TABLE IF EXISTS `courses`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `courses` (
--   `course_id` int NOT NULL AUTO_INCREMENT,
--   `course_name` varchar(40) DEFAULT NULL,
--   `course_status` varchar(10) DEFAULT NULL,
--   `teacher_id` int DEFAULT NULL,
--   PRIMARY KEY (`course_id`),
--   KEY `teacher_id` (`teacher_id`),
--   CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE SET NULL ON UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `courses`
-- --

-- LOCK TABLES `courses` WRITE;
-- /*!40000 ALTER TABLE `courses` DISABLE KEYS */;
-- INSERT INTO `courses` VALUES (1,'Linear Algebra','major',2),(2,'Physics','major',3),(3,'Discrete Mathematics','major',2),(4,'Paralel Programming','selective',4),(5,'Business Analysis','major',7),(6,'Introduction to Business','major',8),(7,'Fundamentals of Art','major',11),(8,'Education Principials','major',9),(9,'Education Management I','selective',9);
-- /*!40000 ALTER TABLE `courses` ENABLE KEYS */;
-- UNLOCK TABLES;

-- --
-- -- Table structure for table `departments`
-- --

-- DROP TABLE IF EXISTS `departments`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `departments` (
--   `department_id` int NOT NULL AUTO_INCREMENT,
--   `department_name` varchar(50) DEFAULT NULL,
--   PRIMARY KEY (`department_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `departments`
-- --

-- LOCK TABLES `departments` WRITE;
-- /*!40000 ALTER TABLE `departments` DISABLE KEYS */;
-- INSERT INTO `departments` VALUES (1,'Computer Science'),(2,'Computer Engineering'),(3,'Electronics Engineering'),(4,'Business Administration'),(5,'Education Management'),(6,'Robotics Engineering'),(7,'Art and Science');
-- /*!40000 ALTER TABLE `departments` ENABLE KEYS */;
-- UNLOCK TABLES;

-- --
-- -- Table structure for table `enrollment`
-- --

-- DROP TABLE IF EXISTS `enrollment`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `enrollment` (
--   `course_id` int DEFAULT NULL,
--   `student_id` int DEFAULT NULL,
--   `course_score` int DEFAULT NULL,
--   KEY `course_id` (`course_id`),
--   KEY `student_id` (`student_id`),
--   CONSTRAINT `enrollment_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `courses` (`course_id`) ON DELETE SET NULL ON UPDATE CASCADE,
--   CONSTRAINT `enrollment_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`) ON DELETE SET NULL ON UPDATE CASCADE
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `enrollment`
-- --

-- LOCK TABLES `enrollment` WRITE;
-- /*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
-- INSERT INTO `enrollment` VALUES (1,1,95),(1,2,83),(1,4,55),(3,1,98),(3,7,95),(2,9,67),(2,6,85),(5,4,45),(3,2,100),(3,3,67),(3,4,91),(5,2,88),(5,1,100),(6,7,85),(6,1,95),(7,2,83),(7,4,59),(8,1,78),(9,7,92);
-- /*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
-- UNLOCK TABLES;

-- --
-- -- Table structure for table `students`
-- --

-- DROP TABLE IF EXISTS `students`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `students` (
--   `student_id` int NOT NULL AUTO_INCREMENT,
--   `student_name` varchar(30) DEFAULT NULL,
--   `student_surname` varchar(30) DEFAULT NULL,
--   `entrance_year` int DEFAULT NULL,
--   PRIMARY KEY (`student_id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `students`
-- --

-- LOCK TABLES `students` WRITE;
-- /*!40000 ALTER TABLE `students` DISABLE KEYS */;
-- INSERT INTO `students` VALUES (1,'Shabnam','Askerova',2021),(2,'Ismayil','Najafli',2024),(3,'Resul','Annaghi',2024),(4,'Bayram','Ismayilov',2023),(5,'Turan','Quliyev',2025),(6,'Gul','Maharramova',2022),(7,'Fatma','Mammadova',2023),(8,'Murad','Abdulkarimov',2021),(9,'Miraziz','Seyidov',2024),(10,'Nihad','Yarishov',2022);
-- /*!40000 ALTER TABLE `students` ENABLE KEYS */;
-- UNLOCK TABLES;

-- --
-- -- Table structure for table `teachers`
-- --

-- DROP TABLE IF EXISTS `teachers`;
-- /*!40101 SET @saved_cs_client     = @@character_set_client */;
-- /*!50503 SET character_set_client = utf8mb4 */;
-- CREATE TABLE `teachers` (
--   `teacher_id` int NOT NULL AUTO_INCREMENT,
--   `teacher_name` varchar(70) DEFAULT NULL,
--   `position` varchar(30) DEFAULT NULL,
--   `department_id` int DEFAULT NULL,
--   PRIMARY KEY (`teacher_id`),
--   KEY `department_id` (`department_id`),
--   CONSTRAINT `teachers_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`) ON DELETE SET NULL ON UPDATE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
-- /*!40101 SET character_set_client = @saved_cs_client */;

-- --
-- -- Dumping data for table `teachers`
-- --

-- LOCK TABLES `teachers` WRITE;
-- /*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
-- INSERT INTO `teachers` VALUES (1,'Alikram Humbatov','professor',1),(2,'Hana Novotna','professor',1),(3,'Aliya Rustamli','associate professor',1),(4,'Sevinc Keremli','assistant professor',1),(5,'Ali Aliyev','professor',3),(6,'Murad Mammadli','teacher',3),(7,'Sevil Almammadli','assistant professor',4),(8,'Qabil Afrasiyab','assistant professor',4),(9,'Qasim Qasimli','teacher',5),(10,'Esra Kilic','associate professor',6),(11,'Gordon Brown','teacher',7);
-- /*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
-- UNLOCK TABLES;
-- /*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

-- /*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
-- /*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
-- /*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
-- /*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
-- /*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
-- /*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
-- /*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-16  7:51:43

-- task1

-- DELIMITER //

-- CREATE PROCEDURE GetStudentCoursesAndAverage(IN studentName VARCHAR(100))
-- BEGIN
--     SELECT AVG(e.course_score) AS average_score,
--     GROUP_CONCAT(CONCAT(c.course_name)) AS result
--     FROM enrollment e
--     JOIN students s ON e.student_id = s.student_id
--     JOIN courses c ON e.course_id = c.course_id
--     GROUP BY e.course_id;
-- END //

-- DELIMITER ;

-- task2
-- DELIMITER //

-- CREATE PROCEDURE GetNumberOfStudentsInCourse(IN courseName VARCHAR(100))
-- BEGIN
--     SELECT COUNT(*) AS number_of_students
--     FROM enrollment e
--     JOIN courses c ON e.course_id = c.course_id
--     WHERE c.course_name = courseName;
-- END //

-- DELIMITER ;

-- task3
-- DELIMITER //

-- CREATE PROCEDURE GetCoursesByTeacher(IN teacherName VARCHAR(100), OUT numCourses INT, OUT courseList TEXT)
-- BEGIN
--     DECLARE teacher_id INT;
--     SELECT t.teacher_id INTO teacher_id
--     FROM teachers t
--     WHERE t.teacher_name = teacherName;
--     SELECT COUNT(*) INTO numCourses
--     FROM courses c
--     WHERE c.teacher_id = teacher_id;
--     SELECT GROUP_CONCAT(c.course_name SEPARATOR ', ') INTO courseList
--     FROM courses c
--     WHERE c.teacher_id = teacher_id;
    
--     IF numCourses IS NULL THEN
--         SET numCourses = 0;
--     END IF;
--     IF courseList IS NULL THEN
--         SET courseList = '';
--     END IF;
-- END //

-- DELIMITER ;

-- task4

-- DELIMITER //

-- CREATE PROCEDURE GetTeachersByDepartment(IN departmentName VARCHAR(100),OUT numTeachers INT,OUT teacherList TEXT)
-- BEGIN
--     DECLARE department_id INT;

   
--     SELECT d.department_id INTO department_id
--     FROM departments d
--     WHERE d.department_name = departmentName;
--     SELECT COUNT(*) INTO numTeachers
--     FROM teachers t
--     WHERE t.department_id = department_id;
--     SELECT GROUP_CONCAT(t.teacher_name SEPARATOR ', ') INTO teacherList
--     FROM teachers t
--     WHERE t.department_id = department_id;
    
--     IF numTeachers IS NULL THEN
--         SET numTeachers = 0;
--     END IF;
--     IF teacherList IS NULL THEN
--         SET teacherList = '';
--     END IF;
-- END //

-- DELIMITER ;

-- task5
-- DELIMITER //

-- CREATE PROCEDURE GetTeachersByPosition(IN positionName VARCHAR(100), OUT numTeachers INT, OUT teacherList TEXT)
-- BEGIN
--     SELECT COUNT(*) INTO numTeachers
--     FROM teachers t
--     WHERE t.position = positionName;
--     SELECT GROUP_CONCAT(t.teacher_name SEPARATOR ', ') INTO teacherList
--     FROM teachers t
--     WHERE t.position = positionName;
    
--     IF numTeachers IS NULL THEN
--         SET numTeachers = 0;
--     END IF;
--     IF teacherList IS NULL THEN
--         SET teacherList = '';
--     END IF;
-- END //

-- DELIMITER ;








