rm(list=ls())

# Reading required packages
library("data.table")
library("ggplot2")
library("psych")
library("stringr")
library("caret")
library("stats")
library("gridExtra")

# Reading data
hospital_data=fread('hospital_readmissions.csv')

##-----DATA CLEANING----##

# Modifying age column 
hospital_data$age_t <- gsub("[", "(", hospital_data$age, fixed=TRUE)
# Checking unique values from age column
unique(hospital_data$age_t)
# Converting to integer
hospital_data$age_t_1<-as.integer(factor(hospital_data$age_t),levels=c("(70-80)","(50-60)","(60-70)","(40-50)","(80-90)","(90-100)"))

# Checking unique values for categorical columns
unique(hospital_data$glucose_test)
unique(hospital_data$A1Ctest)
# Converting to integer
hospital_data$glucose_test_t <- as.integer(factor(hospital_data$glucose_test, levels = c("no", "normal", "high")))
hospital_data$A1Ctest_t <- as.integer(factor(hospital_data$A1Ctest, levels = c("no", "normal", "high")))

# Creating dummy columns
hospital_data$change_t <- as.integer(factor(hospital_data$change) )
hospital_data$readmitted_t <- 0
hospital_data$readmitted_t[hospital_data$readmitted=='yes']=1
hospital_data$diabetes_med_t <- as.integer(factor(hospital_data$diabetes_med))

# Checking unique values for medical_speciality
unique(hospital_data$medical_specialty)
hospital_data$medical_specialty_t <- as.integer(factor(hospital_data$medical_specialty,levels = c("Missing" ,"Other",
                                                                                                  "InternalMedicine",
                                                                                                  "Family/GeneralPractice",
                                                                                                  "Cardiology","Surgery",
                                                                                                  "Emergency/Trauma")))
# Checking unique values for diag_1
unique(hospital_data$diag_1)
hospital_data$diag_1_t <- as.integer(factor(hospital_data$diag_1, levels = c("Circulatory","Other","Injury","Digestive","Respiratory","Diabetes","Musculoskeletal", "Missing")))

# Checking unique values for diag_2
unique(hospital_data$diag_2)
hospital_data$diag_2_t <- as.integer(factor(hospital_data$diag_2, levels = c("Circulatory","Other","Injury","Digestive","Respiratory","Diabetes","Musculoskeletal", "Missing")))

# Checking unique values for diag_3
unique(hospital_data$diag_3)
hospital_data$diag_3_t <- as.integer(factor(hospital_data$diag_3, levels = c("Circulatory","Other","Injury","Digestive","Respiratory","Diabetes","Musculoskeletal", "Missing")))

# Creating a subset dataframe with all the predictor variables
data_sub <- hospital_data[,!c("age","age_t","medical_specialty","diag_1","diag_2","diag_3","glucose_test","A1Ctest","change","diabetes_med","readmitted")]

##----EDA----##

# Heat Map - Correlation between variables
corr <- round(cor(data_sub), 2)

# Plotting heat map to show correlation
ggplot(data = reshape2::melt(corr), aes(x = Var1, y = Var2, fill = value)) + 
  geom_tile() +
  scale_fill_gradientn(colors = c("#b6cdf0", "#17947f"), na.value = "white") +
  theme_bw() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  geom_text(aes(label = value), size = 2)


#----Categorical Variables-----#

# Creating subplots for each categorical variable
p8 <- ggplot(hospital_data, aes(x = age_t, fill = age_t)) + 
  geom_bar(stat = "count", color = "black", fill = "#17947f") + 
  labs(title = "Age", x = "Age", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p9 <- ggplot(hospital_data, aes(x = A1Ctest, fill = A1Ctest)) + 
  geom_bar( stat = "count", color = "black", fill = "#17947f") + 
  labs(title = "A1Ctest", x = "A1Ctest", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p10 <- ggplot(hospital_data, aes(x = change, fill = change)) + 
  geom_bar( stat = "count", color = "black", fill = "#17947f") + 
  labs(title = "Change", x = "change", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p11 <- ggplot(hospital_data, aes(x = diabetes_med, fill = diabetes_med)) + 
  geom_bar( stat = "count", color = "black", fill = "#17947f") + 
  labs(title = "Diabetes_med", x = "diabetes_med", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p12 <- ggplot(hospital_data, aes(x = glucose_test, fill = glucose_test)) + 
  geom_bar( stat = "count", color = "black", fill = "#17947f") + 
  labs(title = "Glucose Test", x = "glucose_test", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

# Arranging subplots in a grid
grid.arrange(p8, p9, p10, p11, p12, ncol = 2)

#-----Continuous Variables-----#

# Creating subplots for each continuous variable
p1 <- ggplot(data_sub, aes(x = time_in_hospital)) + 
  geom_histogram(binwidth = 0.5, color = "black", fill = "#254370") + 
  labs(title = "Time in Hospital", x = "Time in Hospital", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p2 <- ggplot(data_sub, aes(x = n_lab_procedures)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "#254370") + 
  labs(title = "Number of Laboratory Procedures", x = "Number of Laboratory Procedures", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p3 <- ggplot(data_sub, aes(x = n_procedures)) + 
  geom_histogram(binwidth = 0.5, color = "black", fill = "#254370") + 
  labs(title = "Number of Procedures", x = "Number of Procedures", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p4 <- ggplot(data_sub, aes(x = n_medications)) + 
  geom_histogram(binwidth = 0.5, color = "black", fill = "#254370") + 
  labs(title = "Number of Medications", x = "Number of Medications", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p5 <- ggplot(data_sub, aes(x = n_outpatient)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "#254370") + 
  labs(title = "Number of Outpatient Visits", x = "Number of Outpatient Visits", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p6 <- ggplot(data_sub, aes(x = n_inpatient)) + 
  geom_histogram(binwidth = 0.5, color = "black", fill = "#254370") + 
  labs(title = "Number of Inpatient Visits", x = "Number of Inpatient Visits", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

p7 <- ggplot(data_sub, aes(x = n_emergency)) + 
  geom_histogram(binwidth = 1, color = "black", fill = "#254370") + 
  labs(title = "Number of Emergency Visits", x = "Number of Emergency Visits", y = "Count") +
  theme(plot.title = element_text(size = 13), axis.title = element_text(size = 10))

# Arranging subplots in a grid
grid.arrange(p1, p2, p3, p4, p5, p6, p7, ncol = 2)

#-----Bivariate Analysis-----#

# Create a function to plot the count plots for each variable
plot_count <- function(x_var, y_var, title){
  ggplot(hospital_data, aes(x = {{x_var}}, fill = readmitted)) +
    geom_bar(position = 'dodge') +
    ggtitle(title) +
    labs(x = deparse(substitute(x_var)), y = 'Count') +
    scale_fill_manual(values = c('#17947f','#b6cdf0')) +
    theme_classic() +
    theme(legend.position = 'top')
}

# Create a grid of subplots using the plot_count function
grid.arrange(
  plot_count(age, readmitted, 'Age'),
  plot_count(glucose_test, readmitted, 'Glucose Test'),
  plot_count(A1Ctest, readmitted, 'A1Ctest'),
  plot_count(change, readmitted, 'Change'),
  plot_count(diabetes_med, readmitted, 'Diabetes_med'),
  nrow = 3, ncol = 2
)

##-----DATA MODELLING----##

# Dividing data into train and split data
set.seed(162807)
trainIndex <- createDataPartition(data_sub$readmitted_t, p = 0.7, list = FALSE)
trainData <- data_sub[trainIndex, ]
testData <- data_sub[-trainIndex, ]

# LOGISTIC REGRESSION

# Approach 1 Feature selection using step function
# Applying logistic regression
glm_model <- glm(readmitted_t~.,family=binomial(link="logit"),data=trainData)
summary(glm_model)
step(glm_model)

# Glm model with only significant features
modify_model <- glm(readmitted_t ~ time_in_hospital + n_procedures + n_outpatient + 
                      n_inpatient + n_emergency + age_t_1 + diabetes_med_t + medical_specialty_t + 
                      diag_2_t + diag_3_t,family=binomial(link="logit"),data=trainData)
summary(modify_model)

# Predicting the values of readmission on Test data
predicted_readmission <- predict(modify_model,newdata=testData,type="response")

# Plotting the logit model
#plot(readmitted_t ~ time_in_hospital + n_procedures + n_outpatient + 
#       n_inpatient + n_emergency + age_t_1 + diabetes_med_t + medical_specialty_t + 
#       diag_2_t + diag_3_t, data = testData, col = "maroon")

#lines(readmitted_t ~ n_procedures, data = testData, col = "red")

# probability of success and failure cutoff
mbrCutoff<-0.5

# Creating Classification and Confusion Matrix 
TstCls <- predicted_readmission*0
TstCls[predicted_readmission >= mbrCutoff] <- 1
(llogitTst <- table(TstCls,testData$readmitted_t, dnn=c("Predicted","Actual")) )

# Plotting Heat Map for Confusion Matrix
heatmap(llogitTst, 
        Rowv=NA, Colv=NA, 
        main='Confusion Matrix - Logistic Regression',
        xlab='Actual',
        ylab='Predicted',
        col=rev(colorRampPalette(c('#b6cdf0', '#17947f'))(100)),
        margins=c(10, 10),
        add.expr = {  
          for(i in 1:nrow(llogitTst)) { 
            for(j in 1:ncol(llogitTst)) { 
              text(j, i, llogitTst[i, j], cex = 2.0, col = "black") 
            } 
          } 
        })

# Calculating Accuracy for glm
(accuracy <- sum(diag(llogitTst))/sum(llogitTst))

# DECISION TREE

require("partykit")

dtreemodel<-ctree(readmitted_t~time_in_hospital + n_procedures + n_outpatient + 
                    n_inpatient + n_emergency + age_t_1 + diabetes_med_t + medical_specialty_t + 
                    diag_2_t + diag_3_t,data=trainData)

# Plotting graph for decision tree
plot(dtreemodel)

# Predicting y values on test data based on decision tree
dTreepredTst <- predict(dtreemodel,newdata=testData)

# Creating classification and confusion matrix
dTreecls <- dTreepredTst*0
dTreecls[dTreepredTst >= mbrCutoff] <- 1
(dTreeTst <- table(dTreecls,testData$readmitted_t,dnn=c("Predicted","Actual")))

# Plotting Heat Map for Confusion Matrix
heatmap(dTreeTst, 
        Rowv=NA, Colv=NA, 
        main='Confusion Matrix - Decision Tree',
        xlab='Actual',
        ylab='Predicted',
        col=rev(colorRampPalette(c('#b6cdf0', '#17947f'))(100)),
        margins=c(10, 10),
        add.expr = { 
          for(i in 1:nrow(dTreeTst)) { 
            for(j in 1:ncol(dTreeTst)) { 
              text(j, i, dTreeTst[i, j], cex = 2.0, col = "black") 
            } 
          } 
        })

# Calculating Accuracy for decision tree
(accuracy_dtree <- sum(diag(dTreeTst))/sum(dTreeTst))

