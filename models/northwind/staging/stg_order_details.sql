with source as (
    select
        /* Primary Key */
        order_id
        , product_id

        /* Entity attributes */
        , quantity
        , unit_price
        , discount

        /* Stitch columns */
        , _sdc_table_version
        , _sdc_sequence
        , _sdc_received_at
        , _sdc_batched_at
                     
    from {{ source('northwind_etl', 'order_details') }}
)
select * from source