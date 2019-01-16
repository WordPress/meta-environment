#!/bin/bash
#
# This loads the various provisioners for each site in the meta environment,
# so that VVV doesn't have to do a folder search to find them

echo "Beginning WP Meta Environment provisioning"

source ../buddypressorg.test/provision/vvv-init.sh
source ../jobs.wordpressnet.test/provision/vvv-init.sh
source ../wordcamp.test/provision/vvv-init.sh
source ../wordpressorg.test/provision/vvv-init.sh
source ../wordpresstv.test/provision/vvv-init.sh

echo "Completed WP Meta Environment provisioning"
