CREATE ROLE romsample WITH LOGIN PASSWORD 'romsample' CREATEDB;

CREATE DATABASE romsample_dev;
GRANT ALL PRIVILEGES ON DATABASE "romsample_dev" to romsample;
