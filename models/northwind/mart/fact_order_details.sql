with
    customers as (
        select *
        from {{ ref('dim_customers') }}
    )
    , shippers as (
        select *
        from {{ ref('dim_shippers') }}
    )
    , suppliers as (
        select *
        from {{ ref('dim_suppliers') }}
    )
    , products as (
        select *
        from {{ ref('dim_products') }}
    )
    , orders_with_sk as (
        select 
            orders.order_id
            , customers.customer_sk as customer_fk
            , shippers.shipper_sk as shipper_fk
            , orders.order_date
            , orders.required_date
            , orders.shipped_date
            , orders.ship_name
            , orders.ship_country
            , orders.ship_region
            , orders.ship_city
            , orders.ship_address
            , orders.ship_postal_code
            , orders.freight
        from {{ ref('stg_orders') }} as orders
        left join customers on orders.customer_id = customers.customer_id
        left join shippers on orders.shipper_id = shippers.shipper_id
    )
    , order_details_with_sk as (
        select
            order_id
            , product_sk as product_fk
            , supplier_sk as supplier_fk
            , quantity
            , order_details.unit_price
            , discount
        from {{ ref('stg_order_details') }} as order_details
        left join products on order_details.product_id = products.product_id
        left join suppliers on products.supplier_id = suppliers.supplier_id
    )
    , final as (
        select
            order_details_with_sk.order_id
            , orders_with_sk.customer_fk
            , orders_with_sk.shipper_fk
            , orders_with_sk.order_date
            , orders_with_sk.required_date
            , orders_with_sk.shipped_date
            , orders_with_sk.ship_name
            , orders_with_sk.ship_country
            , orders_with_sk.ship_region
            , orders_with_sk.ship_city
            , orders_with_sk.ship_address
            , orders_with_sk.ship_postal_code
            , orders_with_sk.freight
            , order_details_with_sk.product_fk
            , order_details_with_sk.supplier_fk
            , order_details_with_sk.quantity
            , order_details_with_sk.unit_price
            , order_details_with_sk.discount
        from orders_with_sk
        left join order_details_with_sk on orders_with_sk.order_id = order_details_with_sk.order_id
    )
select * from final