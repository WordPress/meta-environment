# WordPress Meta Environment

The Meta Environment (WME) aims to make it easier to contribute to the network of official WordPress.org websites by automatically setting
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
	* [developer.wordpress.org](http://developer.wordpress.org)
	* [global.wordpress.org](http://global.wordpress.org)
	* [translate.wordpress.org](http://translate.wordpress.org)
* [wordpress.tv](http://wordpress.tv)

The goal is to eventually include all of the sites in the network.


### Documentation

* [Installation and Updates](./docs/install.md)
* [Troubleshooting and Support](./docs/troubleshooting.md)
* [Contributing](./docs/contributing.md)
