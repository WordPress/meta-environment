#!/bin/bash

# Install SASS for developer.wordpress.dev
if [[ "$(sass --version)" ]]; then
	echo "Updating SASS CLI"
	gem install sass
else
	echo "Installing SASS CLI"
	gem install sass
fi

# Look for site setups scripts in the provision/sites directory too
for SITE_CONFIG_FILE in $(find /vagrant/provision/sites -maxdepth 5 -name '*.sh'); do
	source $SITE_CONFIG_FILE
done
