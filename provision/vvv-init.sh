#!/bin/bash
#
# This loads the various provisioners for each site in the meta environment,
# so that VVV doesn't have to do a folder search to find them

DIR=$(dirname "$0")

echo "Beginning WP Meta Environment provisioning"

# Install wkhtmltopdf for wordcamp-docs plugin
if [ ! -f /usr/local/bin/wkhtmltopdf ];
then
  echo "Installing wkhtmltopdf"
	apt-get install -y wkhtmltopdf xvfb
	echo 'xvfb-run --server-args="-screen 0, 1024x768x24" /usr/bin/wkhtmltopdf $*' | sudo tee /usr/bin/wkhtmltopdf.sh > /dev/null
	chmod a+x /usr/bin/wkhtmltopdf.sh
	ln -s /usr/bin/wkhtmltopdf.sh /usr/local/bin/wkhtmltopdf
fi

source ../buddypressorg.test/provision/vvv-init.sh
cd $DIR # restore the current working dir after every script
source ../jobs.wordpressnet.test/provision/vvv-init.sh && cd $DIR
cd $DIR # restore the current working dir after every script
source ../wordcamp.test/provision/vvv-init.sh && cd $DIR
cd $DIR # restore the current working dir after every script
source ../wordpressorg.test/provision/vvv-init.sh && cd $DIR
cd $DIR # restore the current working dir after every script
source ../wordpresstv.test/provision/vvv-init.sh
cd $DIR # restore the current working dir after every script

echo "Completed WP Meta Environment provisioning"
