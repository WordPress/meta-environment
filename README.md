# WordPress Meta Environment

WME aims to make it easier to contribute to the network of official WordPress.org websites by automatically setting
up a local development environment that is already provisioned with everything you need to get started on a patch.
The environment will contain all of the open-source code that runs each supported site, as well as some sample data
that mimics the production site.
 
WME is built on top of [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV), and works by
provisioning the WordPress.org sites into an existing VVV installation. You can find a lot of documentation and
resources for working with VVV on its homepage.
 
You can find more information about contributing to the official WordPress websites from [the Meta team's
handbook](http://make.wordpress.org/meta/handbook/).


### Supported Sites

* [apps.wordpress.org](http://apps.wordpress.org)
* [developer.wordpress.org](http://developer.wordpress.org)
* [global.wordpress.org](http://global.wordpress.org)
* [jobs.wordpress.net](http://jobs.wordpress.net)
* [wordcamp.org](http://wordcamp.org)

The goal is to eventually support all of the sites in the network.


### Setup

1. [Setup Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV). If you choose to not install
   the `vagrant-hostsupdater` plugin then you will need to manually add each of the site's hostnames to your local
   hosts file.
1. Clone this repository into VVV's `www` directory -- e.g., 
   `git clone https://github.com/iandunn/wordpress-meta-environment.git varying-vagrant-vagrants/www/wporg-sites`
1. Re-provision VVV with `vagrant provision` if VVV is already running, or `vagrant up --provision` if it's halted.
1. Visit any of the supported sites listed above using the local equivalent of their domain name -- e.g., 
   `wordcamp.org` becomes `wordcamp.dev`. You can login with username `admin` and password `password`.


### Notes

* **Subversion client version conflicts:** Subversion repositories are checked out using version 1.8 inside the 
  virtual machine, and the 1.8 repository format is not compatible with the svn 1.7 client. If you have an older
  client and try to run any svn commands, you'll get a *`The client is too old to work with the working copy`*
  error. Unfortunately there is no way to downgrade the repository format, but you can work around the issue by
  either, 1) Upgrading your svn client to version 1.8+; or 2) Work with svn from inside the virtual machine.
* **WP-Parser memory errors:** You may need to increase the amount of RAM that the virtual machine has in order
  to run the parser for `developer.wordpress.dev`. To do that, open VVV's `Vagrantfile`, locate the line that
  contains `v.customize ["modifyvm", :id, "--memory", 512]`, and change `512` to `1024`. Once you've done that,
  run `vagrant halt && vagrant up` to make the change take effect.


### Contributing

Pull requests are welcome. Check out [the TODO file](https://github.com/iandunn/wordpress-meta-environment/blob/master/TODO.md)
for things that need some help, or [open an issue](https://github.com/iandunn/wordpress-meta-environment/issues)
to suggest something that's not on the list.
