# create DB
create database online_courses;
drop database online_courses;

# DDL
# 1- create tables:

# users
create table users(
    id int primary key ,
    f_name varchar(8) not null ,
    l_name varchar(8) not null ,
    username varchar(8) not null unique ,
    email varchar(20) not null unique,
    gender varchar(6)   not null check ( gender = 'male' or gender = 'female' ),
    birthdate date ,
    phone_number int(10) unique,
    created_at datetime default current_time,
    earn_id int unique
);
drop table users;

# projects
create table projects(
    id int primary key ,
    name varchar(8) not null ,
    file_size int not null ,
    number_of_downloads int ,
    created_at datetime,
    tag_id int ,
    user_id int
);

# earns
create table earns(
    id int primary key ,
    total_amount double,
    suspend_earn double,
    earned_profit double,
    last_transfer double,
    created_at datetime
);
drop table earns;

# tags
create table tags(
    id int primary key ,
    name varchar(15) not null unique
);

# courses
create table courses(
    id int primary key ,
    name varchar(30) not null ,
    description varchar(120),
    hours int not null ,
    purchase_type varchar(4) not null check ( purchase_type='free' or purchase_type = 'paid' ),
    price int default 0,
    created_at datetime,
    user_id int,
    tag_id int
);

# certificates
create table certificate(
    id int primary key ,
    name varchar(20) not null ,
    created_at datetime,
    course_id int,
    user_id int
);

# 2- alter
alter table users modify earn_id int;
alter table courses modify created_at datetime default current_time;
alter table certificate modify name varchar(30) not null;
# add foreign key constraints
alter table users add foreign key (earn_id) references earns(id);
alter table projects add foreign key (tag_id) references tags(id);
alter table projects add foreign key (user_id) references users(id);
alter table courses add foreign key (tag_id) references tags(id);
alter table courses add foreign key (user_id) references users(id);
alter table certificate add foreign key (course_id) references courses(id);
alter table certificate add foreign key (user_id) references users(id);
alter table projects modify created_at datetime default current_time;
alter table projects modify name varchar(20) not null ;

# DML
# 1- tags
insert into tags values (1,'Programming');
insert into tags values (2,'Design');
insert into tags values (3,'Security');
# 2- earns
insert into earns
values (1,0,0,0,0,current_time);
insert into earns
values (2,1546,124,348,500,current_time);
insert into earns
values (3,15000,0,0,1500,current_time);
# 3- users
insert into users
values (1,'ali','alshehri','ali_2025','Ali@gmail.com','male','1422/02/02',0546129968,current_time,1);
insert into users
values (2,'mohammed','alshehri','m_2025','moh@gmail.com','male','1422/02/02',0566129968,current_time,3);
insert into users
values (3,'abdullah','alshehri','a_2025','abo@gmail.com','male','1422/02/02',0555129968,current_time,2);
# 4- courses
insert into courses (id, name, description, hours, purchase_type, user_id, tag_id)
values (1,'Java Spring Boot','Back-end learning on pure java and spring framework with practical exercises',300,'free',2,1);
insert into courses (id, name, description, hours, purchase_type, user_id, tag_id)
values (2,'Ethical hacker','you will learn about penetration testing, gathering information and vulnerability scanning etc...',120,'free',1,3);
insert into courses (id, name, description, hours, purchase_type, user_id, tag_id)
values (3,'3D design','models, modifier and shaping objects',80,'paid',3,2);
# 5- certificate
insert into certificate
values (1,'BootCamp Certificate',current_time,1,2);
insert into certificate
values (2,'Ethical hacker expert',current_time,2,1);
insert into certificate
values (3,'3D professional Designer',current_time,3,3);
# 6- projects
insert into projects (id, name, file_size, number_of_downloads, tag_id, user_id)
values (1,'tic tac toe',50,154,1,1);
insert into projects (id, name, file_size, number_of_downloads, tag_id, user_id)
values (2,'penitration',20,10,3,2);
insert into projects (id, name, file_size, number_of_downloads, tag_id, user_id)
values (3,'cup on table',150,34,2,3);
#delete from certificate where id = 1;

# DQL
select * from users;
select * from earns;
select * from tags;
select * from certificate;
select * from projects;