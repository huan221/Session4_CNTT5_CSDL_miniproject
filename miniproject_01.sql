create database onlineLearningSytem; 
use onlineLearningSytem ; 


create table if not exists Student(
	student_id int primary key  auto_increment , 
    student_name varchar(255) not null , 
    date_of_birth datetime , 
    student_email varchar(255) not null  unique 
);

create table if not exists Teacher(
	teacher_id int primary key auto_increment , 
    teacher_name varchar(255) not null , 
    teacher_email varchar(255) not null unique 
); 

create table if not exists Course(
	course_id int primary key  auto_increment, 
    course_name varchar(255) not null  , 
    course_describe varchar(255) not null , 
    class_count int CHECK (class_count > 0) , 
	teacher_id int,
    foreign key (teacher_id) references Teacher(teacher_id) 
); 

create table if not exists Enrollment(
	enrollment_id int primary key auto_increment,
	student_id int not null , 
    course_id int not null, 
    signUp_date datetime , 
    foreign key (student_id) references Student(student_id), 
    foreign key (course_id) references Course(course_id),
    UNIQUE (student_id, course_id)
);

create table Score(
	student_id int not null , 
    course_id int not null, 
    midterm_score decimal(2,1) not null check( 0<= midterm_score and midterm_score <=10), 
    final_score  decimal(2,1) not null check( 0<= final_score and final_score <=10),
	foreign key (student_id) references Student(student_id), 
    foreign key (course_id) references Course(course_id),
    PRIMARY KEY (student_id, course_id)
); 

insert into Student 
values(null,'Nguyen Van A','2026-04-16 11:30:00','nguyenvana@gmail.com'),
	(null,'Le Thi B','2026-05-20 19:30:00','lethib@gmail.com'),
	(null,'Phung Anh C','2026-06-03 01:30:00','phunganha@gmail.com'),
	(null,'Phan Huy D','2026-07-15 05:30:00','phunghuyd@gmail.com'),
	(null,'Bung Ba Beo','2026-08-7 11:30:00','bungbabeo@gmail.com');

insert into Teacher (teacher_name, teacher_email)
values
    ('Tran Van Minh', 'minhtv@gmail.com'),
    ('Le Thi Hoa', 'hoalt@gmail.com'),
    ('Nguyen Quoc Anh', 'anhnq@gmail.com'),
    ('Pham Thu Ha', 'hapt@gmail.com'),
    ('Hoang Duc Long', 'longhd@gmail.com');
    
insert into Course (course_name, course_describe, class_count, teacher_id)
values
    ('Lap trinh C co ban', 'Khoa hoc nhap mon C', 30, 1),
    ('SQL co ban', 'Co ban ve truy van SQL', 25, 2),
    ('Java core', 'Lap trinh Java tu co ban den nang cao', 40, 3),
    ('Web frontend', 'HTML, CSS, JavaScript co ban', 35, 4),
    ('Python data', 'Python cho phan tich du lieu', 20, 5);
    
insert into Enrollment (enrollment_id, student_id, course_id, signUp_date)
values
(NULL, 1, 1, '2024-01-01'),
(NULL, 1, 2, '2024-01-02'),
(NULL, 2, 1, '2024-01-03'),
(NULL, 3, 3, '2024-01-04'),
(NULL, 4, 4, '2024-01-05');

update Student
set student_email = 'aaa@gmail.com'
where student_id = 1 ;

update  Course
set course_describe='đây là khóa học tốt nhất thế giới hãy tin ở chúng tôi '
where course_id = 2 ; 

update  Score
set final_score = 9.2
where student_id = 1 ;

delete from Enrollment where enrollment_id=2 ; 
delete from Score where student_id = 1; 

select * from Student ; 
select * from Teacher; 
select * from Course; 
select * from Enrollment; 
select * from Score; 
 



