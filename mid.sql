# student table
CREATE TABLE student (
    name VARCHAR(50),
    student_number INT PRIMARY KEY,
    class INT,
    major VARCHAR(20)
);

# course table
CREATE TABLE course (
    course_name VARCHAR(100),
    course_number VARCHAR(10),
    credit_hours INT,
    department VARCHAR(100),
    UNIQUE(course_number)
);

# section table
CREATE TABLE section(
    section_id INT PRIMARY KEY,
    course_number VARCHAR(10),
    semester VARCHAR(100),
    year INT,
    instructor VARCHAR(20),
    FOREIGN KEY (course_number)
        REFERENCES course (course_number)
);

# grade_report
CREATE TABLE grade_report (
    student_number INT,
    section_id INT,
    grade varchar(2),
    FOREIGN KEY (student_number) REFERENCES student(student_number),
    FOREIGN KEY (section_id) REFERENCES section(section_id)
);


# prerequisite table
CREATE TABLE prerequisite (
	course_number VARCHAR(10),
    prerequisite_number VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (course_number) REFERENCES course(course_number),
    FOREIGN KEY (prerequisite_number) REFERENCES course(course_number)
);
INSERT INTO student 
(name,student_number,class,major)
values ('Smith', '17',  '1','CS'),
 ('Brown', '8',  '2','CS');

INSERT INTO course 
(course_name,course_number,credit_hours,department)
values ('INTRO-CS', 'CS1310',  '4','CS'),
 ('Data str', 'CS3320',  '4','CS'),
 ('Discrete-M', 'MATH2410',  '3','MATH'),
 ('Database', 'CS3380',  '3','CS');

INSERT INTO section
(section_id,course_number,semester,year,instructor)
values ('87', 'MATH2410',  'FALL','07','King'),
('93', 'CS1310',  'FALL','07','Anderson'),
('103', 'CS3320',  'Spring','08','Knuth'),
('114', 'MATH2410',  'FALL','08','chang'),
('118', 'CS1310',  'FALL','08','Anderson'),
('137', 'CS3380',  'FALL','08','Stone');

INSERT INTO grade_report
(student_number,section_id,grade)
values ('17','112','B'),
('17','119','C'),
('8','85','A'),
('8','92','A'),
('8','102','B'),
('8','135','A');

INSERT INTO prerequisite
(course_number,prerequisite_number)
values ('CS3380','CS3320'),
('CS3380','MATH2410'),
('CS3320','CS1310');



