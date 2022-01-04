--SQL_DDL
--1 cоздать таблицу  employees.
--id. serial,  primary key,
--employee_name. Varchar(50), not null

create table employees(
  id         serial 
  constraint employees_pkey
  primary key,
  employee_name varchar(50) not null
);
select * from employees;
 --2 Наполнить таблицу employee 70 строками
insert into employees (employee_name)
values ( 'David Beckham'),
        (  'Michael Owen'),
         ( 'Sol Campbell'),
         ('Paul Scholes'),
         ('David Seaman'),
          ('Alan Shearer'),
         ('Frank Lampard'),
          ('Ashley Cole'),
          ('Steven Gerrard'),
            ('Phil Neville'),
         ('Harry Kane'),
      ('Raheem Sterling'),
         ('John Stones'),
          ('Eric Dier'),
     ('Jordan Henderson'),
      ('Jordan Pickford'),
     ('Marcus Rashford'),
        ('Dele Alli'),
       ('Harry Maguire'),
        ('Joe Hart'),
        ( 'Joes Hart'),
        (  'Glen Johnson'),
         ( 'Ashley Cole'),
         ('Phil Jones'),
         ('Phil Jagielka'),
          ('Joleon Lescott'),
         ('Scott Parker'),
          ('Darren Bent'),
          ('Franki Lampard'),
            ('James Milner'),
         ('Stewart Downing'),
      ('Jack Rodwell'),
         ('Gareth Barry'),
          ('Danny Welbeck'),
     ('Adam Johnson'),
      ('Kyle Walker'),
     ('Iker Casillas'),
        ('Alvaro Arbeloa'),
       ('Gerard Piqu?'),
        ('Jordi Alba'),
         ( 'Sergio Busquets'),
        ( 'Xabi Alonso'),
         ('David Villa'),
         ('Juan MataCesc'),
         ('Pepe Reina'),
          ('Fernando Torres'),
         ('Carles Puyol'),
          ('Santi Cazorla'),
          ('Kanti Pazorla'),
        ('Robi Vazorla'),
        ( 'Tomi Seckham'),
        (  'Michael Owen'),
         ( 'Sol Campbrell'),
         ('Paul Scholres'),
         ('David Sreaman'),
          ('Alan Shetarer'),
         ('Frank Lampardi'),
          ('Ashley Coless'),
          ('Steven Gerardi'),
            ('Phil Nevillepp'),
         ('Harry Kanem'),
      ('Raleem Sterling'),
         ('John Stoynes'),
          ('Eric Diering'),
     ('Jordan Henderason'),
      ('Jordan Pickfordy'),
     ('Marcus Rashfordy'),
        ('Dele Allipo'),
       ('Harry Maguirep'),
        ('Maria Bondarenko' );
    
 -- Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null
    create table salary(
    id serial  primary key,
    monthly_salary Int not null
    );
 select * from salary;
--Наполнить таблицу salary 15 строками:
insert into salary(monthly_salary)
values  (1000),
        (1100),
        (1200),
        (1300),
        (1400),
        (1500),
        (1600),
        (1700),
        (1800),
        (1900),
        (2000),
        (2100),
        (2200),
        (2300),
        (2400),
        (2500);
  --Создать таблицу employee_salary
--id. Serial  primary key,
-- employee_id. Int, not null, unique
--salary_id. Int, not null
       create table employee_salary(
       id serial primary key,
       employee_id Int not null unique,
       salary_id int not null
       );
select * from employee_salary;
--Наполнить таблицу employee_salary 40 строками:
-- В 10  строк из 40 вставить несуществующие employee_id
insert into employee_salary(id,employee_id,salary_id)
values 
(1,	3,	7),
(2,	1,	4),
(3,	5 ,9),
(4,	40 ,13),
(5,	23,	4),
(6,	11,	2),
(7,	52 ,10),
(8,	15,	13),
(9,	26,	4),
(10,16,1),
(11,33, 7),
(30 ,71,3),
(31, 72, 5),
(32, 73, 6),
(33, 74, 7),
(34, 75, 8),
(35, 76, 9),
(36, 77, 10),
(37, 78, 11),
(38, 79, 12),
(39, 80, 13),
(40, 2,	14),
(41, 4,	15),
(42, 6,	16),
(43, 7,	2),
(44, 8,	8),
(45, 9,	11),
(46, 10, 7),
(47, 24, 5),
(48, 12, 6),
(49, 13,2),
(50, 14, 14),
(51, 25, 1),
(52, 27, 2),
(53,17,	4),
(54,18,12),
(55,19,	6),
(56,20,	7),
(57,21,	5),
(58,22,	1);

--Создать таблицу roles
--id. Serial  primary key,
--role_name. int, not null, unique
create table roles(
id serial primary key,
role_name int not null unique
);
select * from roles; 
--Поменять тип столба role_name с int на varchar(30)
alter table roles
alter column role_name type varchar(30)
using role_name::integer;
--Наполнить таблицу roles 20 строками
insert into roles(role_name)
values
('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');
- Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле  id)
--role_id. Int, not null внешний ключ для таблицы  roles, поле id)
create table roles_employee(
id serial  primary key,
employee_id Int not null unique,
role_id Int not null,
foreign key (employee_id)
  references employees (id),
foreign key (role_id)
  references roles (id)
);
select * from roles_employee;
--Наполнить таблицу roles_employee 40 строками:
insert into roles_employee (id, employee_id, role_id)
values
(1,  7, 	2),
(2, 	20, 	4),
(3, 	3, 	 9),
(4, 	5 ,	 13),
(5, 	23, 	4),
(6, 	11, 	2),
(7, 	10, 	9),
(8, 	22, 	13),
(9, 	21, 	3),
(10, 	34, 	4),
(11,	6 , 	7),
(12, 	15, 	1),
(13, 	17, 	5),
(14, 	18, 	6),
(15, 	19, 	8),
(16, 	24, 	10),
(17, 	25, 	11),
(18, 	26, 	12),
(19, 	27, 	14),
(20, 	28, 	15),
(21, 	29, 	16),
(22, 	30, 	17),
(23, 	31, 	18),
(24, 	32, 	19),
(25, 	33, 	20),
(26, 	35, 	1),
(27, 	36, 	2),
(28, 	37, 	3),
(29, 	38, 	5),
(30, 	39, 	4),
(31, 	40, 	10),
(32, 	41, 	11),
(33, 	1,	 6),
(34, 	2,	 7),
(35, 	4, 	4),
(36, 	8,	 5),
(37, 	9,	 9),
(38, 	12, 	14),
(39, 	13, 	3),
(40, 	14, 	4);























































     
           
      
    
 
			
        
        
        
        
        
        
        
        
        
        
        
        

       
     