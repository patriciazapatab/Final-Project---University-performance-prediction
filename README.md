# University performance prediction


# Introduction

Does the median income of a neighborhood, the level of studies of parents, or the type of secondary education that students receive predict their calculus grade their first year of university?

This project aims to construct a predictive model designed to forecast university students' grades based on pre-enrollment data. By analyzing a diverse set of variables, including demographic details, secondary education metrics, and information related to university access, the project seeks to discern underlying patterns and correlations.

<br>

# Data Source
<br>

The anonymized data for this project has been provided by an Engineering University. The dataset comprises multiple documents, including:

- Pre-enrollment information: excel containing +80 variables related to students demography (sex, date of birth, address...). It is worth mentioning that this data is filled by students during their university pre-registration process and the asked fields and options might change slightly across years. In some cases, this might reduce data reliability.

- Student grades: excel with all the year and subjects coursed by enrolled students with their respective numeric and alpha numeric grades.

- Matriculation information: excel that acts as a link between the two previous excels containing a list of students that get matriculated and their student_id.

- Titulations: names, plans and codes for all the provided degrees

The dataset spans records from 2014 to 2023.

<br>

# Workflow & methodology

The main tools used for this project have been: 

- **Python**:
    - Pandas library for dataset cleaning and transformation.
    - Pymysql, SQLAlchemy, os, dotenv, and getpass libraries and modules for establishing the connection with the SQL database and working with SQL from Python.
    - Sklearn library for feature engineering and machine learning modeling.

- **SQL**: Language used to create and practice query on the students database.Check average grades per groups (by sex, by secondary school background, by degrees...).

- **Tableau**: Used for visualization and extraction of conclusions from the provided data.


All the code is available in the following **jupyter notebooks**:

1. Data_exploration_&_transformation.ipynb : Exploration and data cleansing process.

2. Dataframes_merge.ipynb : Merge of the pre-enrollment dataframe with the grades dataframe using the Matriculation dataframe as bridge.

3. Feature_engineering.ipynb : process of the multiple variables to use them in the supervised learning.

    3.1 CP_to_renta_media.ipynb: Conversion of all the available Zip Codes to the average income of 2018 in each Zip Code. This transformation is done to use a continious variable in the model. 


4. Model.ipynb: Training and Testing of multiple models to choose the one with better performance. 
 

<br>

<br>

# Observations

During the exploration, the data cleansing and the merging process some observations were made that could impact project results:

- Students that coursed the double degree of Automation and Electric engineering were matriculated in the 3 degrees the same year (Electric, Automation and Double degree). Only the double degree matriculation has been kept.
- Some observations of 2019 were lost due to the impossibility to merge the pre-enrollment data with the corresponding student grades because of an oversight during the anonymization process.

For project purposes the following decisions were taken: 
1. The model will be created for the Calculus subject since it is the one with more observations in the "Base subjects" group.
2. It will only contemplate the first time a student courses the subject.

<br>

<br>

# Results

## Regression model

Ater comparing multiple models and diverse feature engineering none of the models has an r2 higher than 0.2 . This means that the selected models explain only a 20% of the variance in student grades.

When looking at the importance of each variable it is clear that the access grade is, by far, the one with higher influence. Surprisingly, others such as the average income are not significant at all.



## Classification model

Two approaches are tried to predict a categorical grade: 

1. Alphanumeric grade (Honor, Excellent, Notable, Pass, Fail, Not presented / Not evaluated)


2. Pass / No Pass

The results in both cases are similar to the regression model. The best performing models were random forest and gradient boosting. However, only around 35% of the predictions were correct.

Again nota_acces is the variable with more weight and the only statistical significant. 


# Conclusions

While the models offer predictions, the evaluation metrics suggest room for improvement.

- Many features show minimal correlation with grades, hinting that variables like income, secondary education, or family environment impact students before university admission. However, once enrolled, differences among students narrow and become less determinant.

- Variations in mean averages across groups (e.g., Morning Cohort vs. Evening Cohort) may create biased perceptions, yet statistical significance is not guaranteed.

- Emphasizing the "human" aspect is crucial in data analysis involving people. Predictive models should not be used as definitive labels, recognizing the complexities of individual experiences and circumstances. It is important that in case an accurate model is found it is used just as a guide to help those students that might need more attention. 




# Next steps

This project marks the initial phase of an ongoing collaboration with the University aimed at enhancing student support. The current models' limited accuracy prompts further investigation. Key next steps include:

- Model Refinement: Elevate model performance through data expansion, addressing imbalances, exploring additional features, and refining through trial and error.

- Explore Alternative Targets: Extend predictive focus to other subjects, student dropout likelihood, or repeated subject instances. Utilize 1st-semester grades along with pre-enrollment data based on specific objectives.

- Qualitative Validation: Listen to students and teachers for invaluable insights, ensuring proposed actions benefit everyone involved.
