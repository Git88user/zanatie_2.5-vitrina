SELECT
    s.shop_name,
    pr.product_name,
    ss.sales_cnt AS sales_fact,
    pl.plan_cnt AS sales_plan,
    ss.sales_cnt / pl.plan_cnt AS sales_fact/sales_plan,
    ss.sales_cnt * pr.price AS income_fact,
    pl.plan_cnt * pr.price AS income_plan,
    ss.sales_cnt * pr.price / (pl.plan_cnt * pr.price) AS income_fact/income_plan
FROM
    shop_sales AS ss 
    JOIN shops AS s ON ss.shop_id = s.shop_id
    JOIN plan AS pl ON ss.shop_id = pl.shop_id AND ss.product_id = pl.product_id
    JOIN products AS pr ON ss.product_id = pl.product_id