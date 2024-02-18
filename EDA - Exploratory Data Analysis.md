# Is diabetes a predictor of hospital readmission?

## Potenial Audience
- Patient / Patient Families
- Medical Professionals
- Insurance Companies

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

![image](https://github.com/gaurigakhar/Predictive-Analysis-on-Hospital-Readmissions/assets/44133116/bb90267b-6c74-47f6-9bff-6eaddf4a3f84)

## Bivariate Analysis
- Objective:
  - Explore relationships between pairs of variables and their association with readmission.

![image](https://github.com/gaurigakhar/Predictive-Analysis-on-Hospital-Readmissions/assets/44133116/f65b47ad-08b6-4ace-b885-1bb3797e751a)

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

![image](https://github.com/gaurigakhar/Predictive-Analysis-on-Hospital-Readmissions/assets/44133116/f7dd98e5-87be-4fd7-88b1-970c23c99ad1)

## Results and Conclusion
### Key Findings
- Patients already taking diabetes medication are at higher risk.
- Significant predictor variables: inpatient/outpatient status, diabetes medication usage, emergency visits, length of stay, age.
- Challenges: Missing values or lack of testing data for glucose diagnosis, A1c tests, general diagnosis hinder definitive determination of readmission necessity for diabetic patients.

### Implications
- Both models provide valuable insights into readmission patterns and influential factors.
- Highlighted variables can aid healthcare professionals in targeted intervention strategies to reduce readmission rates, particularly for diabetic patients.

This summary encapsulates the main components and outcomes of your hospital readmission prediction project, providing a clear understanding of the process and insights gained.
