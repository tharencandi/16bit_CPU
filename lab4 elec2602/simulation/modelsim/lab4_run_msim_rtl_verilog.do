transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/fourHexDisplay.v}
vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/binary_to_7Seg.v}
vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/4b_reg.v}

vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/4b_reg.v}
vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/binary_to_7Seg.v}
vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/fourHexDisplay.v}
vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/instantiate_lab4_part5.v}
vlog -vlog01compat -work work +incdir+E:/lab4\ elec2602/Part\ 5 {E:/lab4 elec2602/Part 5/lab4_part5_TB.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab4_part5_TB

add wave *
view structure
view signals
run 1 us
