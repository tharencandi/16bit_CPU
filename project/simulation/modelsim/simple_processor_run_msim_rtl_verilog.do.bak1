transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/next_state.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/four_bit_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/control_output.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/binary_to_reg_sig.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/control_unit_TB.v}

vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/binary_to_reg_sig.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/control_output.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/control_unit.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/control_unit_TB.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/four_bit_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/next_state.v}
vlog -vlog01compat -work work +incdir+C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project {C:/Users/thare/OneDrive/Documents/UNI/YR3/elec2602_group6/project/sixteen_bit_reg.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  control_unit_TB

add wave *
view structure
view signals
run 1 us
