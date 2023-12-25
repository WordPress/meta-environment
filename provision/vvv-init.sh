#!/bin/bash

# This loads the various provisioners for each site in the Meta Environment,
# so that VVV doesn't have to do a folder search to find them.

echo "Beginning WordPress Meta Environment provisioning"
echo " ! Warning: Some sites have mgrated to new projects, check the documentation for the meta environment"
echo " ! The meta environment project is deprecated and being replaced, things may not work as expected."
echo " "

BASE_DIR="$( dirname $( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd ) )"

# Launch each provisioner in a subshell to avoid conflicting global variable names.
# For example, `$BASE_DIR` would be overridden by each provisioner.
( source "${BASE_DIR}/buddypressorg.test/provision/vvv-init.sh"     )
( source "${BASE_DIR}/jobs.wordpressnet.test/provision/vvv-init.sh" )
( source "${BASE_DIR}/wordcamp.test/provision/vvv-init.sh"          )
( source "${BASE_DIR}/wordpressorg.test/provision/vvv-init.sh"      )
( source "${BASE_DIR}/wordpresstv.test/provision/vvv-init.sh"       )

echo "Completed WordPress Meta Environment provisioning"
