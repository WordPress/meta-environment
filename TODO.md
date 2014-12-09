## High priority

* Make network/site layout match production, rather than being standalone sites
	* WordPress.org
		* Fold existing WME sites in one at a time
			- Match network/site IDs and db table names w/ production
			- change wordpress.dev to wordpressorg.dev?
				- will have to make wordpressnet.dev, and already made wordpresstv.dev, so want to be consistent?
			- global.wordpress.org - can use switch to `*.wordpressorg.dev` in nginx config now?
	* WordPress.net - standalone multisite, or part of multinetwork?
		* Migrate jobs.wordpress.net. Make network/site IDs and table_prefix match production
	* Update links in WME dashboard to be organized by network
* Add remaining sites in WordPress.org network
	* WordPress.org (site)    - static content (need to open), /translate (integrate w/ global.wporg for permissions), api.wordpress.org
	* WordPress.org (network) - /showcase, /news
	* make.wordpress.org - network/sites already setup, but haven't added content or setup theme/plugins, etc. fix make.wordpress.dev/core/handbook
	* learn.wordpress.org - network/sites already setup, but haven't added content or setup theme/plugins, etc
	* BuddyPress.org - profiles.wordpress.org plus all the BuddyPress and bbPress stuff
	* browsehappy.com - single site, or part of multinetwork/multisite?


## Medium priority

* svn:ignore plugins installed by wp-cli so `svn stat` isn't cluttered. maybe do that to `SVN_PLUGINS` too instead of externals?
* Add a visual map to the dashboard showing how all the sites are organized within networks, etc. Put it on the repo homepage too.
* wordcamp.dev - intercept outbound mail so support@, etc don't get test emails. probably do this for all sites.
* global.wordpress.dev - implement $GLOBALS['wporg_global_header_options'] options in rendered global WordPress.org header to fix menu, etc
* global.wordpress.dev - download localizations from http://downloads.wordpress.org/translation/core/4.0/ja.zip instead of i18n svn? more consistent and future proof 
* global.wordpress.dev - svn:ignore things you add to wp-content directory to make patching easier. check other sites too.
* global.wordpress.dev - open source the Rosetta plugin to allow contributions and fix theme notices
* developer.wordpress.dev - setup has changed now that reference is live? use developer-reference plugin instead of wp-parser? setup handbooks?
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
