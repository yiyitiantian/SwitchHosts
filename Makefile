SRC = action.sh customize.sh getenv.sh service.sh\
	  config META-INF module.prop

all: switchhosts.zip

switchhosts.zip: ${SRC} 
	zip -r9 $@ ${SRC}

clean:
	rm -rf switchhosts.zip

.PHONY=clean
