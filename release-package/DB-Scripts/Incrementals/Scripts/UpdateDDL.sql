DROP TABLE IF EXISTS users cascade;

CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL,
    username VARCHAR(255),
    password VARCHAR(255),
    is_active BOOLEAN DEFAULT true,
    PRIMARY KEY (user_id)
);

DROP TABLE IF EXISTS warehouses cascade;

CREATE TABLE IF NOT EXISTS warehouses (
    warehouse_id SERIAL,
    warehouse_name VARCHAR(255),
    PRIMARY KEY (warehouse_id)
);

DROP TABLE IF EXISTS companies cascade;

CREATE TABLE IF NOT EXISTS companies (
    company_id SERIAL,
    company_name VARCHAR(255),
    warehouse_id INTEGER ,
    PRIMARY KEY (company_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses (warehouse_id)
);
