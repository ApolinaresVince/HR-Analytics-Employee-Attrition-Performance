with performance_dat as (
select 
PerformanceID ,
EmployeeID,
ReviewDate,
f.SatisfactionLevel as EnvironmentalSatisfaction,
e.SatisfactionLevel as JobSatsifaction,
g.SatisfactionLevel as RelationshipSatisfaction,
TrainingOpportunitiesTaken,
TrainingOpportunitiesWithinYear,
d.RatingLevel as WorkLifeBalance,
b.RatingLevel as SelfRating,
c.RatingLevel as ManagerRating

from dbo.PerformanceRating a

left join dbo.RatingLevel b on a.SelfRating = b.RatingID
left join dbo.RatingLevel c on a.ManagerRating = c.RatingID
left join dbo.RatingLevel d on a.WorkLifeBalance = d.RatingID
left join dbo.SatisfiedLevel e on a.JobSatisfaction = e.SatisfactionID
left join dbo.SatisfiedLevel f on a.EnvironmentSatisfaction = f.SatisfactionID
left join dbo.SatisfiedLevel g on a.RelationshipSatisfaction = g.SatisfactionID
), -- For replacing numerical values into categorical values in satisfaction and rating

employee_dat as (
select
EmployeeID,FirstName,LastName,Gender,Age,BusinessTravel,Department,DistanceFromHome_KM,State,Ethnicity,b.EducationLevel,EducationField,
JobRole,MaritalStatus,StockOptionLevel,OverTime,HireDate,Attrition,YearsAtCompany,YearsInMostRecentRole,YearsSinceLastPromotion,YearsWithCurrManager

from dbo.Employee a

left join dbo.EducationLevel b on a.Education = b.EducationLevelID
) -- for replacing educational values from numerical to categorical

select * from employee_dat a
left join performance_dat b on a.EmployeeID = b.EmployeeID


