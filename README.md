# WordPress Meta Environment ( Deprecated )

⚠️ This repository is deprecated. Most newer projects have their own Docker/wp-env environments inside their Git repositories. Most contributors will have an easier time using these instead of the Meta Environment:

* [learn.w.org](https://github.com/WordPress/learn)
* [w.org/patterns](https://github.com/WordPress/pattern-directory/)
* [make.w.org/five-for-the-future](https://github.com/WordPress/five-for-the-future)
* [w.org/support](https://github.com/WordPress/HelpHub)
* [wordcamp.org](https://github.com/WordPress/wordcamp.org)
* [w.org/gutenberg](https://github.com/WordPress/wporg-gutenberg)
* [w.org/themes](https://github.com/WordPress/theme-directory-env)
* [w.org/news](https://github.com/WordPress/wporg-news-2021)
* [gutenberg.run](https://github.com/WordPress/gutenberg.run)

However, this repository may be the only way to provision some older sites. _Support for that is limited, though, and you're encouraged to try a newer repository first._

The current goal is to convert these into separate repositories that use WP Env.

## Documentation

* [Installation and Updates](./docs/install.md)
* [Troubleshooting and Support](./docs/troubleshooting.md)
* [Contributing](./docs/contributing.md)

## About

The Meta Environment (WME) aimed to make it easier to contribute to the network of official WordPress.org websites by automatically setting up a local development environment that is already provisioned with everything you need to get started on a patch. The environment will contain all of the open-source code that runs each supported site, as well as some sample data that mimics the production site.

The WME was built on top of [VVV](https://github.com/Varying-Vagrant-Vagrants/VVV), and works by
provisioning the WordPress.org sites into an existing VVV installation. You can find a lot of documentation and
resources for working with VVV on its homepage.

You can find more information about contributing to the official WordPress websites from [the Meta team's
handbook](http://make.wordpress.org/meta/handbook/).

### Available Sites

* [buddypress.org](https://buddypress.org)
* [jobs.wordpress.net](http://jobs.wordpress.net)
* ~~[wordcamp.org](http://wordcamp.org)~~ _( deprecated, see above )_
* wordpress.org
	* [developer.wordpress.org](http://developer.wordpress.org)
	* [global.wordpress.org](http://global.wordpress.org)
	* [translate.wordpress.org](http://translate.wordpress.org)
* [wordpress.tv](http://wordpress.tv)
