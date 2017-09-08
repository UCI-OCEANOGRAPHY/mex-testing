all: mex
.PHONY: mex
mex:
	gfortran -fPIC -c will_be_marbl.F90
	mex mex_interface.F90
	mex mex_marbl_driver.F90 mex_interface.F90 *.o

.PHONY: clean
clean:
	rm -f *.mod *.o *.mexa64
