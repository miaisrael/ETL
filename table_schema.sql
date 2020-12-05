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

---Check that data loaded
select * from primary_2016_ga
select * from election_2020_ga
