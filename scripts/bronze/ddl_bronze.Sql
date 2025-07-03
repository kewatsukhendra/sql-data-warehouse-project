CREATE SCHEMA IF NOT EXISTS bronze;



CREATE TABLE bronze.crm_cust_info (
    cst_id INT PRIMARY KEY,
    cst_key VARCHAR(20),
    cst_firstname VARCHAR(50),
    cst_lastname VARCHAR(50),
    cst_marital_status CHAR(1), -- M = Married, S = Single
    cst_gndr CHAR(1),           -- M = Male, F = Female
    cst_create_date DATE
);


CREATE TABLE bronze.crm_prd_info (
    prd_id       INT,
    prd_key      VARCHAR(50),
    prd_nm       VARCHAR(50),
    prd_cost     INT,
    prd_line     VARCHAR(50),
    prd_start_dt TIMESTAMP,
    prd_end_dt   TIMESTAMP
);


CREATE TABLE bronze.crm_sales_details (
    sls_ord_num  VARCHAR(50),
    sls_prd_key  VARCHAR(50),
    sls_cust_id  INT,
    sls_order_dt DATE,
    sls_ship_dt  DATE,
    sls_due_dt   DATE,
    sls_sales    INT,
    sls_quantity INT,
    sls_price    INT
);



CREATE TABLE bronze.erp_loc_a101 (
    cid   VARCHAR(50),
    cntry VARCHAR(50)
);


CREATE TABLE bronze.erp_cust_az12 (
    cid   VARCHAR(50),
    bdate DATE,
    gen   VARCHAR(50)
);


CREATE TABLE bronze.erp_px_cat_glv2 (
    id          VARCHAR(50),
    cat         VARCHAR(50),
    subcat      VARCHAR(50),
    maintenance VARCHAR(50)
);

DELETE FROM bronze.crm_cust_info WHERE cst_id IS NULL;

COPY bronze.crm_cust_info FROM 'D:/Sql_Project_with_Baraa/sql-data-warehouse-project/sql-data-warehouse-project/datasets/source_crm/cust_info.csv'
DELIMITER ',' CSV HEADER;
SELECT * from bronze.crm_cust_info; 

COPY bronze.crm_prd_info FROM 'D:/Sql_Project_with_Baraa/sql-data-warehouse-project/
sql-data-warehouse-project/datasets/source_crm/prd_info.csv'
DELIMITER ',' CSV HEADER;

COPY bronze.crm_sales_details FROM 'D:/Sql_Project_with_Baraa/sql-data-warehouse-project/
sql-data-warehouse-project/datasets/source_crm/sales_details.csv'
DELIMITER ',' CSV HEADER;
