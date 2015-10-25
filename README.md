# WordPress Meta Environment (WME)

WME aims to make it easier to contribute to the network of official WordPress.org websites by automatically setting
up a local development environment that is already provisioned with everything you need to get started on a patch.
The environment will contain all of the open-source code that runs each supported site, as well as some sample data
that mimics the production site.
 
WME is built on top of [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV) (VVV), and works by
provisioning the WordPress.org sites into an existing VVV installation. You can find a lot of documentation and
resources for working with VVV on its homepage.
 
You can find more information about contributing to the official WordPress websites from [the Meta team's
handbook](http://make.wordpress.org/meta/handbook/).


### Available Sites

* [buddypress.org](https://buddypress.org)
* [jobs.wordpress.net](http://jobs.wordpress.net)
* [wordcamp.org](http://wordcamp.org)
* wordpress.org
	* [apps.wordpress.org](http://apps.wordpress.org)
	* [developer.wordpress.org](http://developer.wordpress.org)
	* [global.wordpress.org](http://global.wordpress.org)
	* [translate.wordpress.org](http://translate.wordpress.org)
* [wordpress.tv](http://wordpress.tv)

The goal is to eventually include all of the sites in the network.


### Setup

1. [Setup Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV).  If you choose to not install the `vagrant-hostsupdater` plugin then you will need to manually add each of the site's hostnames to your local hosts file.
2. Clone this repository as a subdirectory of VVV's `www` folder 
	- Navigate cd to your Vagrant install's www directory eg: `vagrant-local/www`
	- Clone this repo eg: `git clone https://github.com/WordPress/meta-environment.git wordpress-meta-environment`
<br>If you don't specify a clone directory the default will be `meta-enviorment` in which  you'll need to update the paths in each site's `vvv-nginx.conf` file before you provision VVV in the next step. We recommend specifying the directory as  `wordpress-meta-environment` to keep things simple. 
3. Restart and re-provision VVV with `vagrant halt && vagrant up --provision`.
4. Visit [http://wp-meta.dev](http://wp-meta.dev) for links to all the available sites. You can log in to any of the with with username `admin` and password `password`.
You will also find a list of all the sites in the VVV install at [http://vvv.dev](http://vvv.dev)


### Updating

When new sites are added to the repository, you'll need to re-provision your local copy in order to obtain the new
site.

1. If the new site is not part of an existing multisite/multi-network installation, then you can simply run
`vagrant halt && vagrant up --provision`.
2. If the new site is part of an existing installation (like `wordpressorg.dev`),
then you'll need to delete the `public_html` folder and database for that site, and then run
`vagrant halt && vagrant up --provision`. Don't forget to backup any uncommitted patches that you're working on.

If you're upgrading from an older copy of WME -- prior to December 4, 2014 -- then the best way to upgrade is just
to start from scratch, since the repository has changed so much. Prior to the 4th, WME was a full fork of Varying
Vagrant Vagrants, including the virtual machine, rather than just a collection of scripts that runs in an existing
VVV installation.


### Notes

* **Subversion client version conflicts:** Subversion repositories are checked out using version 1.8 inside the 
  virtual machine, and the 1.8 repository format is not compatible with the svn 1.7 client. If you have an older
  client and try to run any svn commands, you'll get a *`The client is too old to work with the working copy`*
  error. Unfortunately there is no way to downgrade the repository format, but you can work around the issue by
  either, 1) Upgrading your svn client to version 1.8+; or 2) Work with svn from inside the virtual machine.
* **Windows** installations: Adrian Pop has documented some tips for [installing the Meta Environment on Windows](http://test.informagination.ro/wordpress-meta-environment-in-win-10/).
* **Developer.WordPressorg.dev WP-Parser memory errors:** You may need to increase the amount of RAM that the virtual
  machine has in order to run the parser for `developer.wordpress.dev`. To do that, open VVV's `Vagrantfile`,
  locate the line that contains `v.customize ["modifyvm", :id, "--memory", 512]`, and change `512` to `1024`. Once
  you've done that, run `vagrant halt && vagrant up` to make the change take effect.
* **WordPressTV.dev video upload errors:** The WPTV uploader integrates with VideoPress, which requires a connection
  to WordPress.com and a paid VideoPress subscription, so it isn't enabled.


### Support

If you run into any problems, check the **Notes** section above. If that doesn't help, feel free to
[open an issue](https://github.com/WordPress/meta-environment/issues) or ping
[iandunn](https://wordpress.slack.com/team/iandunn) in the #meta channel on
[WordPress's Slack server](https://make.wordpress.org/chat/).


### Contributing

Pull requests are welcome. Check out [the TODO file](https://github.com/WordPress/meta-environment/blob/master/TODO.md)
for things that need some help, or [open an issue](https://github.com/WordPress/meta-environment/issues)
to suggest something that's not on the list.

Before you make any database changes for a pull request, please make sure that you delete your local copy of the
database and import the latest version. That will make merging much easier and helps avoid regressions.
