CHARTS := $(shell find . -path '*/Chart.yaml' | tr '\n' ' ' | sed -E 's:\./|/Chart\.yaml::g')
DEP_CHARTS := $(shell find . -path '*/requirements.yaml' | tr '\n' ' ' |  sed -E 's:\./|/requirements\.yaml::g')

.PHONY: clean all package makepath copy index sync acl dependency-update
all: package makepath copy index sync

dependency-update:
	helm init -c
	helm repo add atlas http://atlas.cnct.io
	$(foreach chart,$(DEP_CHARTS),(helm dependency update --debug $(chart); echo $?) && ) :

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