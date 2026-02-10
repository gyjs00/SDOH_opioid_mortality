# County-Level Socioeconomic Factors and Drug Overdose Mortality

## Project Overview
This project analyzes how county-level socioeconomic conditions are associated with drug overdose mortality rates across the United States. Using publicly available Social Determinants of Health (SDOH) data, the analysis explores patterns between overdose deaths and income distribution, unemployment, insurance coverage, and mental health provider availability.

The goal of this project is **descriptive, not causal**: to provide a clear, data-driven picture of how overdose mortality is distributed across counties with different economic and institutional characteristics.

---

## Dataset
- **Source:** Agency for Healthcare Research and Quality (AHRQ)
- **Dataset:** 2020 Social Determinants of Health (SDOH) County-Level Data
- **Observations:** ~2,200 U.S. counties
- **Key variables:**
  - Drug overdose death rate per 100,000 residents
  - Household income shares across six income bands
  - Unemployment rate
  - Uninsured population rate
  - Mental health providers per 100,000 residents

---

## Methods
- Data cleaning and preprocessing (handling missing values, type conversions)
- Exploratory data analysis (distributions, scatterplots)
- Multivariate linear regression modeling
- Robust standard errors to address geographic clustering
- Model diagnostics and assumption checks (collinearity, residual analysis)

Two models were evaluated:
1. **Base model:** Income share variables only  
2. **Expanded model:** Income shares plus unemployment, uninsured rate, and mental health provider density

---

## Key Findings
- Counties with higher shares of **middle- and high-income households** tend to have **lower overdose death rates**.
- Higher **unemployment rates** are associated with higher overdose mortality.
- The expanded model explains substantially more variance than income alone, highlighting the importance of institutional and economic context.
- Mental health provider density shows statistical significance but a **negligible practical effect size**.
- Overall explanatory power remains modest, reflecting the complexity of overdose risk and reinforcing the need for cautious interpretation.

---

## Results
- Expanded model achieved an **R² of ~0.13**, improving significantly over the income-only model.
- Regression coefficients were interpreted with emphasis on magnitude and real-world relevance, not just statistical significance.
- Results emphasize **uneven geographic and socioeconomic concentration** of overdose mortality rather than definitive causal mechanisms.

---

## Tools & Technologies
- **Language:** R
- **Libraries:** tidyverse, ggplot2, sandwich, stargazer
- **Techniques:** Linear regression, robust inference, exploratory data analysis, statistical diagnostics

---

## Next Steps
Potential extensions include:
- Incorporating spatial or hierarchical models to better address geographic dependence
- Evaluating trends across multiple years
- Expanding the feature set to include treatment access or prescribing data

---

## Author
**Grace Suh**  
Master’s in Information & Data Science (UC Berkeley)  
Background in Genetics & Health Sciences
