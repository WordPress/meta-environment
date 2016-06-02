<?php
// Executed before Multisite is loaded.

// Make the Theme Directory available at /themes/ on all rosetta sites.
function wporg_themes_on_rosetta_domains( $site, $domain, $path, $segments ) {
	// All non-rosetta networks define DOMAIN_CURRENT_SITE in wp-config.php

	if ( ! defined( 'DOMAIN_CURRENT_SITE' ) && 'wordpressorg.dev' != $domain && '/themes/' == substr( $path . '/', 0, 8 ) ) {
		$site = get_blog_details( WPORG_THEME_DIRECTORY_BLOGID, false );
		if ( $site ) {
			$site = clone $site;
			// 6 = The Rosetta network, this causes the site to be loaded as part of the Rosetta network
			$site->site_id = 6;
			return $site;
		}
	}

	return $site;
}
add_filter( 'pre_get_site_by_path', 'wporg_themes_on_rosetta_domains', 10, 4 );

// Make the Plugin Directory available at /plugins/ on all rosetta sites.
function wporg_plugins_on_rosetta_domains( $site, $domain, $path, $segments ) {
	// All non-rosetta networks define DOMAIN_CURRENT_SITE in wp-config.php

	// At launch, switch these two if's around.
	//if ( ! defined( 'DOMAIN_CURRENT_SITE' ) && 'wordpressorg.dev' != $domain && '/plugins/' == substr( $path . '/', 0, 9 ) ) {
	if ( ! defined( 'DOMAIN_CURRENT_SITE' ) && 'wordpressorg.dev' != $domain && '/plugins-wp/' == substr( $path . '/', 0, 12 ) ) {
		$site = get_blog_details( WPORG_PLUGIN_DIRECTORY_BLOGID, false );
		if ( $site ) {
			$site = clone $site;
			// 6 = The Rosetta network, this causes the site to be loaded as part of the Rosetta network
			$site->site_id = 6;
			return $site;
		}
	}

	return $site;
}
add_filter( 'pre_get_site_by_path', 'wporg_plugins_on_rosetta_domains', 10, 4 );
