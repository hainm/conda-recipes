include config.h

lib: libsaxs_md.so libsaxs_rism.so

libsaxs_md.so: saxs_md.o lebedev.o atm_f.o dx.o f_calc.o IO.o pdb.o
	$(CXX) -shared $(CXXOPTFLAGS) $(CXXFLAGS) $(AMBERCXXFLAGS) $(LDFLAGS) \
		-o $@ saxs_md.o lebedev.o atm_f.o dx.o f_calc.o IO.o pdb.o

libsaxs_rism.so: saxs_rism.o lebedev.o atm_f.o dx.o f_calc.o IO.o pdb.o vol_decomp.o
	$(CXX) -shared $(CXXOPTFLAGS) $(CXXFLAGS) $(AMBERCXXFLAGS) $(LDFLAGS) \
		-o $@ saxs_rism.o lebedev.o atm_f.o dx.o f_calc.o IO.o pdb.o vol_decomp.o

.cpp.o:
	$(CXX) -c $(CXXOPTFLAGS) $(CXXFLAGS) $(AMBERCXXFLAGS) -I$(INCDIR) -o $@ $<
