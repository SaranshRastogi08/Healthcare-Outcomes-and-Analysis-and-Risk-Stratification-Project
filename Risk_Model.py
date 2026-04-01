import streamlit as st
import pandas as pd
import joblib

# Load trained model (correct file)
model = joblib.load("risk_model.pkl")

st.title("Healthcare Risk Stratification App")

# Inputs
age = st.number_input("Age", min_value=0, step=1)
length_of_stay = st.number_input("Length of Stay (days)", min_value=0, step=1)
treatment_cost = st.number_input("Treatment Cost", min_value=0.0, format="%.2f")

# Prediction
if st.button("Predict"):
    input_data = pd.DataFrame(
        [[age, length_of_stay, treatment_cost]],
        columns=['Age', 'Length_of_Stay', 'TreatmentCost']
    )

    prediction = model.predict(input_data)[0]
    probability = model.predict_proba(input_data)[0][1]

    st.success(f"Risk Prediction: {'High Risk' if prediction == 1 else 'Low Risk'}")
    st.info(f"Risk Probability: {round(probability, 2)}")