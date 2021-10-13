with stage_selected as (
    select
        supplier_id	
        , company_name	
        , contact_name	
        , contact_title	
        , country
        , region	
        , city	
        , address
        , postal_code	
        , fax	
        , phone	
        , homepage	
       
    from {{ ref('stg_suppliers') }}
),
transformed as (
    select 
        row_number() over (order by supplier_id) as supplier_sk
        , *
    from stage_selected
)
select * from transformed