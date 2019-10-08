--select * from student where age>=30;
--select * from student where cou_id=10;
--select * from student where stu_name='±èÁØÇü';
--select * from student where age>=21 and age <=29;

--select * from student where age>=21 and age<=29;
--select * from student where age between 21 and 29;

--select * from student where age=21 or age=27 or age=28;
--select * from student where age in(21,27,28);

--select * from student where stu_name like '±è%';
--select * from student where stu_name like '_ºÀ%';

--Insert into student values(117,'±èÇÑºû',34,Null,20,'M');
--Insert into student values(118,'°­ÇÏ³ª',20,Null,30,'F');
--select * from student where stu_email is not Null;

--Select * from student order by age asc;
--Select * from student order by stu_email desc; 

--select sum(age) as [³ªÀÌÃÑÇÕ] from student;
--select avg(age) as [Æò±Õ³ªÀÌ] from student;

--select cou_id, avg(age) as [Æò±Õ³ªÀÌ] from student group by cou_id;

--select cou_id,avg(age) as [Æò±Õ³ªÀÌ] from student group by cou_id having avg(age)>=25;

--select cou_mane from course where cou_id = (select cou_id from student where stu_name='±èÁØÇü');
/*select s.STU_NAME, c.COU_MANE, c.COU_ID 
from STUDENT s, COURSE c
where s.cou_id=c.cou_id
and s.STU_NAME='±èÁØÇü';*/
--select stu_name, age, cou_id from student where cou_id in (SELECT DISTINCT cou_id from student where age>=25);

/*Insert into course(cou_id,cou_mane,tea_name) values (50, 'º¸¾È', 'ÁÖ»ó¸é');
select * from course;*/

/*Update student set cou_id=30 where cou_id=10;
select * from student;*/

/*delete student where cou_id=30;
select * from student;*/

--select * into stu_copy from student;
/*create view stu_view20 
as select stu_id,stu_name, cou_id from stu_copy where cou_id=20;*/

--select * from stu_view20;

--EXEC SP_HELPTEXT stu_view20;

--Insert into stu_view20 values(200,'Àü¼öºó',20);
--select * from stu_view20;
--select * from stu_copy;
--select * from student;

/*Alter view stu_view20
as 
select stu_id,stu_name, age,stu_email,cou_id 
from stu_copy where cou_id=20;*/
--select * from stu_view20;

drop view stu_view20;
select * from stu_view;