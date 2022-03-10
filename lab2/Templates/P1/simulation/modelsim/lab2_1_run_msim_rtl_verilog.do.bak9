transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P1 {D:/Documents/elec/lab2/Templates/P1/one_bit_2to1mux.v}

vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P1 {D:/Documents/elec/lab2/Templates/P1/four_bit_2to1mux.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P1 {D:/Documents/elec/lab2/Templates/P1/part1_TB.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P1 {D:/Documents/elec/lab2/Templates/P1/four_bit_2to1muxV2.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  part1_TB

add wave *
view structure
view signals
run 1 us
