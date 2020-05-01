#
# Synt Component
#
set top <CHANGE_ME>

# TODO: Arguments for part may be relevant etc
# Note: changes to project output name will require changes to .gitignore
create_project -in_memory .prj prj 

# TODO: Your component might require diffrent patterns
read_vhdl -vhdl2008 [glob -join [file dirname [info script]] "src" "*.vhd"]

# Files list of sources
puts [join [sort [get_files]] \n]

# Runig in_memory manual set top is required
set_property TOP $top [current_fileset]

synth_design