# Installation

If you run into any problems with the instructions below, check out [the Troubleshooting guide](./troubleshooting.md).


## Initial Setup

1. [Setup Varying Vagrant Vagrants](https://varyingvagrantvagrants.org/docs/en-US/installation/).

	We recommend that you follow the step to install the `vagrant-hostsupdater` plugin, because if you don't then
	you will need to manually add the hostnames for each WME site to your local hosts file.

	Make sure you have the latest version of VirtualBox, Vagrant, and VVV.

1. Verify that VVV is working

	Open [http://vvv.test/](http://vvv.test/) in your browser, and make sure it loads. Then click on one of the links under `Bundled Environments`, and make sure that it loads too.

	If you run into any problems, stop and [fix those](https://varyingvagrantvagrants.org/docs/en-US/troubleshooting/) before trying to install the Meta Environment.

	Once VVV is working, then you can move on to the next step.

1. Check if you have a `vvv-custom.yml` file in the `vagrant-local` folder.

	If you don't, then create one by copying the default `vvv-config.yml` file:

	`cp vvv-config.yml vvv-custom.yml`

	Then uncomment the following lines inside `vvv-custom.yml`:

	```yml
	#wordpress-meta-environment:
	#  repo: https://github.com/WordPress/meta-environment.git
	```

	...and extend them so that they look like:

	```yml
	 wordpress-meta-environment:
      description: "An environment useful for contributions to the WordPress meta team."
      repo: https://github.com/WordPress/meta-environment.git
      hosts:
        - wp-meta.test
      custom:
        provision_site:
          "buddypressorg.test": true
          "jobs.wordpressnet.test": true
          "wordcamp.test": true
          "wordpressorg.test": true
          "wordpresstv.test": true
	```

	This will provision all sites. Use `false` to skip provisioning of specific site.

1. Restart and re-provision VVV
	1. `vagrant reload --provision`
	1. This will take roughly 10-30 minutes


You're all set!

* Visit [http://wp-meta.test](http://wp-meta.test) for links to all the available sites.
* Log in to any of them with username `admin` and password `password`


## Updating

When new sites are added to the repository, you'll need to pull the changes, then re-provision your local copy in
order to obtain the new site.

1. `cd vagrant.local/www/wordpress-meta-environment`
1. `git pull origin master`
1. If the new site is not part of an existing multisite/multi-network installation, then you can simply run
`vagrant reload --provision`
1. If the new site is part of an existing installation (like `wordpressorg.test`),
then you'll need to delete the `public_html` folder and database for that site, and then run
`vagrant reload --provision`
	1. ⚠️ Don't forget to backup any uncommitted patches that you're working on.
