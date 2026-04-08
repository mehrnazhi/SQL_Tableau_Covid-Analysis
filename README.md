# 📊 COVID-19 Data Exploration: A Deep Dive into Global Trends

## 📝 Project Overview
In this project, I performed an extensive data exploration of the global COVID-19 dataset (Source: *Our World in Data*). Using **SQL Server**, I analyzed daily infection rates, death percentages, and the global rollout of vaccinations to uncover meaningful insights into the pandemic's progression.

---

## 🚀 Key SQL Skills & Techniques
* **Data Transformation:** Converting LOB (Large Object) types to numeric for advanced calculations.
* **Window Functions:** Implementing `PARTITION BY` and `ORDER BY` with specific `ROWS` framing to calculate rolling totals.
* **Advanced Joins:** Connecting vaccination and death datasets for comparative analysis.
* **CTEs & Temp Tables:** Structuring complex logic for better readability and performance.
* **Data Persistence:** Creating **Views** to store cleaned data for future visualization.

---

## 🛠 Technical Challenges & Solutions

During this project, I encountered and solved several real-world database issues that made the analysis more robust:

### 1. Handling LOB Type Errors (Msg 8728)
**Challenge:** When calculating rolling vaccination totals, SQL Server threw an error because the imported data was stored as `nvarchar(max)`. 
**Solution:** I solved this by casting the data to `bigint` and explicitly defining the window frame using `ROWS UNBOUNDED PRECEDING`. This ensured the calculation worked accurately across millions of rows.

### 2. Division by Zero & Integer Truncation
**Challenge:** Calculating death percentages often resulted in zeros due to integer division or null values in early pandemic days.
**Solution:** I implemented `CAST(column AS float)` and `NULLIF` logic to ensure precision and prevent calculation crashes.

### 3. Database Context & Object Errors
**Challenge:** Encountering "Invalid Object Name" errors due to database schema and batch start issues.
**Solution:** I optimized the script execution by using proper `USE [Database]` statements and `GO` batch separators for `CREATE VIEW` commands.

## 🖼️ Data Visualization (Tableau)
After cleaning and structuring the data in SQL, I connected the final **Views** to Tableau to create an interactive dashboard. 

### Key Dashboard Features:
* **Infection Map:** A geographic heat map showing COVID-19 spread intensity.
* **Vaccination vs. Population Trend:** A dual-axis chart comparing vaccination rollout speed against population size.
* **Death Rate Forecasting:** Visualizing the mortality trends across different continents.

> [!TIP]
> **View the Interactive Dashboard here:** [؟؟]
---

## 🔍 Featured Queries
* **Death Percentage:** Likelihood of dying if infected in a specific country.
* **Infection Rate:** Percentage of the population that contracted COVID-19.
* **Cumulative Vaccinations:** Tracking vaccination velocity by country using running totals.
* **Pop vs Vax:** Using **CTEs** and **Temp Tables** to calculate vaccination coverage.

---

## 📂 Project Structure
* `Covid_Analysis.sql`: The full SQL script containing the complete workflow.
* `Data/`: Reference to the global dataset used.

---

## 💡 Key Takeaway
This project demonstrates the ability to **troubleshoot complex database errors**, optimize data types, and prepare raw datasets for professional-grade business intelligence. It reflects a transition from following a tutorial to implementing real-world technical fixes.

---

### 📬 Connect with me
* **LinkedIn:** [Mehrnaz Hosseini](https://www.linkedin.com/in/mehrnaz-hosseini-1248a5214/)
* **Email:** [mehrnaz.hosseini7596@gmail.com]
