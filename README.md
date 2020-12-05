# ETL Project Group 9
## Mia Israel, Richard Philipose, Lindsey Hoffman

The purpose of this project was to demonstrate skills necessary for extracting data from various sources, transforming the data to fit analytical needs and load the data into a database for further use.  

### Extract

The national election data for 2016 and 2020 were found on Kaggle.  Each dataset had one CSV included that contained state, county, party and voter information, as well as additional columns.  These CSV files were ideal since they provided a county-level breakdown of election information. Other datasets that contained only state level information were reviewed, but discarded.  Since the focus was on only the state of Georgia, the granularity of county level data was ideal.

### Transform

The 2016 and 2020 election data were cleaned similarly.  First, the two CSV files were loaded into a Jupyter Notebook and cleaned usings Pandas dataframes.  In order to join approproriately with other tables in the database, the column names had to be formatted with all lower case headings and no spaces between words within a heading.  Each dataframe was filtered to show only the counties in Georgia.  The county were initially formatted as "Name County."  In order to join with other tables in the database, the word "County" was removed from the column, and the county name was converted to all capital letters.  Next, the data frames were filtered into two separate frames, one for each political party (Republican and Democrat.)  These separate dataframes were merged into a single dataframe.  The 2016 dataset included multiple entries for each county, so the merged dataframe was grouped by county name to and the sum of votes were calculated.  This allowed the final 2016 dataframe to show the total number of Republican votes, total number of Democrat votes and the total number of votes for each county.  The 2020 dataframe showed the same data without the additional grouping required.

### Load

A database named ga_election_db was created in PostgresSQL.  A total of eight tables were created in this database.  Once the tables were created, 

Sources:

US 2020 Dataset: https://www.kaggle.com/unanimad/us-election-2020

US 2016 Dataset: https://www.kaggle.com/benhamner/2016-us-election

Georgia Secretary of State Datasets: https://sos.ga.gov/index.php/Elections/voter_turn_out_by_demographics

Fulton County Open Data: https://data.fultoncountyga.gov/Elections/Election-Results/y7fy-g8wd

Google Slides: https://docs.google.com/presentation/d/1eeQtV9xKlptrDAJ_-LqI5jnpRvXs26QcaTTKGBBCtvI/edit?usp=sharing
