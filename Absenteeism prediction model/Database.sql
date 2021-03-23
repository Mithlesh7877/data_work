drop database  if exists Absenteeism_pred;
create database  absenteeism_pred;
use learningportal;

create table predicted_outputs(
R1 bit not null,
R2 bit not null,
R3 bit not null,
R4 bit not null,
month_value int not null,
transport_expense int not null,
age int not null,
body_mass int not null,
education bit not null,
children int not null,
pets int not null,
probability float not null,
prediction bit not null
)
-- Use python to insert predicted data values 
select count(*) from predicted_outputs
