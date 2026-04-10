# 📊 COVID-19 Data Exploration: A Deep Dive into Global Trends

## 📝 Project Overview
In this project, I performed an extensive data exploration of the global COVID-19 dataset (Source: **Our World in Data**). Using **SQL Server**, I analyzed daily infection rates, death percentages, and the global rollout of vaccinations to uncover meaningful insights into the pandemic's progression.

The final results were visualized in an interactive dashboard to provide a clear view of global impacts and vaccination velocity.

---

## 🚀 Key SQL Skills & Techniques
* **Data Transformation:** Converting LOB (Large Object) types and using `CAST`/`CONVERT` for advanced calculations.
* **Window Functions:** Implementing `PARTITION BY` and `ORDER BY` with specific `ROWS` framing to calculate rolling totals.
* **Advanced Joins:** Connecting vaccination and death datasets for comparative analysis.
* **CTEs & Temp Tables:** Structuring complex logic for better readability and performance.
* **Data Persistence:** Creating **Views** to store cleaned data for seamless visualization in Tableau.

---

## 🛠 Technical Challenges & Solutions
During this project, I encountered and solved several real-world database issues:

1. **Handling LOB Type Errors (Msg 8728)**
   * *Challenge:* SQL Server threw errors during rolling totals because the data was imported as `nvarchar(max)`.
   * *Solution:* Cast data to `bigint` and explicitly defined the window frame using `ROWS UNBOUNDED PRECEDING`.

2. **Division by Zero & Precision**
   * *Challenge:* Early pandemic days with nulls or zeros caused calculation crashes.
   * *Solution:* Used `NULLIF` and `CAST(column AS float)` to ensure mathematical precision and prevent errors.

3. **Schema & Batch Management**
   * *Challenge:* Encountering "Object already exists" or batch start errors for Views.
   * *Solution:* Optimized scripts using `CREATE OR ALTER VIEW` and proper `GO` batch separators.

---

## 🖼️ Data Visualization (Tableau)
After cleaning and structuring the data in SQL, I connected the final views to Tableau to create an interactive dashboard.

### **Key Dashboard Features:**
* **Infection Map:** A geographic heat map showing COVID-19 spread intensity.
* **Vaccination vs. Population Trend:** A dual-axis chart comparing vaccination rollout speed.
* **Death Rate Analysis:** Visualizing mortality trends across different continents.

> 🔗 **[View the Interactive Dashboard on Tableau Public](https://public.tableau.com/app/profile/mehrnaz.hosseini/viz/CovidDashboard_17126620546120/Dashboard1)**

---

## 📂 Project Structure
* `SQLQuery_1.sql`: Main data exploration script (Infections & Deaths).
* `SQLQuery_2.sql`: Vaccination analysis and View creation for Tableau.
* `Visual.twb`: Tableau Workbook file.
* `README.md`: Project documentation.

---

## 💡 Key Takeaway
This project reflects a transition from following basic tutorials to implementing **real-world technical fixes**. It demonstrates the ability to troubleshoot complex database errors, optimize data types, and prepare raw datasets for professional-grade business intelligence.

---

## 📬 Connect with me
* **Name:** Mehrnaz Hosseini
* **LinkedIn:** [Your LinkedIn Profile Link]
* **Email:** [mehrnaz.hosseini7596@gmail.com](mailto:mehrnaz.hosseini7596@gmail.com)
* **GitHub:** [mehrnazhi](https://github.com/mehrnazhi)

---

## 💡 Key Takeaway
This project demonstrates the ability to **troubleshoot complex database errors**, optimize data types, and prepare raw datasets for professional-grade business intelligence. It reflects a transition from following a tutorial to implementing real-world technical fixes.

---

### 📬 Connect with me
* **LinkedIn:** [Mehrnaz Hosseini](https://www.linkedin.com/in/mehrnaz-hosseini-1248a5214/)
* **Email:** [mehrnaz.hosseini7596@gmail.com]
