transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part2 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part2/fourbit_counter.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part1 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part1/state_reg.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part2 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part2/next_state_P2.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part2 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part2/state_reg_P2.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part2 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part2/output_sig_P2.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part2 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part2/n1s_n0s.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part2 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part2/counter_module.v}

vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part1 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part1/four1s_four0s.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part1 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part1/lab6_p1_TB.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part1 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part1/next_state.v}
vlog -vlog01compat -work work +incdir+C:/Users/remon/Desktop/ELEC2602/lab6\ elec2602/part1 {C:/Users/remon/Desktop/ELEC2602/lab6 elec2602/part1/output_sig.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab6_p1_TB

add wave *
view structure
view signals
run 1 us
