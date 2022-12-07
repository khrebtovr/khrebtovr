CREATE DATABASE base;
CREATE TABLE base.universities (
	id int AUTO_INCREMENT PRIMARY KEY,
    university varchar (60) UNIQUE NOT NULL
);
CREATE TABLE base.faculties (
	id int AUTO_INCREMENT PRIMARY KEY,
    facultyId int,
    faculty varchar (60) NOT NULL,
    FOREIGN KEY (facultyId) REFERENCES universities (id)
);
CREATE TABLE base.teachers (
	id int AUTO_INCREMENT PRIMARY KEY,
    teacherId int,
    teacherlastName varchar (30) NOT NULL,
    teacherName varchar (30) NOT NULL,
    FOREIGN KEY (teacherId) REFERENCES faculties (id)
);
CREATE TABLE base.studentGroups (
	id int AUTO_INCREMENT PRIMARY KEY,
	groupId int,
    studentGroup varchar (10) NOT NULL,
    FOREIGN KEY (groupId) REFERENCES faculties (id)
);
CREATE TABLE base.students (
	id int AUTO_INCREMENT PRIMARY KEY,
    idGroup int,
    studentlastName varchar (30) NOT NULL,
	studentName varchar (30) NOT NULL,
    FOREIGN KEY (idGroup) REFERENCES studentGroups (id)
);

INSERT INTO base.universities (university) VALUES
('Національний авіаційний університет'),
('Київський національний університет технологій та дизайну'),
('Національний транспортний університет'),
('Київський академічний університет'),
('Київський міжнародний університет'),
('Національний медичний університет імені О. О. Богомольця');

INSERT INTO base.faculties (facultyId, faculty) VALUES 
(1, 'Аерокосмічний факультет'),
(1, 'Юридичний факультет'),
(2, 'Стоматологічний факультет'),
(2, 'Підготовки лікарів для Збройних сил України'),
(3, 'Факультет біотехнології і біотехніки'),
(3, 'Факультет лінгвістики'),
(4, 'Факультет соціології і права'),
(4, 'Радіотехнічний факультет'),
(5, 'Інженерно-хімічний факультет'),
(5, 'Факультет електроніки'),
(6, 'Фізико-математичний факультет '),
(6, 'Факультет менеджменту та маркетингу');

INSERT INTO base.teachers (teacherId, teacherlastName, teacherName) VALUES
(6, 'Патон', 'Борис'),
(5, 'Новиков', 'Микола'),
(4, 'Ельмар', 'Шрюфер'),
(3, 'Трощенко', 'Валерій'),
(2, 'Свечніков', 'Іван'),
(1, 'Найдек', 'Володимир'),
(1, 'ВоронкаРоман', 'Роман'),
(2, 'Карп', 'Ігор'),
(3, 'Трефілов', 'Віктор'),
(4, 'Кунцевич', 'Всеволод'),
(5, 'Долінський', 'Анатолій'),
(6, 'Походня', 'Ігор'),
(7, 'Шлейер', 'Пол'),
(7, 'Кляйбу', 'Армін'),
(8, 'Зайзінгер', 'Іван'),
(8, 'Мороз', 'Осип'),
(9, 'Шепелявець', 'Ярослав'),
(9, 'Гунчак', 'Тарас'),
(10, 'Альфредо', 'Карлос'),
(10, 'Манохар', 'Мурли'),
(11, 'Садлак', 'Ян'),
(11, 'Жорес', 'Іван'),
(12, 'Реджеп', 'Тайіп Ердоган'),
(12, 'Герберт', 'Манг');

INSERT INTO base.studentGroups (groupId, studentGroup) VALUES
(1, '141'),
(2, '142'),
(3, '241'),
(1, '242'),
(2, '341'),
(3, '342'),
(4, '441'),
(5, '442'),
(6, '151'),
(4, '152'),
(5, '251'),
(6, '252'),
(4, '351'),
(5, '352'),
(6, '451'),
(5, '452'),
(5, '551'),
(6, '552');

INSERT INTO base.students (idGroup, studentlastName, studentName) VALUES
(1, 'Ідрис', 'Каміл'),
(2, 'Шлейер', 'Пол'),
(3, 'Кляйбу', 'Армін'),
(4, 'Зайзінгер', 'Карл'),
(5, 'Мороз', 'Осип'),
(6, 'Шепелявець', 'Ярослав'),
(7, 'Гунчак', 'Тарас'),
(8, 'Карлос', 'Альфред'),
(9, 'Мурли', 'Маноха'),
(10, 'Ян', 'Садлак'),
(11, 'Жорес', 'Іван'),
(12, 'Реджеп', 'Тайіп'),
(13, 'Герберт', 'Манг'),
(14, 'Муда', 'Хассанал'),
(15, 'Дайсаку', 'Ікеда'),
(16, 'Васильєв', 'Юрій'),
(17, 'Володзімеж', 'Курнік'),
(18, 'Френсіс', 'Гаррі'),
(18, 'Аксьонов', 'Олександр'),
(1, 'Курлін', 'Юрій'),
(2, 'Голего', 'Микола'),
(3, 'Челомей', 'Володимир'),
(4, 'Харченко', 'Михайло'),
(5, 'Мохор', 'Володимир'),
(6, 'Аліу', 'Олумуіва'),
(7, 'Донець', 'Олександр'),
(8, 'Більчук', 'Олександр'),
(9, 'Кароль', 'Тіна'),
(1, 'Огнєвіч', 'Злата');



SELECT * FROM base.universities;

SELECT studentName, studentlastName FROM base.students;

SELECT teacherlastName, teacherName FROM base.teachers WHERE teacherName = 'Іван';

SELECT studentGroup FROM base.studentGroups WHERE studentGroup > 300;

SELECT university FROM base.universities WHERE university LIKE '%а%';



select count(studentName) from base.students where studentName like 'О%';

select min(studentgroup) from base.studentgroups;

select max(studentgroup) from base.studentgroups;

select avg(studentgroup) from base.studentgroups;

select sum(studentgroup) from base.studentgroups;


select groupId, count(studentgroup) from base.studentgroups group by groupId;
select groupId, count(studentgroup) from base.studentgroups group by groupId having groupId = 6;


select studentName, studentlastName from base.students order by studentName asc;
select studentName, studentlastName from base.students order by studentName desc;


select studentName, studentlastName, studentgroup from base.students 
inner join base.studentgroups on students.idGroup = studentgroups.id 
order by studentgroup asc;

