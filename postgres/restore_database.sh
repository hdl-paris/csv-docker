#!/bin/bash

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    DROP DATABASE airkemist_development;
    DROP DATABASE airkemist_test;
    CREATE DATABASE airkemist_development;
    CREATE DATABASE airkemist_test;
    GRANT ALL PRIVILEGES ON DATABASE airkemist_development TO airkemist;
    GRANT ALL PRIVILEGES ON DATABASE airkemist_test TO airkemist;
    ALTER DATABASE airkemist_development OWNER TO airkemist;
    ALTER DATABASE airkemist_test OWNER TO airkemist;
EOSQL

pg_restore --no-acl --no-owner --clean --dbname airkemist_development -U airkemist /tmp/airkemist_last.dump
