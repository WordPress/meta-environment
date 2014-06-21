<?php
/**
 * If a custom dashboard file exists, load that instead of the default
 * dashboard provided by Varying Vagrant Vagrants. This file should be
 * located in the `www/default/` directory.
 */
if ( file_exists( 'dashboard-custom.php' ) ) {
	include( 'dashboard-custom.php' );
	exit;
}

// Begin default dashboard.
?>
<!DOCTYPE html>
<html>
<head>
	<title>WordPress Meta Environment Dashboard</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<h3>Meta Sites</h3>
<ul class="nav">
	<li><a href="http://wordcamp.dev">wordcamp.dev</a></li>
</ul>

<h3>Tools and Resources</h3>
<ul class="nav">
	<li><a href="phpinfo/">PHP Info</a></li>
	<li><a href="database-admin/">phpMyAdmin</a></li>
	<li><a href="memcached-admin/">phpMemcachedAdmin</a></li>
	<li><a href="opcache-status/opcache.php">Opcache Status</a></li>
	<li><a href="webgrind/">Webgrind</a></li>
	<li><a href="https://github.com/iandunn/wordpress-meta-environment/">WordPress Meta Environment</a></li>
</ul>

</body>
</html>
