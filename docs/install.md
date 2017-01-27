# Installation

If you run into any problems with the instructions below, check out [the Troubleshooting guide](./troubleshooting.md).

## Initial Setup

1. [Setup Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV).

	We recommend that you follow the step to install the `vagrant-hostsupdater` plugin, because if you don't then
	you will need to manually add the hostnames for each WME site to your local hosts file.
	
	Make sure you have the latest version of VVV.

1. In the `vagrant-local` folder edit `vvv-config.yml` and uncomment the following line:
       
       ```yml
       #wordpress-meta-environment: https://github.com/WordPress/meta-environment.git
       ```
       to read
       ```yml
       wordpress-meta-environment: https://github.com/WordPress/meta-environment.git
       ```

1. Restart and re-provision VVV
	1. `vagrant halt && vagrant up --provision`
	1. This will take roughly 10-30 minutes


You're all set!

* Visit [http://wp-meta.dev](http://wp-meta.dev) for links to all the available sites.
* Log in to any of them with username `admin` and password `password`


## Updating

When new sites are added to the repository, you'll need to pull the changes, then re-provision your local copy in
order to obtain the new site.

1. `cd vagrant.local/www/wordpress-meta-environment`
1. `git pull origin master`
1. If the new site is not part of an existing multisite/multi-network installation, then you can simply run
`vagrant halt && vagrant up --provision`
1. If the new site is part of an existing installation (like `wordpressorg.dev`),
then you'll need to delete the `public_html` folder and database for that site, and then run
`vagrant halt && vagrant up --provision`
	1. Don't forget to backup any uncommitted patches that you're working on.

