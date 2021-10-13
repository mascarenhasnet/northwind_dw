with stage_selected as (    
    select
        product_id
        , supplier_id	
        , category_id	
        , product_name	
        , unit_price	
        , units_in_stock	
        , units_on_order	
        , quantity_per_unit	
        , is_discontinued
        , reorder_level	

    from {{ ref('stg_products') }}
),
transformed as (
    select 
        row_number() over (order by product_id) as product_sk
        , *
    from stage_selected
)
select * from transformed