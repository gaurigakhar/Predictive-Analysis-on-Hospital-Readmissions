1. Research question
a) What novel question(s) do you aim to answer in your project?
 Is diabetes a predictor of hospital readmission?
b) Who will be your potential audience (e.g., a manager/executive in a particular function of a particular
industry, or policy makers/government agencies)?
 Patient / Patient Families
 Hospitals
 Insurance Companies
c) Why would they be interested in your question(s)? Be specific.
 Patients and their families can benefit from this project as it can help them to understand their risk of
readmission.
 Healthcare professionals are interested in hospital readmission as it can help them identify patients at high
risk of readmission and take proactive measures to prevent it.
 Insurance companies can identify the patients who are at high risk of readmission to increase their
profitability.
2. Data
a) What is the data source?
 https://www.kaggle.com/datasets/dubradave/hospital-readmissions
b) What is the data period you are looking at?
 10 years of patient data
c) What is the level of observation?
 Individual patient level data
d) Do you have repeated observations for a given party?
 No, as it is a hospital admission data it is presumed with the dataset that we do not have any duplicate values
and we will be adding a unique identifier column to make sure each observation is marked unique.
3. Model
a) What is the outcome of interest (Y variable)?
 Will the patient be readmitted to the Hospital or not? The Dataset contains a column: 'readmitted'.
b) What are covariates or predictors (X variables) you plan on including in your Model?
 The following are the predictors: 'age', 'time_in_hospital', 'n_lab_procedures', 'n_procedures’,
‘n_medications', 'n_outpatient', 'n_inpatient', 'n_emergency', 'medical_specialty', 'diag_1', 'diag_2', 'diag_3',
'glucose_test', 'A1Ctest', 'change', 'diabetes_med'.
c) What statistical model(s) do you plan on using?
 Logistic Regression (Logit function)
4. Results/conclusions
a) What results/conclusions did you arrive at?
 Considering the clinical parameters, we would derive predicted probability through logistic regression and
determine whether a diabetic patient has risk of being readmitted or not.
b) If you have not checked any plots or conducted any statistical analyses yet, what are possible conclusions you
can reach based on your analyses?
 What clinical factors are affecting the patient to get readmitted to the Hospital?
 We will be conducting data preprocessing, feature selection, and we will make necessary imputation in the
given dataset.
 We will be generating different plots variable/feature correlation, chi-square test for categorical variable
selection, box plots for EDA.
 We will be predicting the hospital readmission rate for diabetic patients while keeping various parameters
constant and monitoring the effects.
