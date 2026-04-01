# 🏥 Healthcare Outcomes Analysis & Risk Stratification

## 📌 Project Overview

This project focuses on **analyzing healthcare data to identify patterns in patient outcomes and stratify patients based on risk levels**. The goal is to support **data-driven clinical decision-making**, improve patient care, and optimize healthcare resource allocation.

It combines:

* 📊 Data Analytics (SQL, Excel, Tableau)
* 🤖 Machine Learning (Python)
* 🌐 Deployment (Streamlit Web App)

---

## 🎯 Problem Statement

Healthcare systems generate large volumes of patient data, but:

* Identifying **high-risk patients early** is difficult
* Clinical decisions are often **not data-driven**
* There is limited integration of **analytics + predictive modeling**

👉 This project solves:

* Risk identification using patient attributes
* Outcome-based analysis of diagnoses and treatments
* Monitoring trends in lab results and patient recovery

---

## 💡 Solution Approach

The project follows a **complete data analytics lifecycle**:

1. **Data Collection & Integration**
2. **Data Cleaning & Exploration**
3. **SQL-Based Analysis**
4. **Visualization & KPI Tracking**
5. **Machine Learning Model for Risk Prediction**
6. **Deployment as an Interactive Web App**

---

## 🗂️ Dataset Description

The project uses structured healthcare datasets:

* **Patients.csv** → Patient demographics & hospitalization data
* **Diagnosis.csv** → Disease classification
* **Outcomes.csv** → Recovery outcomes
* **Labs.csv** → Lab test results

### Key Features:

* Age, Gender
* Diagnosis & Outcomes
* Admission & Discharge Dates
* Treatment Cost
* Lab Test Results (e.g., Blood Sugar, Cholesterol)

---

## 🏗️ Database Design (SQL)

A relational database is created with 4 main tables:

* `Patients`
* `Diagnosis`
* `Outcomes`
* `Labs`

👉 SQL schema and queries available here:


### Key SQL Analyses:

* 🔍 Patient lab history tracking
* 📈 Average lab results by diagnosis
* ⚠️ Abnormal lab detection
* 💰 Cost analysis by diagnosis
* 👴 High-risk patient identification (Age > 65 & not recovered)
* 📊 Outcome distribution analysis

---

## 📊 Exploratory Data Analysis (EDA)

Performed using **Excel & Tableau**:

* Trend analysis of lab values
* Correlation between diagnosis & outcomes
* KPI tracking:

  * Recovery rates
  * High-risk patient count
  * Cost distribution

---

## 🤖 Machine Learning Model

### Objective:

Predict whether a patient is **High Risk or Low Risk**

### Features Used:

* Age
* Length of Stay
* Treatment Cost

### Model Workflow:

1. Data preprocessing
2. Feature engineering
3. Model training
4. Model validation
5. Model export (`risk_model.pkl`)

---

## 🧠 Risk Stratification Logic

Patients are classified based on:

* Age (elderly patients → higher risk)
* Hospital stay duration
* Treatment cost (proxy for severity)

---

## 🌐 Web Application (Streamlit)

An interactive app is built using Streamlit to make predictions.

👉 App code available here: Risk_Model.py


### Features:

* Input patient details
* Predict risk level instantly
* Show probability score

### Example Inputs:

* Age
* Length of Stay
* Treatment Cost

### Output:

* High Risk / Low Risk classification
* Risk probability

---

## ⚙️ Tech Stack

| Layer         | Tools Used                    |
| ------------- | ----------------------------- |
| Data Storage  | SQL                           |
| Data Analysis | Excel, SQL                    |
| Visualization | Tableau                       |
| ML Modeling   | Python (Pandas, Scikit-learn) |
| Deployment    | Streamlit                     |
| Model Storage | Joblib                        |

---

## 🚀 Project Workflow

### Step 1: Data Handling

* Work with large datasets
* Merge multiple tables

### Step 2: Data Exploration

* Analyze trends, correlations, KPIs

### Step 3: Model Building

* Train & validate ML models in Python

### Step 4: Deployment

* Build interactive Streamlit app

### Step 5: Scalability

* Ensure real-world applicability

---

## 📈 Key Insights Generated

* Certain diagnoses have **higher treatment costs**
* Abnormal lab results correlate with **poor outcomes**
* Elderly patients have significantly **higher risk**
* Lab trends can help monitor disease progression

---

## 🧪 Sample Use Cases

* Hospital risk prediction systems
* Clinical decision support tools
* Healthcare analytics dashboards
* Patient monitoring systems

---

## 📦 Project Structure

```
├── data/
│   ├── Patients.csv
│   ├── Diagnosis.csv
│   ├── Outcomes.csv
│   ├── Labs.csv
│
├── sql/
│   ├── Data_Extraction.sql
│
├── notebooks/
│   ├── Risk_Model.ipynb
│
├── app/
│   ├── Risk_Model.py
│   ├── risk_model.pkl
│
├── visualization/
│   ├── Tableau Dashboard.twbx
│
├── README.md
```
