PROJECT=dalmatiner-common
VERSION=0.3.4
PROJECT_VERSION=${VERSION}
REPO=https://gitlab.com/Project-FiFo/DalmatinerDB/dalmatinerdb.git
TARGET_DIRECTORY=/opt/dalmatinerdb
RELEASE_DIR=src/_build/default/rel

export TARGET_DIRECTORY

package:
	@echo do packagey things!
	mkdir -p ${IPS_BUILD_DIR}/data

publish: ips-package
ifndef PKGSRVR
	echo "Need to define PKGSRVR, something like http://localhost:10000"
	exit 1
endif
	pkgsend publish -s ${PKGSRVR} -d ${IPS_BUILD_DIR} ${IPS_TMP_DIR}/pkg.pm5.final
	pkgrepo refresh -s ${PKGSRVR}

include ips.mk
