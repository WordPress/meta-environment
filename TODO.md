## High priority

* make db prefixs match production - wpconfig and db backups
* Make network/site layout match production, rather than being standalone sites
	* WordPress.org
		* Setup core network
		* Fold existing WME sites in one at a time
			- Match network/site IDs and db table names w/ production
			- apps.wordpress.org
			- developer.wordpress.org
			- global.wordpress.org
	* WordPress.net - standalone multisite, or part of multinetwork?
		* Migrate jobs.wordpress.net. Make network/site IDs and table_prefix match production
* Add remaining sites in WordPress.org network
	* WordPress.org (site)    - static content, /translate (integrate w/ global.wporg for permissions), api.wordpress.org
	* WordPress.org (network) - /showcase, /news
	* make.wordpress.org
	* learn.wordpress.org
	* BuddyPress.org - profiles.wordpress.org plus all the BuddyPress and bbPress stuff
	* browsehappy.com - single site, or part of multinetwork/multisite?


## Medium priority

* Add a dashboard similar to VVV
	* Links to all the active sites, organized by network.
	* Maybe have an visual map of how all the sites are organized
	* Also link to WME repo and VVV dashboard (for phpmyadmin, etc)
	* Lives at wp-meta.dev?
* wordcamp.dev - intercept outbound mail so support@, etc don't get test emails. probably do this for all sites.
* global.wordpress.dev - implement $GLOBALS['wporg_global_header_options'] options in rendered global WordPress.org header to fix menu, etc
* global.wordpress.dev - download localizations from http://downloads.wordpress.org/translation/core/4.0/ja.zip instead of i18n svn? more consistent and future proof 
* global.wordpress.dev - svn:ignore things you add to wp-content directory to make patching easier. check other sites too.
* global.wordpress.dev - open source the Rosetta plugin to allow contributions and fix theme notices
* developer.wordpress.dev - remaining provision todos
* developer.wordpress.dev - move SASS update/watch to cron job (or login script or whatever) instead of provision, b/c provision doesn't run on every boot  
* jobs.wordpress.dev - Automate inserting sample jobs because the ones currently in database will be pruned by the time people provision.
* wordpresstv.dev - get video uploads working if dev connects to a videopress account?
* wordpresstv.dev - get subtitle uploads working


## Low priority

* Make a screencast of the setup process.
* global.wordpress.dev - Contact form displays success message but doesn't insert post into database
* global.wordpress.dev - update `WP_CORE_STABLE_BRANCH` automatically from http://api.wordpress.org/core/version-check/1.7/. Use `current` or `version`? Parse for branch only.
* jobs.wordpress.dev - Fix CAPTCHA image on Feedback form. Problem is Nginx config doesn't support running PHP scripts inside wp-content.
* wordcamp.dev - abstract the Nginx that's shared between `wordcamp.dev` and `*.wordcamp.dev` to avoid duplication.
* rotate logs
