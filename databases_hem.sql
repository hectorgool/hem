-- mysql -u root -v < databases_hem.sql

DROP DATABASE IF EXISTS hem_development;
CREATE DATABASE hem_development CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP DATABASE IF EXISTS `hem_test`;
CREATE DATABASE hem_test CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP DATABASE IF EXISTS `hem_production`;
CREATE DATABASE hem_production CHARACTER SET utf8 COLLATE utf8_general_ci;

DROP USER 'hem'@'localhost';
GRANT ALL PRIVILEGES ON *.* to hem@localhost identified by 'asdfasdf' WITH GRANT option;
