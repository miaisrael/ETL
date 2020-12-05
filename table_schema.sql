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

---Check that data loaded
select * from primary_2016_ga
select * from election_2020_ga