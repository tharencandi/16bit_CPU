transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+E:/lab5\ elec2602/p1 {E:/lab5 elec2602/p1/binary_to_7Seg.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/state_reg.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/output_sig.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/next_state.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/four1s_four0s.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/inst_seq_detect.v}

vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/four1s_four0s.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/lab6_p1_TB.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/next_state.v}
vlog -vlog01compat -work work +incdir+E:/lab6\ elec2602/part1 {E:/lab6 elec2602/part1/output_sig.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab6_p1_TB

add wave *
view structure
view signals
run 1 us
