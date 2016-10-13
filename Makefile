CHARTS := $(shell find . -type d -maxdepth 1 -name '[[:alnum:]]*' | tr '\n' ' ' | sed 's#./##g')
DEP_CHARTS := $(shell find . -path '*/requirements.yaml' | tr '\n' ' ' | sed -E 's#\./|/requirements\.yaml##g')

.PHONY: clean all package makepath copy index sync acl dependency-update
all: package makepath copy index sync

dependency-update: ; $(foreach chart,$(DEP_CHARTS),(helm dependency update $(chart)) &&) :

package: dependency-update ; $(foreach chart,$(CHARTS),(helm package $(chart) --save=false) &&) :

makepath:
	@mkdir -p cnct-atlas

copy:
	@mv *.tgz cnct-atlas/

index:
	@helm repo index ./cnct-atlas --url http://atlas.cnct.io

sync:
	@gsutil -m cp -r ./cnct-atlas/* gs://atlas.cnct.io
	@gsutil cp ./404.html gs://atlas.cnct.io
	@gsutil cp  ./index.html gs://atlas.cnct.io

clean:
	@rm -rf cnct-atlas