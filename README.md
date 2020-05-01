# VHDL component

__Requirements:__

|Tool            |Version |Note            |
|:---------------|-------:|:---------------|
|Vivado          | 2019.2 | 64-bit         | 
|Modelsim        | 2019.2 | 64-bit         |
|Python          |  >=3.6 |                |
|Vunit           |  4.4.0 | Python Package |
|Colorama        |  0.4.3 | Python Package |
---------------------------------------

## Run Tests
`python run.py` to run all tests    
*Note: For more info `python run.py --help`*

## Synth Design
`vivado -source build.tcl -notrace -nojournal -nolog -mode gui`

## Future Work
TBD

## Errata
`build.tcl` is untested as no src in template. Xilinx specific
`_hdl_checker.config` is windows naming scheme `.hdl_checker.config` should be used under linux
`[_.]hdl_checker.config` "builder", need to match the simulator used

# Component Description
Write component documentation here.    
Use `src/Design_Description.md` for more indepth design.    
Descripe your tests under `test/Teset_Description.md`