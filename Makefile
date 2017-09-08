all: mex
.PHONY: mex
mex:
	gfortran -fPIC -c will_be_marbl.F90
	mex mex_interface.F90
	mex mex_marbl_init.F90 mex_interface.F90 *.o
	mex mex_marbl_compute_surface_flux.F90 mex_interface.F90 *.o
	mex mex_marbl_compute_interior_tendency.F90 mex_interface.F90 *.o

.PHONY: clean
clean:
	rm -f *.mod *.o *.mexa64
