CREATE ROLE romsample WITH LOGIN PASSWORD 'romsample' CREATEDB;

CREATE DATABASE romsample_dev;
CREATE DATABASE romsample_test;

GRANT ALL PRIVILEGES ON DATABASE "romsample_dev" to romsample;
GRANT ALL PRIVILEGES ON DATABASE "romsample_test" to romsample;
