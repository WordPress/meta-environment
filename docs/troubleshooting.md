# Troubleshooting and Support

If you run into any problems, the first step is to check out the common problems/solutions below,
and [search for an existing issue](https://github.com/WordPress/meta-environment/issues). If that
doesn't help, follow the instructions in the `Support` section at the bottom of this page.


## Problems with the entire environment

* **Nginx configuration file test failed**: If you see an error like this:

	> ==> default: nginx: [emerg] open() "/srv/www/meta-environment/buddypressorg.dev/logs/nginx-access.log" failed (2: No such file or directory)
	> ==> default: nginx: configuration file /etc/nginx/nginx.conf test failed

	...then make sure that you cloned the WME repository into a folder named `wordpress-meta-environment`, rather than just `meta-environment`, or something arbitrary. If the folder is named anything other than `wordpress-meta-environment`, then the provision process will break. See the `Setup` section above for details.


* **Make sure that you cloned the Meta Environment repository to a folder named `wordpress-meta-environment` inside VVV's `www/` directory.**

	If you choose a different name, then WME will break during the provision stage, unless you also manually edit the Nginx configuration files for each site to reflect the name you chose.

* **Subversion client version conflicts:** Subversion repositories are checked out using version 1.8 inside the
  virtual machine, and the 1.8 repository format is not compatible with the svn 1.7 client. If you have an older
  client and try to run any svn commands, you'll get a *`The client is too old to work with the working copy`*
  error. Unfortunately there is no way to downgrade the repository format, but you can work around the issue by
  either, 1) Upgrading your svn client to version 1.8+; or 2) Work with svn from inside the virtual machine.

* **Windows** installations: Adrian Pop has documented some tips for [installing the Meta Environment on Windows](http://test.informagination.ro/wordpress-meta-environment-in-win-10/).

* **My IDE (or other tool) doesn't recognize `public_html` as a Git checkout:** Because `public_html` is a symlink, you may need to open `vagrant.local/www/wordpress-meta-environment/meta-repository/{site}/public_html` as the project root, instead of `vagrant.local/www/wordpress-meta-environment/{site}/public_html`. Another option is to use Git from the command line. 

* **Databases not created:** If you ran `vagrant destroy` after provisioning, and later re-provisioned, then the symlinks that were created during the first provisioning won't be removed. Those are used to determine whether or not to import the database and install plugins. To fix that, removing the symlinked `public_html` folders, and then run `vagrant provision` again.


## Problems with specific sites

* **Developer.WordPressorg.dev WP-Parser memory errors:** You may need to increase the amount of RAM that the virtual
  machine has in order to run the parser for `developer.wordpress.dev`. To do that, open VVV's `Vagrantfile`,
  locate the line that contains `v.customize ["modifyvm", :id, "--memory", 512]`, and change `512` to `1024`. Once
  you've done that, run `vagrant halt && vagrant up` to make the change take effect.

* **WordPressTV.dev video upload errors:** The WPTV uploader integrates with VideoPress, which requires a connection
  to WordPress.com and a paid VideoPress subscription, so it isn't enabled.


## Support

If nothing above helped, then feel free to [open a new issue](https://github.com/WordPress/meta-environment/issues/new), or ping `@iandunn` in the `#meta` channel on [WordPress' Slack server](https://make.wordpress.org/chat/).

Before asking for help, please take a log of the provisioning process, to help us troubleshoot the problem. You can do that by running the commands below:

***Warning:*** These commands will remove any changes you've made inside `public_html` directories, so make sure you back up anything you want to save before you run this.

	cd /path/to/your/vagrant.local/www/wordpress-meta-environment
	vagrant halt
	rm -rf */public_html
	git reset --hard HEAD
	vagrant up --provision 2>&1 | tee wme-provision.log

Then share `wme-provision.log` when asking for help.
