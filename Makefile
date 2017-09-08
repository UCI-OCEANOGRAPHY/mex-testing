all: mex
.PHONY: mex
mex:
	cd marbl_lib ; $(MAKE) ; cd ..
	mex -Imarbl_lib mex_interface.F90
	mex -Imarbl_lib mex_marbl_driver.F90 mex_interface.F90 marbl_lib/*.o

.PHONY: clean
clean:
	rm -f *.mod *.mexa64
	cd marbl_lib ; $(MAKE) clean ; cd ..
