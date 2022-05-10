set_property PACKAGE_PIN V17 [get_ports {pos[0]}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[0]}] 
set_property PACKAGE_PIN V16 [get_ports {pos[1]}]        
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[1]}] 
set_property PACKAGE_PIN W16 [get_ports {pos[2]}]
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[2]}] 
set_property PACKAGE_PIN W17 [get_ports {pos[3]}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[3]}] 
set_property PACKAGE_PIN W15 [get_ports {pos[4]}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[4]}] 
set_property PACKAGE_PIN V15 [get_ports {pos[5]}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[5]}] 
    
set_property PACKAGE_PIN R3 [get_ports {reset}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {reset}]     
    
set_property PACKAGE_PIN W5 [get_ports clk]         
    set_property IOSTANDARD LVCMOS33 [get_ports clk]  
    create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports clk] 
    
##Sch name = JC1 
set_property PACKAGE_PIN K17 [get_ports {pos[6]}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {pos[6]}] 
##Sch name = JC2 
set_property PACKAGE_PIN M18 [get_ports {servo}]       
    set_property IOSTANDARD LVCMOS33 [get_ports {servo}] 
