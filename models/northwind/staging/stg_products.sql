with source as (
    select
        /* Primary Key */
        product_id

        /* Foreign Key */
        , supplier_id	
        , category_id	

        /* Entity attributes */
        , product_name	
        , unit_price	
        , units_in_stock	
        , units_on_order	
        , quantity_per_unit	
        , case
            when discontinued = 1 then True
            else False
          end as is_discontinued
        , reorder_level	
       
        /* Stitch columns */
        , _sdc_table_version
        , _sdc_sequence
        , _sdc_received_at
        , _sdc_batched_at

    from {{ source('northwind_etl', 'products') }}
)
select * from source
