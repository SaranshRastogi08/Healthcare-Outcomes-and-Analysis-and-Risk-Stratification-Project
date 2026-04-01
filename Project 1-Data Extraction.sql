-- CREATE DATABASE

CREATE DATABASE Health_Care;
USE Health_Care;

-- CREATE TABLES AND IMPORT THE DATA FROM CSV FILE

CREATE TABLE Diagnosis (
DiagnosisID  INT PRIMARY KEY,
DiagnosisName VARCHAR(255));

CREATE TABLE Outcomes (
OutcomeID  INT PRIMARY KEY,
OutcomeName VARCHAR(255));

CREATE TABLE Patients (
PatientID  INT PRIMARY KEY,
Name VARCHAR(255),
Age INT,
Gender CHAR(1),
DiagnosisID	INT,
AdmissionDate DATE,
DischargeDate DATE,
OutcomeID INT,
TreatmentCost DECIMAL(10,2),
FOREIGN KEY (DiagnosisID) REFERENCES Diagnosis(DiagnosisID),
FOREIGN KEY (OutcomeID) REFERENCES Outcomes(OutcomeID));

CREATE TABLE Labs(
LabID INT PRIMARY KEY,
PatientID INT,
TestName VARCHAR(255),
Result DECIMAL(10,2),
NormalRange VARCHAR(255),
FOREIGN KEY (PatientID) REFERENCES Patients(PatientID));

-- PREVIEW ALL THE DATA IN THE TABLES

SELECT * FROM Patients;
SELECT * FROM Diagnosis;
SELECT * FROM Labs;
SELECT * FROM Outcomes;

-- RETRIEVE DETAILED PATIENT LAB HISTORY

SELECT P.PatientID, P.Name, D.DiagnosisName, O.OutcomeName, L.TestName, L.Result, L.NormalRange
FROM Patients P
JOIN Diagnosis D ON P.DiagnosisID = D.DiagnosisID
JOIN Outcomes O ON P.OutcomeID = O.OutcomeID
JOIN Labs L ON P.PatientID = L.PatientID
ORDER BY P.PatientID, L.TestName;

-- AVERAGE LAB RESULTS BY DIAGNOSIS

SELECT D.DiagnosisName, L.TestName, AVG(L.Result) as Avg_Result
FROM Patients P
JOIN Diagnosis D ON P.DiagnosisID = D.DiagnosisID
JOIN Labs L ON P.PatientID = L.PatientID
GROUP BY D.DiagnosisName, L.TestName;

-- COUNT OF ABNORMAL LAB RESULTS

SELECT P.PatientID, P.Name, count(*) as Abnormal_Count
FROM Patients P
JOIN Labs L ON P.PatientID = L.PatientID
WHERE (L.TestName = 'Blood Sugar' and L.Result > 120) OR (L.TestName = 'Cholestrol' and L.Result >200) OR (L.TestName = 'Hemoglobin' and L.Result <13)
GROUP BY P.PatientID, P.Name
ORDER BY Abnormal_Count DESC;

-- DIAGNOSIS WITH HIGHEST TREATMENT COSTS

SELECT D.DiagnosisName, SUM(P.TreatmentCost) as Total_Cost
FROM Patients P
JOIN Diagnosis D ON P.DiagnosisID = D.DiagnosisID
GROUP BY D.DiagnosisName
ORDER BY Total_Cost DESC;

-- PATIENTS AT RISK BY AGE AND GENDER

SELECT P.PatientID, P.Name, P.Age, D.DiagnosisName, O.OutcomeName
FROM Patients P
JOIN Diagnosis D ON P.DiagnosisID = D.DiagnosisID
JOIN Outcomes O ON P.OutcomeID = O.OutcomeID
WHERE P.Age > 65 AND O.OutcomeName != 'Recovered';

-- LAB TRENDS OVER TIME FOR A SPECIFIC PATIENT

SELECT L.TestName, L.Result, P.AdmissionDate
FROM Labs L
JOIN Patients P ON L.PatientID = P.PatientID
WHERE P.PatientID IN (2,4,6,8,10,12)
ORDER BY P.AdmissionDate;

-- DISTRIBUTION OF OUTCOMES BY DIAGNOSIS

SELECT D.DiagnosisName, O.OutcomeName, COUNT(*) AS Outcome_Count
FROM Patients P
JOIN Diagnosis D ON P.DiagnosisID = D.DiagnosisID
JOIN OutcomeS O ON P.OutcomeID = O.OutcomeID
GROUP BY D.DiagnosisName, O.OutcomeName
ORDER BY D.DiagnosisName, O.OutcomeName DESC;

