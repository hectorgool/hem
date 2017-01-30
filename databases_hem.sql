-- psql -U postgres -h localhost -f databases_hem.sql
DROP DATABASE IF EXISTS "hem_development";
DROP DATABASE IF EXISTS "hem_test";
DROP DATABASE IF EXISTS "hem_production";

CREATE DATABASE "hem_development" WITH ENCODING 'UTF8';
CREATE DATABASE "hem_test" WITH ENCODING 'UTF8';
CREATE DATABASE "hem_production" WITH ENCODING 'UTF8';

DROP USER "hem";
CREATE USER "hem" WITH PASSWORD 'asdfasdf';
ALTER USER "hem" WITH SUPERUSER;

GRANT ALL PRIVILEGES ON DATABASE "hem_development" TO hem;
GRANT ALL PRIVILEGES ON DATABASE "hem_test" TO hem;
GRANT ALL PRIVILEGES ON DATABASE "hem_production" TO hem;

ALTER DATABASE "hem_development" OWNER TO hem;
ALTER DATABASE "hem_test" OWNER TO hem;
ALTER DATABASE "hem_production" OWNER TO hem;

ALTER USER hem CREATEDB;

