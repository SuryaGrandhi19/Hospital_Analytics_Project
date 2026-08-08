CREATE DATABASE hospital_analytics;
SHOW DATABASES;
USE hospital_analytics;
SELECT DATABASE();
CREATE TABLE hospital_records (
    name VARCHAR(100),
    age INT,
    gender VARCHAR(20),
    blood_type VARCHAR(10),
    medical_condition VARCHAR(100),
    date_of_admission DATE,
    doctor VARCHAR(150),
    hospital VARCHAR(150),
    insurance_provider VARCHAR(100),
    billing_amount DECIMAL(12,2),
    room_number INT,
    admission_type VARCHAR(50),
    discharge_date DATE,
    medication VARCHAR(100),
    test_results VARCHAR(100),
    length_of_stay INT,
    age_group VARCHAR(20),
    admission_year INT,
    admission_month INT,
    admission_month_name VARCHAR(20)
);

SHOW TABLES;
DESCRIBE hospital_records;
SELECT COUNT(*) AS total_records
FROM hospital_records;

SELECT *
FROM hospital_records
LIMIT 10;

DESCRIBE hospital_records;

SELECT
    COUNT(*) AS total_records,
    SUM(patient_name IS NULL) AS missing_patient_name,
    SUM(age IS NULL) AS missing_age,
    SUM(gender IS NULL) AS missing_gender,
    SUM(medical_condition IS NULL) AS missing_condition,
    SUM(billing_amount IS NULL) AS missing_billing,
    SUM(date_of_admission IS NULL) AS missing_admission_date,
    SUM(discharge_date IS NULL) AS missing_discharge_date
FROM hospital_records;

SELECT COUNT(*) AS total_patients
FROM hospital_records;

SELECT ROUND(AVG(age), 2) AS average_age
FROM hospital_records;


SELECT ROUND(SUM(billing_amount), 2) AS total_revenue
FROM hospital_records;

SELECT ROUND(AVG(billing_amount), 2) AS average_billing
FROM hospital_records;

SELECT ROUND(AVG(length_of_stay), 2) AS average_length_of_stay
FROM hospital_records;

SELECT
    gender,
    COUNT(*) AS patient_count
FROM hospital_records
GROUP BY gender
ORDER BY patient_count DESC;

SELECT
    age_group,
    COUNT(*) AS patient_count
FROM hospital_records
GROUP BY age_group
ORDER BY patient_count DESC;


SELECT
    blood_type,
    COUNT(*) AS patient_count
FROM hospital_records
GROUP BY blood_type
ORDER BY patient_count DESC;


SELECT
    medical_condition,
    COUNT(*) AS patient_count
FROM hospital_records
GROUP BY medical_condition
ORDER BY patient_count DESC;



SELECT
    medical_condition,
    COUNT(*) AS patients,
    ROUND(AVG(billing_amount), 2) AS average_billing
FROM hospital_records
GROUP BY medical_condition
ORDER BY average_billing DESC;


SELECT
    medical_condition,
    ROUND(SUM(billing_amount), 2) AS total_revenue
FROM hospital_records
GROUP BY medical_condition
ORDER BY total_revenue DESC;

SELECT
    admission_type,
    COUNT(*) AS admissions
FROM hospital_records
GROUP BY admission_type
ORDER BY admissions DESC;

SELECT
    admission_year,
    COUNT(*) AS admissions
FROM hospital_records
GROUP BY admission_year
ORDER BY admission_year;

SELECT
    admission_month,
    admission_month_name,
    COUNT(*) AS admissions
FROM hospital_records
GROUP BY admission_month, admission_month_name
ORDER BY admission_month;

SELECT
    hospital,
    COUNT(*) AS patient_count
FROM hospital_records
GROUP BY hospital
ORDER BY patient_count DESC
LIMIT 10;

SELECT
    hospital,
    ROUND(SUM(billing_amount), 2) AS revenue
FROM hospital_records
GROUP BY hospital
ORDER BY revenue DESC
LIMIT 10;


SELECT
    hospital,
    ROUND(AVG(billing_amount), 2) AS average_billing
FROM hospital_records
GROUP BY hospital
ORDER BY average_billing DESC
LIMIT 10;


SELECT
    hospital,
    ROUND(AVG(billing_amount), 2) AS average_billing
FROM hospital_records
GROUP BY hospital
ORDER BY average_billing DESC
LIMIT 10;

SELECT
    insurance_provider,
    COUNT(*) AS patients
FROM hospital_records
GROUP BY insurance_provider
ORDER BY patients DESC;


SELECT
    insurance_provider,
    ROUND(SUM(billing_amount), 2) AS total_revenue
FROM hospital_records
GROUP BY insurance_provider
ORDER BY total_revenue DESC;


SELECT
    doctor,
    COUNT(*) AS patient_count
FROM hospital_records
GROUP BY doctor
ORDER BY patient_count DESC
LIMIT 10;


SELECT
    doctor,
    COUNT(*) AS patients,
    ROUND(AVG(billing_amount), 2) AS average_billing
FROM hospital_records
GROUP BY doctor
ORDER BY average_billing DESC
LIMIT 10;

SELECT
    medical_condition,
    ROUND(AVG(length_of_stay), 2) AS avg_length_of_stay
FROM hospital_records
GROUP BY medical_condition
ORDER BY avg_length_of_stay DESC;

SELECT
    admission_type,
    ROUND(AVG(length_of_stay), 2) AS avg_length_of_stay
FROM hospital_records
GROUP BY admission_type
ORDER BY avg_length_of_stay DESC;

SELECT
    patient_name,
    medical_condition,
    hospital,
    billing_amount
FROM hospital_records
ORDER BY billing_amount DESC
LIMIT 10;


SELECT
    patient_name,
    hospital,
    medical_condition,
    length_of_stay
FROM hospital_records
ORDER BY length_of_stay DESC
LIMIT 10;

SELECT
    medical_condition,
    SUM(billing_amount) AS total_revenue
FROM hospital_records
GROUP BY medical_condition
ORDER BY total_revenue DESC
LIMIT 1;

SELECT
    hospital,
    SUM(billing_amount) AS total_revenue
FROM hospital_records
GROUP BY hospital
ORDER BY total_revenue DESC
LIMIT 1;