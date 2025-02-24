/* Views*/

use club;
create view vw_football as
select club_id, club_name from football_club;

create index indx_club on football_club (club_name, club_email);  
# Index indx_club created on the columns club_name & club_email

# to drop index 
alter table football_club
drop index indx_club;

/*Triggers*/

delimiter //		
create trigger emp_trig_Age
before insert on employees
for each row 
if new.Work_Service_Age < 0 then set new.Work_Service_Age = 0; 
end if; //

drop trigger emp_trig_age
