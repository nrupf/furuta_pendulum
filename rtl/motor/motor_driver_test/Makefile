PROJECT = Stopwatch

QUARTUS_CPF = docker run --platform linux/amd64 -it --rm -v .:/build didiermalenfant/quartus:22.1-apple-silicon quartus_cpf
QUARTUS_SH  = docker run --platform linux/amd64 -it --rm -v .:/build didiermalenfant/quartus:22.1-apple-silicon quartus_sh
 
all:
	echo "Used for mac only. Targets: build, program, clean"

build:
	$(QUARTUS_SH) --flow compile $(PROJECT)

program:	output_files/$(PROJECT).sof
	$(QUARTUS_CPF) -c -q 24.0MHz -g 3.3 -n p output_files/$(PROJECT).sof $(PROJECT).svf
	openFPGALoader -b de10lite $(PROJECT).svf 

clean:
	rm -rf output_files db incremental_db
	rm -f $(PROJECT).svf


