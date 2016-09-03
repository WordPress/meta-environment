# Installation

If you run into any problems with the instructions below, check out [the Troubleshooting guide](./troubleshooting.md).

## Initial Setup

1. [Setup Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV).

	We recommend that you follow the step to install the `vagrant-hostsupdater` plugin, because if you don't then
	you will need to manually add the hostnames for each WME site to your local hosts file.

1. Clone this repository as a subdirectory of VVV's `www` folder, and name the folder `wordpress-meta-environment`
	1. `cd vagrant-local/www` (where `vagrant-local` is the name of your VVV folder)
	1. `git clone https://github.com/WordPress/meta-environment.git wordpress-meta-environment`

	**It's important that you clone the repository to a folder named `wordpress-meta-environment`.** If you choose
	a different name, then WME will break during the provision stage, unless you also manually edit the Nginx
	configuration files for each site to reflect the name you chose.

1. Restart and re-provision VVV
	1. `cd ..` (to get back to the main `vagrant-local` directory)
	1. `vagrant halt && vagrant up --provision`
	1. This will take roughly 10-30 minutes


You're all set!

* Visit [http://vvv.dev](http://vvv.dev) for links to all the available sites.
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

