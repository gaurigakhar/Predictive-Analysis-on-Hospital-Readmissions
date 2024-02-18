## Dataset
- Contains over 25,000 records spanning 10 years.
- 14 columns at individual patient level.

## Data Preprocessing
- Steps:
  - Data cleaning
  - Handling missing values
  - Creating dummy variables
- Target Variable: "Readmitted" converted into binary form (0 and 1) for modeling.

## Exploratory Analysis
- Correlation Matrix:
  - Identifying highly correlated and negatively correlated variables.

![image](https://github.com/gaurigakhar/Predictive-Analysis-on-Hospital-Readmissions/assets/44133116/ee408acd-c691-42eb-8be8-6afd8801cd45)

- Distribution Plots:
  - Assessing impact of continuous and categorical variables on readmission.

## Bivariate Analysis
- Objective:
  - Explore relationships between pairs of variables and their association with readmission.

## Data Modeling
### 1. Linear Regression
- Method:
  - Logistic regression analysis to estimate probability of readmission.
- Insights:
  - Provided estimation of readmission likelihood considering medication usage, hospital visits, demographics.
- Accuracy:
  - Achieved 61.34%.

### 2. Decision Tree
- Method:
  - Revealed hierarchical relationships between predictor variables and readmission outcomes.
- Insights:
  - Visualized decision-making process, identified influential factors.
- Accuracy:
  - Achieved 60.25%.

## Results and Conclusion
### Key Findings
- Patients already taking diabetes medication are at higher risk.
- Significant predictor variables: inpatient/outpatient status, diabetes medication usage, emergency visits, length of stay, age.
- Challenges: Missing values or lack of testing data for glucose diagnosis, A1c tests, general diagnosis hinder definitive determination of readmission necessity for diabetic patients.

### Implications
- Both models provide valuable insights into readmission patterns and influential factors.
- Highlighted variables can aid healthcare professionals in targeted intervention strategies to reduce readmission rates, particularly for diabetic patients.

This summary encapsulates the main components and outcomes of your hospital readmission prediction project, providing a clear understanding of the process and insights gained.
