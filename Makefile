SRC = action.sh customize.sh getenv.sh\
	  config META-INF module.prop

all: switchhosts_magisk.zip switchhosts_ksu_ap.zip

switchhosts_magisk.zip: ${SRC} service.sh
	zip -r9 $@ $^

switchhosts_ksu_ap.zip: ${SRC} boot-completed.sh
	zip -r9 $@ $^

boot-completed.sh: service.sh
	cp $< $@

clean:
	rm -rf switchhosts_magisk.zip switchhosts_ksu_ap.zip boot-completed.sh

.PHONY=clean
