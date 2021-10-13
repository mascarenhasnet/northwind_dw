with source as (
    select
        /* Primary Key */
        order_id

        /* Foreign Key */
        , customer_id
        , employee_id
        , ship_via as shipper_id

        /* Entity attributes */
        , order_date
        , required_date
        , shipped_date
        , ship_name
        , ship_country
        , ship_region
        , ship_city
        , ship_address
        , ship_postal_code
        , freight

        /* Stitch columns */
        , _sdc_table_version
        , _sdc_sequence
        , _sdc_received_at
        , _sdc_batched_at

    from {{ source('northwind_etl', 'orders') }}
)
select * from source
