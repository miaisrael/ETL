-- Create tables for raw data to be loaded into
CREATE TABLE election_2020_ga (
	ga_county varchar Primary Key,
	republican varchar,
	rep_votes int,
	democrat varchar,
	dem_votes int,
	total_votes int
);

CREATE TABLE primary_2016_ga (
	ga_county varchar Primary Key,
	republican_votes int,
	democrat_votes int,
	total_votes int
);

CREATE TABLE race_data_2016 (
	ga_county varchar Primary Key,
 	black_male int,
 	black_female int,
 	black_unknown int,
 	white_male int,
 	white_female int,
	white_unknown int,
 	asia_pi_male int,
 	asia_pi_female int,
 	asia_pi_unknown int,
 	hisp_lat_male int,
 	hisp_lat_female int,
 	hisp_lat_unknown int,
 	native_am_male int,
 	native_am_female int,
 	native_am_unknown int,
 	other_male int,
 	other_female int,
 	other_unknown int,
 	unknown_male int,
 	unknown_female int,
 	unknown int,
 	total_voters int
);

CREATE TABLE race_data_2020 (
	ga_county varchar Primary Key,
 	black_male int,
 	black_female int,
 	black_unknown int,
 	white_male int,
 	white_female int,
	white_unknown int,
 	asia_pi_male int,
 	asia_pi_female int,
 	asia_pi_unknown int,
 	hisp_lat_male int,
 	hisp_lat_female int,
 	hisp_lat_unknown int,
 	native_am_male int,
 	native_am_female int,
 	native_am_unknown int,
 	other_male int,
 	other_female int,
 	other_unknown int,
 	unknown_male int,
 	unknown_female int,
 	unknown int,
 	total_voters int
);


create table fulton_trump_2020 (
	race varchar,
	candidate varchar,
	total_votes int,
	absentee_by_mail int,
	advance_in_person int,
	election_name varchar,
	election_date date,
	registered_voters int,
	ballots_cast int,
	voter_turnout varchar
);
	
create table fulton_biden_2020 (
	race varchar,
	candidate varchar,
	total_votes int,
	absentee_by_mail int,
	advance_in_person int,
	election_name varchar,
	election_date date,
	registered_voters int,
	ballots_cast int,
	voter_turnout varchar
);

---Check that data loaded
select * from primary_2016_ga
select * from election_2020_ga
select * from race_data_2016
select * from race_data_2020
select * from fulton_trump_2020
select * from fulton_biden_2020
