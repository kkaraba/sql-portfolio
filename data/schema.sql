-- ============================================
-- ΒΑΣΗ: ecommerce_analysis
-- ΧΑΡΑΚΤΗΡΕΣ: utf8mb4
-- ============================================

-- Πίνακας customers
CREATE TABLE customers (
    customer_id VARCHAR(20) PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50),
    join_date DATE,
    customer_tier VARCHAR(20),
    credit_score INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Πίνακας products
CREATE TABLE products (
    ProductID VARCHAR(20) PRIMARY KEY,
    Όνομα_Προϊόντος VARCHAR(100),
    Κατηγορία VARCHAR(50),
    Υποκατηγορία VARCHAR(50),
    Τιμή DECIMAL(10,2),
    Κόστος DECIMAL(10,2),
    Ποσότητα_Απόθεμα INT,
    Ελάχιστο_Απόθεμα INT,
    Προμηθευτής VARCHAR(50),
    Χώρα_Προέλευσης VARCHAR(50),
    Εγγύηση_Μήνες INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Πίνακας orders
CREATE TABLE orders (
    OrderID VARCHAR(20) PRIMARY KEY,
    CustomerID VARCHAR(20),
    Ημερομηνία_Παραγγελίας DATE,
    Ημερομηνία_Αποστολής DATE,
    Κατάσταση VARCHAR(20),
    Παράδοση_Επιτυχής BOOLEAN,
    Κόστος_Αποστολής DECIMAL(10,2),
    ΦΠΑ DECIMAL(5,2),
    Σημειώσεις VARCHAR(200),
    FOREIGN KEY (CustomerID) REFERENCES customers(customer_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Πίνακας order_details
CREATE TABLE order_details (
    OrderDetailID INT PRIMARY KEY,
    OrderID VARCHAR(20),
    ProductID VARCHAR(20),
    Ποσότητα INT,
    Τιμή_Μονάδας DECIMAL(10,2),
    `Έκπτωση_%` DECIMAL(5,2),
    Επιστροφή BOOLEAN,
    Βαθμολογία INT,
    FOREIGN KEY (OrderID) REFERENCES orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES products(ProductID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;