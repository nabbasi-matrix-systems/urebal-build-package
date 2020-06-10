DROP VIEW IF EXISTS WAREHOUSE_COMPANIES cascade;

CREATE VIEW WAREHOUSE_COMPANIES AS
SELECT w.warehouse_id, w.warehouse_name, c.company_id, c.company_name from warehouses w
INNER JOIN companies c
ON w.warehouse_id = c.warehouse_id;
