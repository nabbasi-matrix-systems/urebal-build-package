DROP TABLE IF EXISTS users cascade;

CREATE TABLE IF NOT EXISTS users(
    user_id SERIAL,
    username VARCHAR(255),
    password VARCHAR(255),
    is_active BOOLEAN DEFAULT true,
    PRIMARY KEY (user_id)
);

INSERT INTO users (username, password) VALUES ('nabbasi', 'x');

DROP TABLE IF EXISTS warehouses cascade;

CREATE TABLE IF NOT EXISTS warehouses (
    warehouse_id SERIAL,
    warehouse_name VARCHAR(255),
    PRIMARY KEY (warehouse_id)
);

INSERT INTO warehouses (warehouse_name) VALUES ('github actions');

DROP TABLE IF EXISTS companies cascade;

CREATE TABLE IF NOT EXISTS companies (
    company_id SERIAL,
    company_name VARCHAR(255),
    warehouse_id INTEGER ,
    PRIMARY KEY (company_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses (warehouse_id)
);

INSERT INTO companies (company_name, warehouse_id) VALUES ('github - 1', 1);
INSERT INTO companies (company_name, warehouse_id) VALUES ('github - 2', 1);
INSERT INTO companies (company_name, warehouse_id) VALUES ('github - 3', 1);
INSERT INTO companies (company_name, warehouse_id) VALUES ('github - 4', 1);
