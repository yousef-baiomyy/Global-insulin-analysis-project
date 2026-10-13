# Global Metabolic Health & Insulin Resistance Analysis

## Overview
This end-to-end data analysis project investigates global metabolic health trends, focusing on insulin resistance and market-relevant patient metrics. By processing a global dataset of over 188K patients, this project establishes a scalable data pipeline to identify high-risk demographic segments and track medical KPIs across different countries.

---

## Data Pipeline & Key Learnings

### 1. Data Cleaning & Pipeline Integrity (Python & SQL)
*   **What I Did:** Cleaned, validated, and processed a raw global dataset of over 188K patients. Maintained both raw and cleaned datasets to explicitly demonstrate data transformation steps, handling missing fields, and anomalies via Python notebooks and SQL queries.
*   **The Value & Benefit:** Medical and metabolic data requires absolute precision. Preserving the raw data alongside the optimized, clean dataset proves the reliability of the entire data pipeline. This setup ensures that subsequent medical KPI calculations are completely free from analytical bias or structural errors.

### 2. Metric Calculation & Relational Modeling (SQL)
*   **What I Did:** Developed and optimized complex SQL queries to calculate core metabolic KPIs, including Total Patient Count, Average HOMA-IR, and automated flagging for High-Risk Insulin Status.
*   **The Value & Benefit:** Hardcoding business and medical logic into production-ready SQL allows the system to process massive healthcare databases efficiently. This provides clinical decision-makers with instant, aggregated calculations regarding patient risk profiles without lagging.

### 3. Advanced Geospatial & Correlation Visualization (Power BI)
*   **What I Did:** Built an interactive global dashboard utilizing a modern Dark Mode UI[cite: 2]. Key components include:
    *   **Geospatial Mapping:** Tracked the global distribution of insulin resistance across countries using conditional gradient formatting.
    *   **Correlation Analysis:** Developed advanced Scatter Charts to mathematically map the relationship between HbA1c and Fasting Insulin levels, segmented clearly by risk thresholds.
    *   **Demographic Breakdown:** Analyzed tracking trends across age groups (from Children to Elderly) and genders using Area and Column charts.
*   **The Value & Benefit:** Turning dense patient records into visual assets allows healthcare providers and product managers to instantly spot geographical hotspots and risk correlations. Segmenting by age brackets and risk tiers translates complex clinical correlations (like HbA1c vs. Insulin) into intuitive, actionable public health insights.

---

## Business & Clinical Value (Why This Analysis Matters)
*   **Targeted Healthcare Interventions:** Enables global health organizations to allocate medical resources and preventative campaigns directly to the highest-risk countries and age demographics.
*   **Pharmaceutical & Device Market Scaling:** Provides critical market metrics and demographic trends that help medical device manufacturers optimize the distribution of insulin-related products.
*   **Risk Mitigation:** Early identification of high-risk metrics (like elevated HOMA-IR) helps clinical networks design early lifestyle or therapeutic interventions, lowering long-term patient care costs.
