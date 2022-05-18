transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602 {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/comparator_7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 3\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 3 templates/fourBit_FA.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 3\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 3 templates/FA.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 2\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 2 templates/lab3_p2_v2.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/output_files {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/output_files/lab3_p4.v}

vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602 {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/lab3_p4_TB.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602 {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/comparator_7seg.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 2\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 2 templates/lab3_p2_v2.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 2\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 2 templates/comparator.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 3\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 3 templates/fourBit_FA.v}
vlog -vlog01compat -work work +incdir+C:/Users/rmuh5776/Documents/ELEC2602/lab3\ elec2602/Lab\ 3\ Part\ 3\ templates {C:/Users/rmuh5776/Documents/ELEC2602/lab3 elec2602/Lab 3 Part 3 templates/FA.v}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L cyclonev_ver -L cyclonev_hssi_ver -L cyclonev_pcie_hip_ver -L rtl_work -L work -voptargs="+acc"  lab3_p4_TB

add wave *
view structure
view signals
run 1 us
