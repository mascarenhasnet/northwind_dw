with source as (
    select
        /* Primary Key */
        shipper_id
        
        /* Entity attributes */
        , company_name
        , phone
        
        /* Stitch columns */
        , _sdc_table_version
        , _sdc_sequence
        , _sdc_received_at
        , _sdc_batched_at

    from {{ source('northwind_etl', 'shippers') }}
)
select * from source