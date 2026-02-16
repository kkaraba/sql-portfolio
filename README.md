# SQL Portfolio


## 📖 Περιγραφή
Μια συλλογή από SQL queries που καλύπτουν βασικές και προχωρημένες τεχνικές ανάλυσης δεδομένων. Τα queries έχουν γραφτεί και εκτελεστεί σε MySQL Workbench, χρησιμοποιώντας ένα σχήμα e-commerce με πίνακες `customers`, `orders`, `order_details` και `products`.

## 🗂️ Δομή Repository
```
sql-portfolio/
├── data/
│   └── schema.sql                # Δομή της βάσης (CREATE TABLE)
├── 01_basic_queries.sql           # SELECT, WHERE, ORDER BY, LIMIT
├── 02_joins_aggregations.sql      # INNER/LEFT JOIN, GROUP BY, HAVING
├── 03_window_functions_cte.sql    # ROW_NUMBER, RANK, CTEs
├── 04_advanced_analysis.sql       # Υποερωτήματα, correlated subqueries
├── 05_business_insights.sql       # Queries με επιχειρηματική λογική
└── results.pdf                    # Αποτελέσματα (screenshots)
```

## 📊 Περιεχόμενα

### 01_basic_queries.sql
- Top 10 πελάτες βάσει συνολικών αγορών
- Μέση βαθμολογία πίστωσης ανά χώρα
- Προϊόντα με απόθεμα < 20 τεμάχια
- Μήνας με τις υψηλότερες πωλήσεις

### 02_joins_aggregations.sql
- Αριθμός πελατών ανά επίπεδο (tier) που έχουν παραγγείλει
- Κατηγορία με το υψηλότερο περιθώριο κέρδους
- Συνολικά έσοδα ανά κατηγορία και υποκατηγορία
- Προμηθευτές με προϊόντα χαμηλού αποθέματος

### 03_window_functions_cte.sql
- Πελάτες με μέση αξία παραγγελίας > 200€ (CTE)
- Ποσοστό επαναγοράς (retention rate) ανά μήνα
- Ανάλυση ακυρωμένων παραγγελιών (high/low value)

### 04_advanced_analysis.sql
- Πελάτες που έχουν παραγγείλει σε 3+ διαφορετικούς μήνες
- Customer Lifetime Value ανά χώρα
- Συσχέτιση μεταξύ credit score και συνολικών δαπανών

### 05_business_insights.sql
- Top 5 patterns για ακυρωμένες παραγγελίες
- Επίδραση προωθητικών ενεργειών ανά κατηγορία
- Ανάλυση καλαθιού (market basket analysis)

## 🛠️ Τεχνολογίες
- **MySQL** 8.0
- **MySQL Workbench**
- Δεδομένα: e-commerce schema

## 🚀 Οδηγίες Εκτέλεσης
1. **Εγκατάστησε MySQL** (αν δεν το έχεις ήδη)
2. **Δημιούργησε τη βάση**:
   ```sql
   CREATE DATABASE ecommerce_analysis;
   USE ecommerce_analysis;
   ```
3. **Εκτέλεσε το `schema.sql`** για να δημιουργηθούν οι πίνακες
4. **Φόρτωσε τα δεδομένα** (τα αρχεία .csv παρέχονται ξεχωριστά)
5. **Εκτέλεσε τα queries** με τη σειρά που επιθυμείς

## 📌 Αποτελέσματα
Στο αρχείο `results.pdf` περιλαμβάνονται screenshots των αποτελεσμάτων για όλα τα queries, όπως εμφανίζονται στο MySQL Workbench.

## 📫 Επικοινωνία
- **GitHub**: [@kkaraba](https://github.com/kkaraba)
- **LinkedIn**: [Κωνσταντίνος Καραμπάσης](linkedin.com/in/konstantinos-karampasis-78070a73/)
- **Email**: [kkarabasis@hotmail.com](mailto:kkarabasis@hotmail.com)

