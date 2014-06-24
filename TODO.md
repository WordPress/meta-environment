## High priority
* devhub home page widget notices. maybe just need to let parser finish.
* Add remaining sites in WordPress.org network


## Medium priority
* developer.wordpress.dev - remaining provision todos
* developer.wordpress.dev - maybe don't run the parser on provision because takes so long? instead, setup cron and manually run cron in background after provision
* developer.wordpress.dev - move SASS update/watch to cron job (or login script or whatever) instead of provision, b/c provision doesn't run on every boot  
* jobs.wordpress.dev - Automate inserting sample jobs because the ones currently in database will be pruned by the time people provision.


## Low priority
* jobs.wordpress.dev - Fix CAPTCHA image on Feedback form. Problem is Nginx config doesn't support running PHP scripts inside wp-content. 
