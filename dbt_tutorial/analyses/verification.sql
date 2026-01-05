SELECT 
        customer_sk,
        gender
    FROM
        {{ ref('bronze_customer')}}