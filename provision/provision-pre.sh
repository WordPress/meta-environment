#!/usr/bin/env bash

set -ex

if [ -e /vagrant/site-config ]; then
	echo "rsyncing site-config to config..."
	/usr/bin/rsync -avz /vagrant/site-config/ /srv/config/
fi

if [ -e /vagrant/site-database ]; then
	echo "rsyncing site-database to database..."
	/usr/bin/rsync -avz /vagrant/site-database/ /srv/database/
fi

if [ -e /vagrant/site-www ]; then
	echo "rsyncing site-www to www..."
	/usr/bin/rsync -avz /vagrant/site-www/ /srv/www/
fi
