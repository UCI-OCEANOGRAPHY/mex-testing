all: mex
.PHONY: mex
mex:
	gfortran -fPIC -c mod_03.F90
	mex mod_77_03.F90
	mex mod_77.F mod_77_03.F90 *.o

.PHONY: clean
clean:
	rm -f *.mod *.o *.mexa64
