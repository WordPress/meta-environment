# WordPress Meta Environment

WME is a Vagrant configuration that aims to make it easier to contribute to the official WordPress websites by 
providing a development environment that is already configured with everything you need to get started on a patch. 
It contains all of the open source code that runs each supported site, as well as some sample data that mimics the
production site.
 
WME is based on [Varying Vagrant Vagrants](https://github.com/Varying-Vagrant-Vagrants/VVV), and you can find 
a lot of documentation and resources upstream.
 
The first supported site is [WordCamp.org](http://wordcamp.org), and the goal is to eventually support all of the sites in the network.
 
You can find more information about contributing to the official WordPress websites from [the Meta team's
handbook](http://make.wordpress.org/meta/handbook/).

### Setup

1. Follow [the Getting Started instructions for VVV](https://github.com/Varying-Vagrant-Vagrants/VVV), but use this
repository's URL instead of VVV's when cloning.
1. Visit [http://wp-meta.dev](http://wp-meta.dev) for a list of supported sites.
1. Login to any site with username `admin` and password `password`.
