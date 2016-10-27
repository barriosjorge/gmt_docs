
all:
	make -C src html

clean:
	rm -fr build html	
	make -C src clean


