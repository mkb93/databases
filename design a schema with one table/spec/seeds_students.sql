DROP TABLE IF EXISTS students;
CREATE TABLE students(
    "id" serial , 
    "name" text, 
    "cohort" text,
    PRIMARY KEY ("id"));


TRUNCATE TABLE students RESTART IDENTITY; 
INSERT INTO students (name, cohort) VALUES ('Marco Belahouane', 'April 2023');