# WordPress Meta Environment

WME is a Vagrant configuration that aims to make it easier to contribute to the official WordPress websites by 
providing a development environment that is already provisioned with everything you need to get started on a patch. 
It contains all of the open-source code that runs each supported site, as well as some sample data that mimics the
production site.
 
WME is based on [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV), and you can find 
a lot of documentation and resources upstream.
 
You can find more information about contributing to the official WordPress websites from [the Meta team's
handbook](http://make.wordpress.org/meta/handbook/).


### Supported Sites

* [developer.wordpress.org](http://developer.wordpress.org)
* [global.wordpress.org](http://global.wordpress.org)
* [jobs.wordpress.net](http://jobs.wordpress.net)
* [wordcamp.org](http://wordcamp.org)

The goal is to eventually support all of the sites in the network.


### Setup

1. Clone this repository to your hard drive.
1. Follow [the Getting Started instructions for VVV](https://github.com/Varying-Vagrant-Vagrants/VVV), but use the
   repository you cloned in the previous step instead of VVV's repository.
1. Visit [http://wp-meta.dev](http://wp-meta.dev) for a list of supported sites and server tools.
1. Login to any site with username `admin` and password `password`.


### Notes

* Subversion repositories are checked out using version 1.8 inside the virtual machine, and the 1.8 repository format
  is not compatible with the svn 1.7 client. If you have an older client and try to run any svn commands,
  you'll get a `The client is too old to work with the working copy` error. Unfortunately there is no way to downgrade the repository format,
  but you can work around the issue by either, 1) Upgrading your svn client to version 1.8+; or 2) Work with svn
  from inside the virtual machine.
