
WITH sales AS (

    SELECT 
        sales_id,
        product_sk,
        customer_sk,
        {{multiply ('unit_price','quantity')}} AS calculated_price,
        gross_amount,
        payment_method
    FROM 
        {{ ref('bronze_sales')}}
),

products AS (

    SELECT 
        product_sk,
        category,
        supplier_sk

    FROM 
        {{ ref('bronze_product')}}
),
customers AS (

    SELECT 
        customer_sk,
        gender
    FROM
        {{ ref('bronze_customer')}}
)
,

full_data AS (

SELECT 
    * 
FROM 
   sales
JOIN 
    products ON sales.product_sk = products.product_sk
JOIN 
    customers ON customers.customer_sk = sales.customer_sk
)

SELECT 
   category, gender ,  SUM(gross_amount) AS Total_Sales
FROM full_data


GROUP BY category,gender 
ORDER BY SUM(gross_amount) DESC
