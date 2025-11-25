# 🛒 WALMART_PYTHON_&_SQL_PROJECT


This project provides a complete **end-to-end data analysis workflow** using **Python + SQL (MySQL & PostgreSQL)** on Walmart's sales dataset. It includes **data cleaning, feature engineering, SQL analytics, business insights**, and full pipeline documentation — perfect for Data Analyst portfolios.

---

## 🌟 Project Overview
This end-to-end project analyzes Walmart sales data using a structured pipeline combining Python and SQL.  
It focuses on delivering actionable business insights such as:

- Sales and revenue trends  
- Branch & category performance  
- Customer purchasing behaviors  
- Profitability analysis  
- Time-based sales patterns  

The goal is to demonstrate strong skills in data cleaning, SQL query formulation, and full-cycle data analysis.

---

## 🎯 Project Objectives

- 🧹 Clean and preprocess Walmart sales data  
- 📦 Perform feature engineering (e.g., Total Amount)  
- 🗄 Load cleaned data into **MySQL**  
- 🧠 Solve real business problems using complex SQL  
- 📊 Identify trends in sales, profit, and customer behavior  
- 📅 Analyze peak hours, product categories, branches  
- 🔧 Build an end-to-end pipeline from data download → cleaning → SQL analysis  

---

# 🪜 Project Steps

## **1️⃣ Environment Setup**
Tools used:
- Python  
- VS Code  
- MySQL   
- Kaggle API  

---

## **2️⃣ Kaggle API Setup**
Steps:
1. Download `kaggle.json` from your Kaggle profile  
2. Place it in:  
   ```
   ~/.kaggle/
   ```
3. Download dataset:
   ```bash
   kaggle datasets download -d najir0123/walmart-10k-sales-datasets
   ```

---

## **3️⃣ Download Walmart Dataset**
Dataset Link:  
🔗 https://www.kaggle.com/najir0123/walmart-10k-sales-datasets  

Store the data under `data/` folder.

---

## **4️⃣ Install Required Libraries**
```bash
pip install pandas numpy sqlalchemy mysql-connector-python psycopg2
```

---

## **5️⃣ Exploratory Data Analysis (EDA)**
Using Pandas:
```python
df.info()
df.describe()
df.head()
```
Purpose:
- Check structure, datatypes  
- Detect missing values  
- Understand distributions  

---

## **6️⃣ Data Cleaning**
Performed:
- Removing duplicates  
- Handling missing values  
- Fixing types (dates → datetime, prices → float)  
- Currency cleanup with `.replace()`  
- Validated final cleaned dataset  

---

## **7️⃣ Feature Engineering**
Created:
### ➤ Total Amount Column
```
Total Amount = unit_price * quantity
```
Adds value for SQL revenue calculations.

---

## **8️⃣ Load Data into MySQL & PostgreSQL**
Using SQLAlchemy:
- Connected to databases  
- Automatically created tables  
- Inserted cleaned data  
- Verified using sample SQL queries  

---

## **9️⃣ SQL Analysis — Business Problem Solving**
Used SQL to solve:
- Revenue by branch and city  
- Best-selling categories  
- Peak hour sales  
- Customer rating trends  
- Payment method preferences  
- Profit margin analysis  
- Time-based performance  

---

# 👨‍💻 Author — Mohd Faaiz
📧 Email: **mohdfaaizbly@outlook.com**  
🔗 LinkedIn: **https://www.linkedin.com/in/mohd-faaiz-669730388/**    
