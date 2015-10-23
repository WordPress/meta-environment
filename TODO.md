## High priority

* Add Make sites
	* maybe open source some of the mu-plugins like otto and nacin were talking about
		* https://wordpress.slack.com/archives/meta/p1418177708000057
	* ping courtney ivey when they're done
* Add remaining sites in WordPress.org network
	* WordPress.org (site)    - static content (need to open source), /plugins, /support
	* api.wordpress.org
	* WordPress.org (network) - /showcase, /news
	* make.wordpress.org      - network/sites already setup, but haven't added content or setup theme/plugins, etc. fix make.wordpressorg.dev/core/handbook
	* learn.wordpress.org     - network/sites already setup, but haven't added content or setup theme/plugins, etc
	* forums (english)
	* international forums
	* an RTL theme directory
* Add remaining sites in BuddyPress.org network
	* profiles.wordpress.org
	* bbPress.org
* browsehappy.com - single site, or part of multinetwork/multisite?


## Medium priority

* common                     - svn:ignore plugins installed by wp-cli so `svn stat` isn't cluttered. maybe do that to `SVN_PLUGINS` too instead of externals?
* common                     - Add a visual map to the dashboard showing how all the sites are organized within networks, etc. Put it on the repo homepage too.
* wordcamp.dev               - switch sites to new url structure
* wordcamp.dev               - sometimes twentytwelve isn't provisioned
* wordcamp.dev               - intercept outbound mail so support@, etc don't get test emails. probably do this for all sites.
* global.wordpressorg.dev    - implement $GLOBALS['wporg_global_header_options'] options in rendered global WordPress.org header to fix menu, etc
* global.wordpressorg.dev    - download localizations from http://downloads.wordpress.org/translation/core/4.0/{locale}.zip, and automatically determine correct version instead of hardcoding 4.0
* global.wordpressorg.dev    - svn:ignore things you add to wp-content directory to make patching easier. check other sites too.
* global.wordpressorg.dev    - open source the Rosetta plugin to allow contributions and fix theme notices
* developer.wordpressorg.dev - setup has changed now that reference is live? use developer-reference plugin instead of wp-parser? setup handbooks?
* developer.wordpressorg.dev - remaining provision todos
* developer.wordpressorg.dev - move SASS update/watch to cron job (or login script or whatever) instead of provision, b/c provision doesn't run on every boot  
* jobs.wordpressnet.dev      - Automate inserting sample jobs because the ones currently in database will be pruned by the time people provision.
* wordpresstv.dev            - get video uploads working if dev connects to a videopress account?
* wordpresstv.dev            - get subtitle uploads working


## Low priority

* common                  - Make a screencast of the setup process.
* global.wordpressorg.dev - Contact form displays success message but doesn't insert post into database
* global.wordpressorg.dev - update `WP_CORE_STABLE_BRANCH` automatically from http://api.wordpress.org/core/version-check/1.7/. Use `current` or `version`? Parse for branch only.
* jobs.wordpressnet.dev   - Fix CAPTCHA image on Feedback form. Problem is Nginx config doesn't support running PHP scripts inside wp-content.
* wordcamp.dev            - abstract the Nginx that's shared between `wordcamp.dev` and `*.wordcamp.dev` to avoid duplication.
* wordcamp.dev            - rename to wordcamporg.dev for consistency with others, even though it doesn't need disambiguation like they do
* common                  - rotate logs
