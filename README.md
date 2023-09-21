# Bellabeat Case Study

## Introduction
Urška Sršen and Sando Mur founded Bellabeat, a high-tech company that manufactures health-focused smart products. Collecting data on activity, sleep, stress, and reproductive health has allowed Bellabeat to empower women with knowledge about their own health and habits. Since it was founded in 2013, Bellabeat has grown rapidly and quickly positioned itself as a tech-driven wellness company for women. 

## Business Task
Bellabeat is a successful small company, but they have the potential to become a larger player in the global smart device market. Urška Sršen, cofounder and Chief Creative Officer of Bellabeat, believes that analyzing smart device fitness data could help unlock new growth opportunities for the company. The marketing analyst team has been asked to focus on one of Bellabeat’s products and analyze smart device data to gain insight into how consumers are using their smart devices. These insights will then help guide marketing strategy for the company.

In this case study, I will focus on answering the following questions:
1. What are some trends in smart device usage?
2. How could these trends apply to Bellabeat customers?
3. How could these trends help influence Bellabeat marketing strategy?

## About the Dataset
The data used for this study is the Fitbit Fitness Tracker Data. This dataset was downloaded from Kaggle where it was uploaded by Möbius from Zenodo. The dataset was generated via responses to a distributed survey on Amazon Mechanical Turk.

It appears to be a good dataset with a variety of measures that will be useful for this case study. The dataset contained 18 .csv files. I selected the following tables to use in this case study:

<table>
  <tr>
    <th>Time Range</th>
    <th>Files</th> 
  </tr>
  <tr>
    <td>Daily</td>
    <td>Activity, Steps, Calories, Intensities</td> 
  </tr>
  <tr>
    <td>Hourly</td>
    <td>Calories, Intensities, Steps</td>
</table>

### Data Limitations and Credibility
There was an unequal number of participants throughout the tables. The sleep table had 24 participants, and the weight table had 8 participants. Since the data from these two tables does not include all participants, I will not be using them for a general analysis.

## Data Processing

### Tools Used
For this case study, I will be using Excel, SQL, and Tableau. I will use Excel for the initial data exploration and cleaning, then I will process and analyze the data using SQL. After analysis, I will use both Excel and Tableau for data visualization.

### Data Cleaning
After I downloaded the data and placed them in corresponding folders (daily, hourly, etc.), I opened the .csv files to begin the cleaning process. I utilized Excel to clean the data. I took the following steps to ensure that the data was clean:

1. Ensure that the data type for the table columns is correct
2. Standardized column names across the tables for ease of reference for future analysis in SQL and Tableau
3. Removed duplicate entries
4. Rounded decimal values to 2 places 

I saved the new clean data as .csv files to prepare for SQL querying. After cleaning the data, I uploaded the datasets to PostgreSQL and created tables to import the data into.  

## Analysis

### Data Aggregation
The daily activity file includes several measures (calories burned, minutes tracked, daily steps), so I will be utilizing this table for most of my analysis. I will also utilize the hourly data for calories burned and step tracking.

### SQL Analysis 
The queries used for analysis can be viewed [here](https://github.com/nthompson8/bellabeat_analysis/blob/main/Analysis.sql).


## Data Findings and Visualizations
A dashboard with data visualizations can be viewed [here](https://public.tableau.com/views/bellabeatdata/Dashboard1?:language=en-US&:display_count=n&:origin=viz_share_link).
### Steps
* Based on analysis of the average number of steps taken by hour, users take the least amount of steps from 12 to 5 AM, and the most amount of steps from 6 to 7 PM. This is not surprising, given that most people with a normal sleep schedule are alseep between 12 and 5  AM. 6 to 7 PM could have a higher average number of steps for a few reasons, like exercising or walking to various places after the workday.
* There is a sharp increase from 5 to 8 AM, and a sharp decline after 8 PM.
* When analyzing the average number of steps taken each weekday, it was found that Saturday had the most steps, and Sunday had the least.
* 

GRAPHS: HOURLY, DAILY

### Calories Burned
* The results of analysis of average calories burned by hour is very similar to the step analysis, following the same pattern. Users burned the most calories from 5 to 7 PM, and the least from 12 to 4 AM.
* Analysis of calories burned by day showed that users burned the most calories on Tuesday, and the least on Thursday.

GRAPHS: HOURLY, DAILY


### Active Minutes
* Most users had a very high number of sedentary minutes; a majority of users are sedentary for over half of the day.
* Most users' average active minutes was under 30 minutes, which is below the general recommendation of exercising for at least 30 minutes a day.

GRAPHS: BAR GRAPH OF TYPES OF MINUTES GROUPED BY ID

### Sleep
* Although only 24 users tracked their sleep, valuable insights were still able to be derived from the data
* Half of these users that tracked sleep were getting less than 7 hours a sleep a night (on average). The current recommendation is for adults to get 7 to 9 hours of sleep.

GRAPHS: MINUTES ASLEEP BY ID

### Correlations

GRAPHS: STEP BY CALS, STEP BY SLEEP, ACTIVITY BY SLEEP

### User Tracking Frequency and Duration
#### Overall Findings
* Most participants used their Fitbit for at least 28 days (out of the 31 day range of dat a collection).
* Users are almost evenly split between CDC activity levels based on the number of steps taken. Most are either moderately or somewhat active.
* Most users track with their Fitbit for at least 75% of the day.
#### Proportion of Day Tracked
Participants were classified by the average percent of the day they tracked.

* 100%: Perfect Tracking

* 75 - 99%: Consistent Tracking

* Less than 75%: Less Consistent Tracking
  
<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Classification</span></th>
    <th class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Count</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Perfect Tracking</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">2</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Consistent Tracking</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">20</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Less Consistent Tracking</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">11</span></td>
  </tr>
</tbody>
</table>

#### Number of Records

Participants were classified by the number of times they logged data over the course of the month.

* 28 to 31 days: Consistent Users

* 20 to 27 days: Regular Users

* 15 to 19 days: On and Off Users

* Less than 15 days: Sporadic User

<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax">User type</th>
    <th class="tg-0lax">Count</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax">Consistent user</td>
    <td class="tg-0lax">27</td>
  </tr>
  <tr>
    <td class="tg-0lax">Regular user</td>
    <td class="tg-0lax">3</td>
  </tr>
  <tr>
    <td class="tg-0lax">On and off user</td>
    <td class="tg-0lax">2</td>
  </tr>
  <tr>
    <td class="tg-0lax">Sporadic user</td>
    <td class="tg-0lax">1</td>
  </tr>
</tbody>
</table>

### User Activity Level

#### CDC Step
I was interested in seeing if and how participants met the CDC recommended daily step amount. I created four groups to categorize users based on CDC guidelines:

<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Number of Steps</span></th>
    <th class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Classification</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">10,000 or more</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Meets Recommendation</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">7,500 - 9,999</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Moderately Active</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">5,000 - 7,499</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Somewhat Active</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">5,000 or less</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Sedentary</span></td>
  </tr>
</tbody>
</table>

<table class="tg">
<thead>
  <tr>
    <th class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Classification</span></th>
    <th class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Count</span></th>
  </tr>
</thead>
<tbody>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Meets Recommendation</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">8</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Moderately Active</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">9</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Somewhat Active</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">9</span></td>
  </tr>
  <tr>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">Sedentary</span></td>
    <td class="tg-0lax"><span style="font-weight:400;font-style:normal;text-decoration:none;color:#000;background-color:transparent">7</span></td>
  </tr>
</tbody>
</table>

### Correlation Between Steps Taken, Calories Burned, and Distance Walked

### Steps, Calories Burned, Activity Level (Hourly, Daily, Weekly)


## Solutions

## Conclusion

## Next Steps
