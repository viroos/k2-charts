CHARTS := $(shell ls -d */ | tr '\n' ' ' | sed 's/,//g' | sed 's/cnct-atlas//g' | sed 's/\///g')

.PHONY: clean all package makepath copy index sync acl
all: package makepath copy index sync

package: ; $(foreach chart,$(CHARTS),(helm package $(chart) --save=false) &&) :

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