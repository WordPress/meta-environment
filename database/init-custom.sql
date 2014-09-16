# Any SQL files included in the database/backups directory will be
# imported as Vagrant boots up. To best manage expectations, these
# databases should be created in advance with proper user permissions
# so that any code bases configured to work with them will start
# without trouble.

DROP DATABASE IF EXISTS `test`;

CREATE DATABASE IF NOT EXISTS `wordcamp_dev`;
GRANT ALL PRIVILEGES ON `wordcamp_dev`.* TO 'wp_meta'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `apps_wordpress_dev`;
GRANT ALL PRIVILEGES ON `apps_wordpress_dev`.* TO 'wp_meta'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `developer_wordpress_dev`;
GRANT ALL PRIVILEGES ON `developer_wordpress_dev`.* TO 'wp_meta'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `jobs_wordpress_dev`;
GRANT ALL PRIVILEGES ON `jobs_wordpress_dev`.* TO 'wp_meta'@'localhost' IDENTIFIED BY 'password';

CREATE DATABASE IF NOT EXISTS `global_wordpress_dev`;
GRANT ALL PRIVILEGES ON `global_wordpress_dev`.* TO 'wp_meta'@'localhost' IDENTIFIED BY 'password';
