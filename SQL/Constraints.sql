create database club;
drop database club; 

use club;
create table football_club
(
club_id int not null primary key,
date_of_creation date,
club_Name varchar (100),
club_division varchar (50),
club_email varchar(400)
);

# Insert into football table
insert into football_club
(club_Id, date_of_creation, club_Name, club_division, club_email)
values
(1,'2025-02-11','Man City','1', 'mancity.com'),
(2,'2025-04-09','Chelsea','1', 'chelsea.com'),
(3,'2025-03-02','Watford','1', 'watford.com'),
(4,'2025-06-22','West Ham','1', 'westham.com'),
(5,'2025-06-28','Wolf', '1', 'wolf.com');

select * from football_club;
truncate football_club;

/* Foreign Contraints*/
create index indx_fname on performance_evaluation (first_name);  
# Index required for Foreign keys as automatic indexing cannot apply.

use infotech;
alter table employees
add constraint foreign_con foreign key (first_name)
references performance_evaluation (first_name);

/* Unique Constraints*/
alter table football_club
add constraint unique_con unique (club_email);
 
 /* Check Constraints*/
alter table football_club
add constraint check_con check (club_Name is not null); # Condition: Club name is not null

 /* Default Constraints*/
alter table football_club
alter column club_division set default 2;

select * from football_club