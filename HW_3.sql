
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employee_name, monthly_salary
from employees
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
order by employee_name
;
select employee_name from employees e
join salary s
on e.id = s.id;

--2. Вывести всех работников у которых ЗП меньше 2000.
select employee_name, monthly_salary
from employees
         join employee_salary
              on employees.id = employee_salary.employee_id
         join salary s on s.id = employee_salary.salary_id
where monthly_salary < 2000
order by monthly_salary
;
--3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select es.salary_id, s.monthly_salary from employee_salary es
full join employees e on es.employee_id = e.id
join salary s on es.salary_id = s.id
where e.employee_name isnull
;
-- 4. Вывести все зарплатные позиции  меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary, employee_name, role_name, salary_id
from employees
         full outer join employee_salary es on employees.id = es.employee_id
         full outer join salary s on s.id = es.salary_id
         full outer join roles_employee re on employees.id = re.employee_id
         full outer join roles r on r.id = re.role_id
where employee_name isnull
  and monthly_salary > 0
  and monthly_salary < 2000
order by monthly_salary
;
-- 5. Найти всех работников кому не начислена ЗП.
select employee_name, monthly_salary, role_name
from employees
         full outer join employee_salary es on employees.id = es.employee_id
         full outer join salary s on s.id = es.salary_id
         full outer join roles_employee re on employees.id = re.employee_id
         full outer join roles r on r.id = re.role_id
where monthly_salary isnull
order by employee_name
;
-- 6. Вывести всех работников с названиями их должности
select employee_name, role_name
from roles_employee re
         join employees on employees.id = re.employee_id
         join roles r on r.id = re.role_id;
  --7. Вывести имена и должность только Java разработчиков
        select employee_name, role_name
from roles_employee re
         join employees
              on employees.id = re.employee_id
         join roles r on r.id = re.employee_id
where role_name like '%Java developer%'
;
--8. Вывести имена и должность только Python разработчиков.
select employee_name, role_name
from roles_employee re
         join employees
              on employees.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%Python developer%'
;
--9. Вывести имена и должность всех QA инженеров.
select employee_name, role_name
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%QA%'
;
-- 10. Вывести имена и должность ручных QA инженеров.
select employee_name, role_name
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%Manual QA%'
;
-- 11. Вывести имена и должность автоматизаторов QA
select employee_name, role_name
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%Automation QA%'
;
--12. Вывести имена и зарплаты Junior специалистов
select employee_name, role_name, monthly_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Junior%'
order by role_name
;
-- 13. Вывести имена и зарплаты Middle специалистов
select employee_name, role_name, monthly_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Middle%'
order by role_name
;
--14. Вывести имена и зарплаты Senior специалистов
select employee_name, role_name, monthly_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Senior%'
order by role_name
;
-- 15. Вывести зарплаты Java разработчиков
select distinct role_name, monthly_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Java%'
;
--16. Вывести зарплаты Python разработчиков
select distinct role_name, monthly_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Python%'
;
-- 17. Вывести имена и зарплаты Junior Python разработчиков
select monthly_salary, employee_name, role_name
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Junior Python developer%'
;
--18. Вывести имена и зарплаты Middle JS разработчиков
select monthly_salary, employee_name, role_name
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Middle JavaScript developer%'
;
--19. Вывести имена и зарплаты Senior Java разработчиков
select monthly_salary, employee_name, role_name
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Senior Java developer%'
;
--20. Вывести зарплаты Junior QA инженеров
select distinct role_name, monthly_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Junior%QA%'
;
-- 21. Вывести среднюю зарплату всех Junior специалистов
select role_name, round(avg(monthly_salary)) as avg_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%Junior%'
group by r.role_name
;
----  22. Вывести сумму зарплат JS разработчиков
select role_name, round(avg(monthly_salary)) as avg_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%JavaScript%'
group by r.role_name
;
--  23. Вывести минимальную ЗП QA инженеров
select role_name, round(min(monthly_salary)) as min_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%QA%'
group by r.role_name
;
--  23. Вывести минимальную ЗП QA инженеров
select role_name, round(min(monthly_salary)) as min_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%QA%'
group by r.role_name
;
--  24. Вывести максимальную ЗП QA инженеров
select role_name, round(max(monthly_salary)) as max_salary
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%QA%'
group by r.role_name
;

--  25. Вывести количество QA инженеров
select role_name, count(employee_id) as count
from roles_employee re
         join employees on employees.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%QA%'
group by rollup (r.role_name)
;


--  26. Вывести количество Middle специалистов.
select role_name, count(employee_id) as count
from roles_employee re
         join employees on employees.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%Middle%'
group by rollup (r.role_name)
;

--  27. Вывести количество разработчиков
-- Посчитаем количество разработчиков каждой занятой специальности и в сумме всех разработчиков (в итоговой строке)
select role_name, count(employee_id) as count_employee
from roles_employee re
         join employees on employees.id = re.employee_id
         join roles r on r.id = re.role_id
where role_name like '%developer%'
group by rollup (r.role_name)
;

--  28. Вывести фонд (сумму) зарплаты разработчиков.
select distinct role_name, sum(monthly_salary)
from employees
         join roles_employee re on employees.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on employees.id = es.employee_id
         join salary s on s.id = es.salary_id
where role_name like '%developer%'
group by rollup (r.role_name)
;
-- Или если только итоговую сумму без разбивки по специальности разработчика
select sum(monthly_salary)
from salary s
         join employee_salary es on s.id = es.salary_id
         join roles_employee re on re.employee_id = es.employee_id
         join roles r on r.id = re.role_id
where r.role_name like '%developer%';

--  29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employee_name, role_name, monthly_salary
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on e.id = es.employee_id
         join salary s on s.id = es.salary_id
order by monthly_salary
;

--  30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employee_name, role_name, monthly_salary
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on e.id = es.employee_id
         join salary s on s.id = es.salary_id
where monthly_salary between 1700 and 2300
order by monthly_salary
;

--  31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employee_name, role_name, monthly_salary
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on e.id = es.employee_id
         join salary s on s.id = es.salary_id
where monthly_salary < 2300
order by monthly_salary
;

--  32. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП равна 1100, 1500, 2000
select employee_name, role_name, monthly_salary
from employees e
         join roles_employee re on e.id = re.employee_id
         join roles r on r.id = re.role_id
         join employee_salary es on e.id = es.employee_id
         join salary s on s.id = es.salary_id
where monthly_salary in (1100, 1500, 2000)
order by monthly_salary
;

















































     
           
      
    
 
			
        
        
        
        
        
        
        
        
        
        
        
        

       
     