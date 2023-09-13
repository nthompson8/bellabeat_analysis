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

### User Tracking Frequency and Duration

### User Activity Level
Participants were classified by the avergae percent of the day they tracked.

* 100%: Perfect Tracking

* 75 - 99%: Consistent Tracking

* Less than 75%: Less Consistent Tracking

### Correlation Between Steps Taken, Calories Burned, and Distance Walked

### Steps, Calories Burned, Activity Level (Hourly, Daily, Weekly)


## Solutions

## Conclusion

## Next Steps
