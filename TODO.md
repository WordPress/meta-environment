## High priority

* global.wordpress.dev - implement $GLOBALS['wporg_global_header_options'] options in rendered global WordPress.org header to fix menu, etc
* global.wordpress.dev - Add sample content for ja sites
* Add remaining sites in WordPress.org network


## Medium priority
* global.wordpress.dev: svn:ignore things you add to wp-content directory to make patching easier. check other sites too.
* Merge fix for VVV #375 when it lands
* global.wordpress.dev - open source the Rosetta plugin to allow contributions and fix theme notices
* developer.wordpress.dev - remaining provision todos
* developer.wordpress.dev - move SASS update/watch to cron job (or login script or whatever) instead of provision, b/c provision doesn't run on every boot  
* jobs.wordpress.dev - Automate inserting sample jobs because the ones currently in database will be pruned by the time people provision.


## Low priority
* Make a screencast of the setup process.
* global.wordpress.dev - Contact form displays success message but doesn't insert post into database
* global.wordpress.dev - update `WP_CORE_STABLE_BRANCH` automatically from http://api.wordpress.org/core/version-check/1.7/. Use `current` or `version`? Parse for branch only.
* jobs.wordpress.dev - Fix CAPTCHA image on Feedback form. Problem is Nginx config doesn't support running PHP scripts inside wp-content. 
