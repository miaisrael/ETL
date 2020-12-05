# ETL Project Group 9
## Mia Israel, Richard Philipose, Lindsey Hoffman

# Introduction
The purpose of this project was to demonstrate skills necessary for extracting data from various sources, transforming the data to fit analytical needs and load the data into a database for further use.  The primary use of this database is to examine United States federal election results from 2016 and 2020. The state of interest for this database is Georgia, and a specific county of interest is Fulton County in Metro Atlanta. 

# Methods

### Extract

The data sources compiled include four CSV files publicly accessed through Kaggle and georgia.gov. The Fulton County data was extracted using the Fulton County API, powered by Socrata, and returned as a JSON object. The national election data for 2016 and 2020 were found on Kaggle.  Each dataset had one CSV included that contained state, county, party and voter information, as well as additional columns.  These CSV files were ideal since they provided a county-level breakdown of election information. Other datasets that contained only state level information were reviewed, but discarded.  Since the focus was on only the state of Georgia, the granularity of county level data was ideal.

The Georgia Secretary of State datasets include county-level voter information by race and gender. The race categories are Asian American/Pacific Islander (asia_pi), Black Non-Hispanic (black), Native American (native_am), Other (other), Unknown (unknown), and White (white). The gender categories are Female, Male, and Unknown. A relational database is needed because some potential analyses will require queries that join tables. 

In order to extract data via APIs, multiple data sources were analyzed, but most of them require a paymet/fee and were extremely documentation heavy such as the Google Civic Info API. We conducted API calls to the Fulton County open data.gov website and extracted data using the GET function and limited our calls to the first 2000 rows and converted them into a Dataframe.

### Transform

The Secretary of State datasets were first cleaned manually in Excel to remove the race categories abbreviations key rows and instruction rows. This set the column headers as the first row of each dataset. The 2020 dataset included a 160th row totaling the votes per race category, but the 2016 dataset did not. Using the Excel sum function, a 160th row for totals was added to the 2016 dataset. Using Excel, the word "Total" was added into the ga_county column for both datasets for the totals (last) row.  If a label had not been added to the last row, the dataframe would not have correctly populated the Postgres table. Both datasets were then imported into pandas and loaded as dataframes. Additional cleaning included deleting the “County ID”/”County Code” columns from each because they were identical to the index.

The 2016 and 2020 national election data were cleaned similarly.  First, the two CSV files were loaded into a Jupyter Notebook and cleaned usings Pandas dataframes.  In order to join approproriately with other tables in the database, the column names had to be formatted with all lower case headings and no spaces between words within a heading.  Each dataframe was filtered to show only the counties in Georgia.  The county were initially formatted as "Name County."  In order to join with other tables in the database, the word "County" was removed from the column, and the county name was converted to all capital letters.  Next, the data frames were filtered into two separate frames, one for each political party (Republican and Democrat.)  These separate dataframes were merged into a single dataframe.  The 2016 dataset included multiple entries for each county, so the merged dataframe was grouped by county name to and the sum of votes were calculated.  This allowed the final 2016 dataframe to show the total number of Republican votes, total number of Democrat votes and the total number of votes for each county.  The 2020 dataframe showed the same data without the additional grouping required.

One of the first issues using the Fulton County API was the data type format, which was in Python “O” object. The data types were converted into integer or string as appropriate. Transforming the data type will make the data easier to use during filter and aggregate analysis in the future. Secondly, the date format had an unnecessary timestamp that was not filled with useful data. The str.split function to remove the time portion and simplified the format. Columns that were too specific were removed and other columns were arranged in a more intuitive format. Finally, a column data that was a long float was retyped into an int format to round up the decimal places to 1. A percentage symbol to the newly created data type. 


### Load

Once the dataframes were finalized, they were connected and loaded into the GA Election Database (ga_election_db) created in Postgresql, and formatted using pgAdmin 4. A total of eight tables were created in this database. Once the tables were created, the data from each dataframe was imported using SQLAlchemy.  The code "pd.read_sql_query" was used to verify that the data loaded properly into each SQL table.  Once all of the data was confirmed to have loaded correctly, a sample query was created using SQLAlchemy to demonstrate a possible use of the data, and demonstrate that the tables were appropriately connected within the database.  The sample query is shown in the Election_Data_Cleaning notebook.

The final tables included in this database are:

* Biden_2020
* Election_2020_ga
* Fulton_biden_2020
* Fulton_trump_2020
* Primary_2016_ga
* Race_data_2016
* Race_data_2020
* Trump_2020

The Postgres database was connected Google Cloud Platform (GCP) by connecting the Postgres server using the local host's public IP address. The tables are currently being migrated to the cloud.

# Conclusions

Georgia was a hotly contested state in the 2020 presidential election and continues to be of great national interest.  This database could be used to analyze various factors leading to the change in Georiga.  Some possible analysis could include:

* change in voter populations between 2016
* percent of eligible voters that participated
* race demographics and party affiliation of each county

Since these data are static and were collected after the 2016 and 2020 election results were finalized, they only need to be sent at one point in time. Some limitations to the data sources in this database are that the national election results, the Georgia race and gender results, and the Fulton County results all come from different, though reliable, sources. Georgia 2020 primary results were not available and thus cannot be analyzed for comparison to 2016. When and if those become available for access, consider adding to this database for further analyses. 



# Sources:

US 2020 Dataset: https://www.kaggle.com/unanimad/us-election-2020

US 2016 Dataset: https://www.kaggle.com/benhamner/2016-us-election

Georgia Secretary of State Datasets: https://sos.ga.gov/index.php/Elections/voter_turn_out_by_demographics

Fulton County Open Data: https://data.fultoncountyga.gov/Elections/Election-Results/y7fy-g8wd

Google Slides: https://docs.google.com/presentation/d/1eeQtV9xKlptrDAJ_-LqI5jnpRvXs26QcaTTKGBBCtvI/edit?usp=sharing
