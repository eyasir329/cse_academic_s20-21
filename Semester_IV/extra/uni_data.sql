create table prereq
(course_id varchar(8),
prereq_id varchar(8),
primary key (course_id, prereq_id),
foreign key (course_id) references course(course_id),
foreign key (prereq_id) references course(course_id)
);