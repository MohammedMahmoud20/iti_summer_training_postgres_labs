create table student(
    email varchar(20) primary key,
    name char(10) unique,
    address varchar(15),
    track_name varchar(10)
);

create table track(
    name varchar(10) primary key
);

create table subject(
    name char(10) primary key,
    description varchar(15),
    max_score int
);

create table phone_number(
    phone_number varchar(10),
    student_name char(10) unique,
    foreign key (student_name)  references student(name)
);

CREATE TABLE subject_track (
    subject_name CHAR(10),
    track_name VARCHAR(10),
    PRIMARY KEY (subject_name, track_name),
    CONSTRAINT subject_track_foreign_key_subject
        FOREIGN KEY (subject_name) REFERENCES subject(name),
    CONSTRAINT subject_track_foreign_key_track
        FOREIGN KEY (track_name) REFERENCES track(name)
);

CREATE TABLE student_subject (
    subject_name CHAR(10),
    student_name CHAR(10),
    exam_date TIMESTAMPTZ,
    score INT,
    PRIMARY KEY (subject_name, student_name),
    CONSTRAINT subject_track_foreign_keys
        FOREIGN KEY (subject_name) REFERENCES subject(name),
    CONSTRAINT student_subject_student_name_fkey
        FOREIGN KEY (student_name) REFERENCES student(name)
);