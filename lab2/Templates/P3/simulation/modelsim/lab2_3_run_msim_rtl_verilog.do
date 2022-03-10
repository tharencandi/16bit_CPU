transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P1 {D:/Documents/elec/lab2/Templates/P1/one_bit_2to1mux.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P2 {D:/Documents/elec/lab2/Templates/P2/one_bit_4to1mux.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P3 {D:/Documents/elec/lab2/Templates/P3/two_bit_4to1mux.v}

vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P3 {D:/Documents/elec/lab2/Templates/P3/part3_TB.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P3 {D:/Documents/elec/lab2/Templates/P3/two_bit_4to1mux.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P3 {D:/Documents/elec/lab2/Templates/P3/two_bit_4to1muxV2.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P3/../P2 {D:/Documents/elec/lab2/Templates/P3/../P2/one_bit_4to1mux.v}
vlog -vlog01compat -work work +incdir+D:/Documents/elec/lab2/Templates/P3/../P1 {D:/Documents/elec/lab2/Templates/P3/../P1/one_bit_2to1mux.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  part3_TB

add wave *
view structure
view signals
run 1 us
