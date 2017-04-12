#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER csv  ENCRYPTED PASSWORD 'csv' SUPERUSER;
    CREATE DATABASE csv_development;
    CREATE DATABASE csv_test;
    GRANT ALL PRIVILEGES ON DATABASE csv_development TO csv;
    GRANT ALL PRIVILEGES ON DATABASE csv_test TO csv;
    ALTER DATABASE csv_development OWNER TO csv;
    ALTER DATABASE csv_test OWNER TO csv;
EOSQL
