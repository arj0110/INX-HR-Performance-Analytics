use inx;
select * from employees;

desc employees;

#average ratings per age with number of employees 
select Age,avg(PerformanceRating) as avg_ratings,count(*) as employee_count from employees
group by age
order by Age;

#SELECT * FROM employees
#WHERE EmpJobSatisfaction is null OR Attrition is null;

select Age,avg(EmpJobSatisfaction) from employees
group by age
order by age;

select avg(ExperienceYearsAtThisCompany) from employees;
select avg(PerformanceRating) from employees;
select avg(EmpJobSatisfaction) from employees;

#Employees with high experience and low perfomance 
select EmpNumber,ExperienceYearsAtThisCompany,PerformanceRating from employees
where ExperienceYearsAtThisCompany>= 7 and PerformanceRating <2.5
order by EmpNumber;

#Employees having low satisfaction rate and low performance shown along with experience
select EmpNumber,EmpJobSatisfaction,PerformanceRating,ExperienceYearsAtThisCompany from employees
where EmpJobSatisfaction<=2 and PerformanceRating <=2;

#select distinct(YearsSinceLastPromotion) from employees;

select round((avg(case when Attrition  = 'yes' then 1 else 0 end)*100),2) as percent_employee_left
from employees;

select (avg(case when Attrition  = 'no' then 1 else 0 end)*100) as Employeesleft_Percent
from employees;

#number of employees as per attrition status
select Attrition,count(*) as count_employee
from employees
group by Attrition;

#analysis
select count(*) as employees_count,
		avg(PerformanceRating) as avg_performance_ratings,
        avg(EmpJobSatisfaction) as avg_job_satisfaction,
        avg(EmpWorkLifeBalance) as avg_worklife_rating
from employees
where Attrition = 'no'
group by PerformanceRating;

#number of employees as per Performance ratings
select PerformanceRating,count(*) as count_employee
from employees
group by PerformanceRating;

select Attrition,PerformanceRating,ExperienceYearsAtThisCompany
from employees
where Attrition = 'no' and PerformanceRating < 3;

#Training time and performance
select TrainingTimesLastYear,avg(PerformanceRating)
from employees
group by TrainingTimesLastYear
order by TrainingTimesLastYear;

#performance as per departments
select EmpDepartment,round(avg(PerformanceRating),2) as Avg_performance
from employees
group by EmpDepartment
order by Avg_performance desc;

select EmpJobRole,round(avg(PerformanceRating),2) as Avg_performance
from employees
group by EmpJobRole
order by Avg_performance desc;