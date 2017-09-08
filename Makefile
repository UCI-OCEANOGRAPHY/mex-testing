all: mex
.PHONY: mex
mex:
	gfortran -fPIC -c mod_03.F90
	mex mod_90_03.F90
	mex mod_90.F90 mod_90_03.F90 *.o

.PHONY: clean
clean:
	rm -f *.mod *.o *.mexa64
