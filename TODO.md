## High priority
* Add sample content to (en|es|ja).wordpress.dev sites.
* Subversion checkouts are incompatible with the version of svn installed on most macs (via Xcode)
* Add remaining sites in WordPress.org network


## Medium priority
* Clone CampTix from Github instead of WPORG
* Merge fix for VVV #375 when it lands
* developer.wordpress.dev - remaining provision todos
* developer.wordpress.dev - move SASS update/watch to cron job (or login script or whatever) instead of provision, b/c provision doesn't run on every boot  
* jobs.wordpress.dev - Automate inserting sample jobs because the ones currently in database will be pruned by the time people provision.


## Low priority
* Make a screencast of the setup process.
* jobs.wordpress.dev - Fix CAPTCHA image on Feedback form. Problem is Nginx config doesn't support running PHP scripts inside wp-content. 
