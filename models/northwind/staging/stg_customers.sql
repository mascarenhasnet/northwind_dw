with source as (
    select
        /* Primary Key */
        customer_id
        
        /* Entity attributes */
        , company_name
        , contact_name
        , contact_title
        , country
        , region
        , city
        , address
        , postal_code
        , phone
        , fax
        
        /* Stitch columns */
        , _sdc_table_version
        , _sdc_sequence
        , _sdc_received_at
        , _sdc_batched_at

    from {{ source('northwind_etl', 'customers') }}
)
select * from source