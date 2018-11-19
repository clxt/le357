GHDL_ARGS =--ieee=synopsys --warn-no-vital-generic \
			--workdir=simu --work=work
FILES = ./src/coef.vhdl ./src/ech.vhdl \
		./src/mae.vhdl ./src/mac.vhdl \
		./src/cpt16.vhdl ./src/top_FIR.vhdl

all : top_fir

top_fir : $(FILES)
	ghdl -a $(GHDL_ARGS) $(FILES)
	ghdl -a $(GHDL_ARGS) testbench/tb_fir.vhdl
	ghdl -e $(GHDL_ARGS) tb_fir
	ghdl -r $(GHDL_ARGS) tb_fir --vcd=tb_fir.vcd

% : ./src/%.vhdl
	ghdl -a $(GHDL_ARGS) $<
	ghdl -a $(GHDL_ARGS) testbench/tb_$@.vhdl
	ghdl -e $(GHDL_ARGS) tb_$@
	ghdl -r $(GHDL_ARGS) tb_$@ --vcd=$@.vcd

clean:
	rm *.o *.cf
