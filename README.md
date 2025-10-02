# Heart Disease Risk Prediction with SAS

This repository contains a comprehensive project for predicting heart disease risk using SAS, including well-organized SAS code, a clean dataset, a technical report, and supporting documentation. The project is designed for both data science students and healthcare analysts interested in understanding clinical risk factors and applying statistical modeling with SAS.

---

## Table of Contents

- [Project Overview](#project-overview)
- [Files and Structure](#files-and-structure)
- [Dataset Description](#dataset-description)
- [SAS Code Highlights](#sas-code-highlights)
- [How to Run](#how-to-run)
- [Results & Outputs](#results--outputs)

---

## Project Overview

**Heart disease** is one of the leading causes of death globally. Early prediction is crucial for prevention and effective treatment. This project leverages the popular UCI Heart Disease dataset, applying data cleaning, exploration, feature engineering, and predictive modeling in SAS.

**Objectives:**
- Import and preprocess heart disease patient data
- Explore and visualize risk factors
- Engineer features and create meaningful groupings
- Build and interpret descriptive statistics and frequency tables
- Visualize data distributions and relationships
- Document findings in a technical report

---

## Files and Structure

| File | Description |
|------|-------------|
| `heart_disease_uci.csv` | Main dataset, containing patient records and attributes |
| `Chintham Reddy_SAScode.sas` | Full SAS code for data import, cleaning, exploration, feature engineering, and visualization |
| `Chintham Reddy_Report.pdf` | Technical report summarizing methodology, analysis, and results |
| `Chintham Reddy_PartA.docx` | Additional documentation or assignment part (see report for details) |
| `README.md` | Project overview and instructions |

---

## Dataset Description

The dataset is sourced from the UCI Heart Disease repository and includes the following key columns:

- `id`: Unique identifier for each patient
- `age`: Age of the patient
- `sex`: Gender ("Male"/"Female")
- `cp`: Chest pain type (typical angina, atypical angina, non-anginal, asymptomatic)
- `trestbps`: Resting blood pressure (mm Hg)
- `chol`: Serum cholesterol (mg/dL)
- `fbs`: Fasting blood sugar > 120 mg/dL (TRUE/FALSE)
- `restecg`: Resting ECG results
- `thalch`: Maximum heart rate achieved
- `exang`: Exercise-induced angina (TRUE/FALSE)
- `oldpeak`: ST depression induced by exercise
- `slope`: Slope of peak ST segment
- `ca`: Number of major vessels colored by fluoroscopy
- `thal`: Thalassemia test results
- `num`: Target variable (0: no disease, 1-4: increasing disease risk)

Missing values are represented as blank entries.

---

## SAS Code Highlights

The SAS script covers:

- **Data Import:** Use of `PROC IMPORT` and permanent libraries
- **Data Cleaning:** Handling missing values, data types, and irrelevant attributes
- **Exploration:** `PROC CONTENTS`, summary statistics, and variable labeling
- **Feature Engineering:** Age grouping, categorical variable formatting, creation of new variables
- **Frequency Tables:** Categorical analysis using `PROC FREQ`
- **Quantitative Analysis:** Descriptive statistics (`PROC MEANS`)
- **Additional SAS Functions:** Examples include column totals, merging datasets, string manipulation, and macro variables
- **Visualization:** Scatter plots, histograms, and distribution analysis with `PROC SGPLOT`

See [`Chintham Reddy_SAScode.sas`](https://github.com/AdityaX0820/Heart-Disease-Risk-Prediction-SAS/blob/main/Chintham%20Reddy_SAScode.sas) for complete, well-commented code.

---

## How to Run

1. **Requirements:**  
   - SAS Software (University Edition or SAS OnDemand recommended)
   - Download or clone this repository

2. **Setup:**  
   - Place all files in a working directory accessible by SAS
   - Adjust file paths in SAS code as needed for your environment

3. **Execution:**  
   - Open `Chintham Reddy_SAScode.sas` in the SAS editor
   - Run the script step by step or all at once, as per comments
   - Review logs and output tables, graphs, and datasets

4. **Review Results:**  
   - Consult the generated tables and graphs for insights
   - Read the report for detailed analysis and interpretation

---

## Results & Outputs

- **Cleaned and labeled datasets saved in SAS library**
- **Summary statistics** on age, cholesterol, blood pressure, etc.
- **Frequency tables** exploring categorical relationships
- **Subsets and engineered variables** for deeper analysis
- **Visualizations**: Age vs. max heart rate scatter plot, cholesterol histogram, etc.
- **Technical report** interpreting findings and methodology

---

