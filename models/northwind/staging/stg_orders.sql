with source_data as (
    select
    order_id
        , ship_region
        , shipped_date
        , ship_country
        , ship_name
        , employee_id
        , order_date
        , customer_id
        , ship_postal_code
        , ship_city
        , freight
        , ship_via
        , required_date
        , ship_address
    from {{ source('northwind_etl', 'orders') }}
)
select * from source_data
