FC  = gfortran

OBJ = main.o \
		ReadInput.o \
		InitCond.o \
		TimeStep.o \
		Solve.o \
		NumFlux.o \
		SaveResult.o

TARGETS = fvm

all: $(TARGETS)

fvm: $(OBJ)
	$(FC) -o fvm $(OBJ)

.f.o: 
	$(FC) -c $*.f
