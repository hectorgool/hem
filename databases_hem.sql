-- psql -f databases_hem.sql
DROP DATABASE IF EXISTS "hem_development";
DROP DATABASE IF EXISTS "hem_test";
DROP DATABASE IF EXISTS "hem_production";

CREATE DATABASE "hem_development" WITH ENCODING 'UTF8';
CREATE DATABASE "hem_test" WITH ENCODING 'UTF8';
CREATE DATABASE "hem_production" WITH ENCODING 'UTF8';

DROP USER "santo";
CREATE USER "santo" WITH PASSWORD 'asdfasdf';
ALTER USER "santo" WITH SUPERUSER;

GRANT ALL PRIVILEGES ON DATABASE "hem_development" TO santo;
GRANT ALL PRIVILEGES ON DATABASE "hem_test" TO santo;
GRANT ALL PRIVILEGES ON DATABASE "hem_production" TO santo;

ALTER DATABASE "hem_development" OWNER TO santo;
ALTER DATABASE "hem_test" OWNER TO santo;
ALTER DATABASE "hem_production" OWNER TO santo;

ALTER USER santo CREATEDB;

