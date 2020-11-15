# c:\xampp\mysql\bin\mysql -uedunova -pedunova < D:\Edunova\JP\04_exercise\Moodle\moodle_users.sql
drop database if exists moodle_users;
create database moodle_users;

use moodle_users;

create table user (
    id bigint(10) primary key not null auto_increment,
    name varchar(50)
);