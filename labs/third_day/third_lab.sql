--Add gender column for the student table[Enum].
CREATE TYPE gender_enum AS ENUM ('male', 'female');

ALTER TABLE student
ADD COLUMN gender gender_enum;

--Add birth date column for the student table
alter table student
add column birth_date timestamp;

--Delete the name column and replace it with two columns
ALTER TABLE student
drop  COLUMN name CASCADE,
ADD COLUMN first_name VARCHAR(255),
ADD COLUMN last_name VARCHAR(255);

--Delete the address and email column and replace it with contact info
alter table student
drop COLUMN email;
CREATE TYPE contact_info_type AS(
    email VARCHAR(25),
    address VARCHAR(15)
);
ALTER TABLE student
ADD COLUMN contact_info contact_info_type;

--Add/Alter foreign key constrains in Your Tables.
ALTER TABLE subject
ADD CONSTRAINT fk_subject_student
FOREIGN KEY (name)
REFERENCES student (first_name);

--Insert new data in all Tables.
INSERT INTO student (track_name, gender, birth_date, first_name, contact_info)
VALUES
  ('Cs', 'male', '2002-12-3', 'ali', ROW('ali@gemail.com', '123 cairo st'));

INSERT INTO student (track_name, gender, birth_date, first_name, contact_info)
VALUES
  ('AI', 'female', '1997-09-15', 'hana', ROW('hana@gemail.com', '123 alex st'));

INSERT INTO subject (name, description, max_score)
VALUES
  ('ail', 'Mathematics', 100);

INSERT INTO subject (name, description, max_score)
VALUES
  ('hana', 'Physics', 90);

--Display all students’ information.
select * from student;

--Display male students only
select * from student
where gender='male';

--Display the number of female students
select count(*) from student
group by gender
having gender ='female';

--Display the students who are born before 1992-10-01
select * from student
where birth_date < '1992-10-01';

--Display male students who are born before 1991-10-01
select * from student
where birth_date < '1992-10-01' and gender='male';

--Display subjects and their max score sorted by max score
select description,max_score,max(max_score) from subject
group by description,max_score
order by max_score;

--Display the subject with highest max score
select description,max_score,max(max_score) from subject
group by description,max_score
having max_score =max(max_score);

--Display students’ names that begin with A
select first_name from student
where first_name like 'a%';

--Display the number of students’ their name is “Mohammed”
select count(*),first_name from student
group by first_name
having first_name='Mohamemd';

--Display the number of males and females
select count(*) as female_and_male_count ,gender from student
group by gender
having gender='female'
union
select count(*) ,gender from student
group by gender
having gender='male';

--Display the all Students and track name that belong to it
select first_name,track_name from student;

--(Bouns) Display students’ names, their score and subjectn name
select first_name,description,max_score
from student join subject
on student.first_name=subject.name;

