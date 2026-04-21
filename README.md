# Indian-air-quality-analysis

🌍 India Air Quality Analysis Dashboard

📊 Overview
This project analyzes air quality across India using real-time data from the Government of India API.  
The analysis is performed using SQL queries and visualized using Python (Matplotlib & Seaborn).

The dashboard provides insights into pollution levels, key pollutants, and city-level air quality trends.

---

🚀 Project Workflow

API Data → MySQL Database → SQL Analysis → Python Visualization

---

🛠 Tech Stack

- Python (Pandas, Matplotlib, Seaborn)
- MySQL (Database & SQL Queries)
- SQLAlchemy (Database Connection)
- PyMySQL (MySQL Connector)
---


📊 Dashboard Features

The dashboard includes 6 key visualizations:

1 Top Polluted Cities
- Identifies cities with the highest PM2.5 levels
- Helps detect major pollution hotspots

---

2 Cleanest Cities
- Shows cities with lowest pollution levels
- Useful for comparison and benchmarking

---
3 Metro vs Non-Metro Analysis
- Compares pollution levels between metro and non-metro cities
- Highlights broader pollution distribution

---

4 Pollutant Contribution
- Identifies which pollutants contribute most to air pollution
- PM2.5 and PM10 are typically dominant
---

5 High Pollution Days
- Counts number of days where pollution exceeds threshold (>150 AQI)
- Indicates health risk exposure

---

6 AQI Category Distribution
- Classifies air quality into categories:
  - Good
  - Satisfactory
  - Moderate
  - Poor
  - Severe
---

📈 Key Insights

- Non-metro cities contribute significantly to pollution levels  
- PM2.5 is the primary contributor to poor air quality  
- Several cities frequently experience high pollution levels  
- Majority of observations fall under Moderate to Poor AQI  
---
🎯 Conclusion
Air pollution in India is widespread across both metro and non-metro regions, with particulate matter being the primary contributor.
________________________________________
📌 Future Improvements
•	Add historical data for trend analysis 
•	Deploy dashboard online 
•	Add real-time API refresh
