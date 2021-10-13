with stage_selected as (
    select
        customer_id
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
        
    from {{ ref('stg_customers') }}
),
transformed as (
    select 
        row_number() over (order by customer_id) as customer_sk
        , *
    from stage_selected
)
select * from transformed