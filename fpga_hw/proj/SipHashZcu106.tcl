#########################################################################
## Ben Welte & Joseph Zambreno
## Department of Electrical and Computer Engineering
## Iowa State University
#########################################################################


## SipHashZcu106.tcl
########################################################################
## DESCRIPTION: This file contains the tcl project file for to recreate
## the hardware design for the SipHash test benches on the ZCU-106 
##
## NOTES:
## 3/24/23 by BW: Design created.
#########################################################################

# JAZ. Set the reference directory for source file relative paths (by default the value is script directory path)
#set origin_dir "."
set origin_dir [ file dirname [ file normalize [ info script ] ] ]

# Use origin directory path location variable, if specified in the tcl shell
if { [info exists ::origin_dir_loc] } {
  set origin_dir $::origin_dir_loc
}

# Set the project name
set _xil_proj_name_ "SipHashZcu106"

# Use project name variable, if specified in the tcl shell
if { [info exists ::user_project_name] } {
  set _xil_proj_name_ $::user_project_name
}

variable script_file
set script_file "SipHashZcu106.tcl"

# Help information for this script
proc print_help {} {
  variable script_file
  puts "\nDescription:"
  puts "Recreate a Vivado project from this script. The created project will be"
  puts "functionally equivalent to the original project for which this script was"
  puts "generated. The script contains commands for creating a project, filesets,"
  puts "runs, adding/importing sources and setting properties on various objects.\n"
  puts "Syntax:"
  puts "$script_file"
  puts "$script_file -tclargs \[--origin_dir <path>\]"
  puts "$script_file -tclargs \[--project_name <name>\]"
  puts "$script_file -tclargs \[--help\]\n"
  puts "Usage:"
  puts "Name                   Description"
  puts "-------------------------------------------------------------------------"
  puts "\[--origin_dir <path>\]  Determine source file paths wrt this path. Default"
  puts "                       origin_dir path value is \".\", otherwise, the value"
  puts "                       that was set with the \"-paths_relative_to\" switch"
  puts "                       when this script was generated.\n"
  puts "\[--project_name <name>\] Create project with the specified name. Default"
  puts "                       name is the name of the project from where this"
  puts "                       script was generated.\n"
  puts "\[--help\]               Print help information for this script"
  puts "-------------------------------------------------------------------------\n"
  exit 0
}

if { $::argc > 0 } {
  for {set i 0} {$i < $::argc} {incr i} {
    set option [string trim [lindex $::argv $i]]
    switch -regexp -- $option {
      "--origin_dir"   { incr i; set origin_dir [lindex $::argv $i] }
      "--project_name" { incr i; set _xil_proj_name_ [lindex $::argv $i] }
      "--help"         { print_help }
      default {
        if { [regexp {^-} $option] } {
          puts "ERROR: Unknown option '$option' specified, please type '$script_file -tclargs --help' for usage info.\n"
          return 1
        }
      }
    }
  }
}

# Set the directory path for the original project from where this script was exported
set orig_proj_dir "[file normalize "$origin_dir/SipHashZcu106"]"

# Create project
create_project ${_xil_proj_name_} ./${_xil_proj_name_} -part xczu7ev-ffvc1156-2-e

# Set the directory path for the new project
set proj_dir [get_property directory [current_project]]

# Set project properties
set obj [current_project]
set_property -name "board_part" -value "xilinx.com:zcu106:part0:2.5" -objects $obj
set_property -name "compxlib.activehdl_compiled_library_dir" -value "$proj_dir/${_xil_proj_name_}.cache/compile_simlib/activehdl" -objects $obj
set_property -name "compxlib.funcsim" -value "1" -objects $obj
set_property -name "compxlib.ies_compiled_library_dir" -value "$proj_dir/${_xil_proj_name_}.cache/compile_simlib/ies" -objects $obj
set_property -name "compxlib.modelsim_compiled_library_dir" -value "$proj_dir/${_xil_proj_name_}.cache/compile_simlib/modelsim" -objects $obj
set_property -name "compxlib.overwrite_libs" -value "0" -objects $obj
set_property -name "compxlib.questa_compiled_library_dir" -value "$proj_dir/${_xil_proj_name_}.cache/compile_simlib/questa" -objects $obj
set_property -name "compxlib.riviera_compiled_library_dir" -value "$proj_dir/${_xil_proj_name_}.cache/compile_simlib/riviera" -objects $obj
set_property -name "compxlib.timesim" -value "1" -objects $obj
set_property -name "compxlib.vcs_compiled_library_dir" -value "$proj_dir/${_xil_proj_name_}.cache/compile_simlib/vcs" -objects $obj
set_property -name "compxlib.xsim_compiled_library_dir" -value "" -objects $obj
set_property -name "corecontainer.enable" -value "0" -objects $obj
set_property -name "default_lib" -value "xil_defaultlib" -objects $obj
set_property -name "enable_optional_runs_sta" -value "0" -objects $obj
set_property -name "enable_vhdl_2008" -value "1" -objects $obj
set_property -name "generate_ip_upgrade_log" -value "1" -objects $obj
set_property -name "ip_cache_permissions" -value "read write" -objects $obj
set_property -name "ip_interface_inference_priority" -value "" -objects $obj
set_property -name "ip_output_repo" -value "$proj_dir/${_xil_proj_name_}.cache/ip" -objects $obj
set_property -name "legacy_ip_repo_paths" -value "" -objects $obj
set_property -name "mem.enable_memory_map_generation" -value "1" -objects $obj
set_property -name "platform.board_id" -value "zcu106" -objects $obj
set_property -name "platform.default_output_type" -value "undefined" -objects $obj
set_property -name "platform.design_intent.datacenter" -value "undefined" -objects $obj
set_property -name "platform.design_intent.embedded" -value "undefined" -objects $obj
set_property -name "platform.design_intent.external_host" -value "undefined" -objects $obj
set_property -name "platform.design_intent.server_managed" -value "undefined" -objects $obj
set_property -name "platform.rom.debug_type" -value "0" -objects $obj
set_property -name "platform.rom.prom_type" -value "0" -objects $obj
set_property -name "platform.slrconstraintmode" -value "0" -objects $obj
set_property -name "project_type" -value "Default" -objects $obj
set_property -name "pr_flow" -value "0" -objects $obj
set_property -name "sim.central_dir" -value "$proj_dir/${_xil_proj_name_}.ip_user_files" -objects $obj
set_property -name "sim.ip.auto_export_scripts" -value "1" -objects $obj
set_property -name "sim.use_ip_compiled_libs" -value "1" -objects $obj
set_property -name "simulator.activehdl_install_dir" -value "" -objects $obj
set_property -name "simulator.ies_install_dir" -value "" -objects $obj
set_property -name "simulator.modelsim_install_dir" -value "" -objects $obj
set_property -name "simulator.questa_install_dir" -value "" -objects $obj
set_property -name "simulator.riviera_install_dir" -value "" -objects $obj
set_property -name "simulator.vcs_install_dir" -value "" -objects $obj
set_property -name "simulator.xcelium_install_dir" -value "" -objects $obj
set_property -name "simulator_language" -value "Mixed" -objects $obj
set_property -name "source_mgmt_mode" -value "All" -objects $obj
set_property -name "target_language" -value "VHDL" -objects $obj
set_property -name "target_simulator" -value "XSim" -objects $obj
set_property -name "tool_flow" -value "Vivado" -objects $obj
set_property -name "webtalk.activehdl_export_sim" -value "2" -objects $obj
set_property -name "webtalk.ies_export_sim" -value "2" -objects $obj
set_property -name "webtalk.modelsim_export_sim" -value "2" -objects $obj
set_property -name "webtalk.questa_export_sim" -value "2" -objects $obj
set_property -name "webtalk.riviera_export_sim" -value "2" -objects $obj
set_property -name "webtalk.vcs_export_sim" -value "2" -objects $obj
set_property -name "webtalk.xsim_export_sim" -value "2" -objects $obj
set_property -name "xpm_libraries" -value "XPM_CDC XPM_FIFO XPM_MEMORY" -objects $obj
set_property -name "xsim.array_display_limit" -value "1024" -objects $obj
set_property -name "xsim.radix" -value "hex" -objects $obj
set_property -name "xsim.time_unit" -value "ns" -objects $obj
set_property -name "xsim.trace_limit" -value "65536" -objects $obj

# Create 'sources_1' fileset (if not found)
if {[string equal [get_filesets -quiet sources_1] ""]} {
  create_fileset -srcset sources_1
}

# Set IP repository paths
set obj [get_filesets sources_1]
if { $obj != {} } {
   set_property "ip_repo_paths" "[file normalize "$origin_dir/../ip_repo/SipHash_X_Y_1.0"]" $obj

   # Rebuild user ip_repo's index before adding any source files
   update_ip_catalog -rebuild
}

# Set 'sources_1' fileset object
# None?

# Set 'sources_1' fileset file properties for remote files
# None?

# Create 'constrs_1' fileset (if not found)
if {[string equal [get_filesets -quiet constrs_1] ""]} {
  create_fileset -constrset constrs_1
}

# Set 'constrs_1' fileset object
set obj [get_filesets constrs_1]

# Empty (no sources present)

# Set 'constrs_1' fileset properties
set obj [get_filesets constrs_1]
set_property -name "constrs_type" -value "XDC" -objects $obj
set_property -name "name" -value "constrs_1" -objects $obj
set_property -name "target_constrs_file" -value "" -objects $obj

# Create 'sim_1' fileset (if not found)
if {[string equal [get_filesets -quiet sim_1] ""]} {
  create_fileset -simset sim_1
}

# Set 'sim_1' fileset object
set obj [get_filesets sim_1]
# Empty (no sources present)

# Set 'sim_1' fileset properties
set obj [get_filesets sim_1]
set_property -name "32bit" -value "0" -objects $obj
set_property -name "generic" -value "" -objects $obj
set_property -name "hbs.configure_design_for_hier_access" -value "1" -objects $obj
set_property -name "include_dirs" -value "" -objects $obj
set_property -name "incremental" -value "1" -objects $obj
set_property -name "name" -value "sim_1" -objects $obj
set_property -name "nl.cell" -value "" -objects $obj
set_property -name "nl.incl_unisim_models" -value "0" -objects $obj
set_property -name "nl.process_corner" -value "slow" -objects $obj
set_property -name "nl.rename_top" -value "" -objects $obj
set_property -name "nl.sdf_anno" -value "1" -objects $obj
set_property -name "nl.write_all_overrides" -value "0" -objects $obj
set_property -name "source_set" -value "sources_1" -objects $obj
set_property -name "systemc_include_dirs" -value "" -objects $obj
set_property -name "top" -value "SipHashZcu106_wrapper" -objects $obj
set_property -name "top_lib" -value "xil_defaultlib" -objects $obj
set_property -name "transport_int_delay" -value "0" -objects $obj
set_property -name "transport_path_delay" -value "0" -objects $obj
set_property -name "verilog_define" -value "" -objects $obj
set_property -name "verilog_uppercase" -value "0" -objects $obj
set_property -name "xelab.dll" -value "0" -objects $obj
set_property -name "xsim.compile.tcl.pre" -value "" -objects $obj
set_property -name "xsim.compile.xsc.more_options" -value "" -objects $obj
set_property -name "xsim.compile.xvhdl.more_options" -value "" -objects $obj
set_property -name "xsim.compile.xvhdl.nosort" -value "1" -objects $obj
set_property -name "xsim.compile.xvhdl.relax" -value "1" -objects $obj
set_property -name "xsim.compile.xvlog.more_options" -value "" -objects $obj
set_property -name "xsim.compile.xvlog.nosort" -value "1" -objects $obj
set_property -name "xsim.compile.xvlog.relax" -value "1" -objects $obj
set_property -name "xsim.elaborate.debug_level" -value "typical" -objects $obj
set_property -name "xsim.elaborate.load_glbl" -value "1" -objects $obj
set_property -name "xsim.elaborate.mt_level" -value "auto" -objects $obj
set_property -name "xsim.elaborate.rangecheck" -value "0" -objects $obj
set_property -name "xsim.elaborate.relax" -value "1" -objects $obj
set_property -name "xsim.elaborate.sdf_delay" -value "sdfmax" -objects $obj
set_property -name "xsim.elaborate.snapshot" -value "" -objects $obj
set_property -name "xsim.elaborate.xelab.more_options" -value "" -objects $obj
set_property -name "xsim.elaborate.xsc.more_options" -value "" -objects $obj
set_property -name "xsim.simulate.add_positional" -value "0" -objects $obj
set_property -name "xsim.simulate.custom_tcl" -value "" -objects $obj
set_property -name "xsim.simulate.log_all_signals" -value "0" -objects $obj
set_property -name "xsim.simulate.no_quit" -value "0" -objects $obj
set_property -name "xsim.simulate.runtime" -value "1000ns" -objects $obj
set_property -name "xsim.simulate.saif" -value "" -objects $obj
set_property -name "xsim.simulate.saif_all_signals" -value "0" -objects $obj
set_property -name "xsim.simulate.saif_scope" -value "" -objects $obj
set_property -name "xsim.simulate.tcl.post" -value "" -objects $obj
set_property -name "xsim.simulate.wdb" -value "" -objects $obj
set_property -name "xsim.simulate.xsim.more_options" -value "" -objects $obj

# Set 'utils_1' fileset object
set obj [get_filesets utils_1]
# Empty (no sources present)

# Set 'utils_1' fileset properties
set obj [get_filesets utils_1]
set_property -name "name" -value "utils_1" -objects $obj


# Adding sources referenced in BDs, if not already added


# Proc to create BD SipHashZcu106
proc cr_bd_SipHashZcu106 { parentCell } {

  # CHANGE DESIGN NAME HERE
  set design_name SipHashZcu106

  common::send_gid_msg -ssname BD::TCL -id 2010 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

  create_bd_design $design_name

  set bCheckIPsPassed 1
  ##################################################################
  # CHECK IPs
  ##################################################################
  set bCheckIPs 1
  if { $bCheckIPs == 1 } {
     set list_check_ips "\ 
  xilinx.com:user:SipHash_X_Y:1.0\
  xilinx.com:ip:axi_dma:7.1\
  xilinx.com:ip:axi_timer:2.0\
  xilinx.com:ip:proc_sys_reset:5.0\
  xilinx.com:ip:smartconnect:1.0\
  xilinx.com:ip:zynq_ultra_ps_e:3.3\
  "

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

  }

  if { $bCheckIPsPassed != 1 } {
    common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
    return 3
  }

  variable script_folder

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports

  # Create instance: SipHash_X_Y_0, and set properties
  set SipHash_X_Y_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_0 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_0

  # Create instance: SipHash_X_Y_1, and set properties
  set SipHash_X_Y_1 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_1 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_1

  # Create instance: SipHash_X_Y_2, and set properties
  set SipHash_X_Y_2 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_2 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_2

  # Create instance: SipHash_X_Y_3, and set properties
  set SipHash_X_Y_3 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_3 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_3

  # Create instance: SipHash_X_Y_4, and set properties
  set SipHash_X_Y_4 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_4 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_4

  # Create instance: SipHash_X_Y_5, and set properties
  set SipHash_X_Y_5 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_5 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_5

  # Create instance: SipHash_X_Y_6, and set properties
  set SipHash_X_Y_6 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_6 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_6

  # Create instance: SipHash_X_Y_7, and set properties
  set SipHash_X_Y_7 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_7 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_7

  # Create instance: SipHash_X_Y_8, and set properties
  set SipHash_X_Y_8 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_8 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_8

  # Create instance: SipHash_X_Y_9, and set properties
  set SipHash_X_Y_9 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_9 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_9

  # Create instance: SipHash_X_Y_10, and set properties
  set SipHash_X_Y_10 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_10 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_10

  # Create instance: SipHash_X_Y_11, and set properties
  set SipHash_X_Y_11 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_11 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_11

  # Create instance: SipHash_X_Y_12, and set properties
  set SipHash_X_Y_12 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_12 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_12

  # Create instance: SipHash_X_Y_13, and set properties
  set SipHash_X_Y_13 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_13 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_13

  # Create instance: SipHash_X_Y_14, and set properties
  set SipHash_X_Y_14 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_14 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_14

  # Create instance: SipHash_X_Y_15, and set properties
  set SipHash_X_Y_15 [ create_bd_cell -type ip -vlnv xilinx.com:user:SipHash_X_Y:1.0 SipHash_X_Y_15 ]
  set_property -dict [ list \
   CONFIG.NUM_COMPRESSIONS {1} \
   CONFIG.NUM_FINALIZATIONS {3} \
 ] $SipHash_X_Y_15

  # Create instance: axi_dma_0, and set properties
  set axi_dma_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_0 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_0

  # Create instance: axi_dma_1, and set properties
  set axi_dma_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_1 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_1

  # Create instance: axi_dma_2, and set properties
  set axi_dma_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_2 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_2

  # Create instance: axi_dma_3, and set properties
  set axi_dma_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_3 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_3

  # Create instance: axi_dma_4, and set properties
  set axi_dma_4 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_4 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_4

  # Create instance: axi_dma_5, and set properties
  set axi_dma_5 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_5 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_5

  # Create instance: axi_dma_6, and set properties
  set axi_dma_6 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_6 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_6

  # Create instance: axi_dma_7, and set properties
  set axi_dma_7 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_7 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_7

  # Create instance: axi_dma_8, and set properties
  set axi_dma_8 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_8 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_8

  # Create instance: axi_dma_9, and set properties
  set axi_dma_9 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_9 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_9

  # Create instance: axi_dma_10, and set properties
  set axi_dma_10 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_10 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_10

  # Create instance: axi_dma_11, and set properties
  set axi_dma_11 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_11 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_11

  # Create instance: axi_dma_12, and set properties
  set axi_dma_12 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_12 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_12

  # Create instance: axi_dma_13, and set properties
  set axi_dma_13 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_13 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_13

  # Create instance: axi_dma_14, and set properties
  set axi_dma_14 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_14 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_14

  # Create instance: axi_dma_15, and set properties
  set axi_dma_15 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_dma:7.1 axi_dma_15 ]
  set_property -dict [ list \
   CONFIG.c_addr_width {64} \
   CONFIG.c_include_s2mm {0} \
   CONFIG.c_include_sg {0} \
   CONFIG.c_m_axi_mm2s_data_width {64} \
   CONFIG.c_m_axis_mm2s_tdata_width {64} \
   CONFIG.c_mm2s_burst_size {8} \
   CONFIG.c_sg_include_stscntrl_strm {0} \
   CONFIG.c_sg_length_width {26} \
 ] $axi_dma_15

  # Create instance: axi_interconnect_0, and set properties
  set axi_interconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_interconnect:2.1 axi_interconnect_0 ]
  set_property -dict [ list \
   CONFIG.NUM_MI {33} \
 ] $axi_interconnect_0

  # Create instance: axi_timer_0, and set properties
  set axi_timer_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:axi_timer:2.0 axi_timer_0 ]
  set_property -dict [ list \
   CONFIG.enable_timer2 {0} \
 ] $axi_timer_0

  # Create instance: rst_ps8_0_187M, and set properties
  set rst_ps8_0_187M [ create_bd_cell -type ip -vlnv xilinx.com:ip:proc_sys_reset:5.0 rst_ps8_0_187M ]

  # Create instance: smartconnect_0, and set properties
  set smartconnect_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_0 ]
  set_property -dict [ list \
   CONFIG.ADVANCED_PROPERTIES { __view__ { clocking { SW0 { ASSOCIATED_CLK aclk1 } } }} \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {4} \
 ] $smartconnect_0

  # Create instance: smartconnect_1, and set properties
  set smartconnect_1 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_1 ]
  set_property -dict [ list \
   CONFIG.ADVANCED_PROPERTIES { __view__ { clocking { SW0 { ASSOCIATED_CLK aclk1 } } }} \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {4} \
 ] $smartconnect_1

  # Create instance: smartconnect_2, and set properties
  set smartconnect_2 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_2 ]
  set_property -dict [ list \
   CONFIG.ADVANCED_PROPERTIES { __view__ { clocking { SW0 { ASSOCIATED_CLK aclk1 } } }} \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {4} \
 ] $smartconnect_2

  # Create instance: smartconnect_3, and set properties
  set smartconnect_3 [ create_bd_cell -type ip -vlnv xilinx.com:ip:smartconnect:1.0 smartconnect_3 ]
  set_property -dict [ list \
   CONFIG.ADVANCED_PROPERTIES { __view__ { clocking { SW0 { ASSOCIATED_CLK aclk1 } } }} \
   CONFIG.NUM_CLKS {2} \
   CONFIG.NUM_SI {4} \
 ] $smartconnect_3

  # Create instance: zynq_ultra_ps_e_0, and set properties
  set zynq_ultra_ps_e_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:zynq_ultra_ps_e:3.3 zynq_ultra_ps_e_0 ]
  set_property -dict [ list \
   CONFIG.PSU_BANK_0_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_1_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_BANK_2_IO_STANDARD {LVCMOS18} \
   CONFIG.PSU_DDR_RAM_HIGHADDR {0xFFFFFFFF} \
   CONFIG.PSU_DDR_RAM_HIGHADDR_OFFSET {0x800000000} \
   CONFIG.PSU_DDR_RAM_LOWADDR_OFFSET {0x80000000} \
   CONFIG.PSU_DYNAMIC_DDR_CONFIG_EN {1} \
   CONFIG.PSU_MIO_0_DIRECTION {out} \
   CONFIG.PSU_MIO_0_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_0_POLARITY {Default} \
   CONFIG.PSU_MIO_10_DIRECTION {inout} \
   CONFIG.PSU_MIO_10_POLARITY {Default} \
   CONFIG.PSU_MIO_11_DIRECTION {inout} \
   CONFIG.PSU_MIO_11_POLARITY {Default} \
   CONFIG.PSU_MIO_12_DIRECTION {out} \
   CONFIG.PSU_MIO_12_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_12_POLARITY {Default} \
   CONFIG.PSU_MIO_13_DIRECTION {inout} \
   CONFIG.PSU_MIO_13_POLARITY {Default} \
   CONFIG.PSU_MIO_14_DIRECTION {inout} \
   CONFIG.PSU_MIO_14_POLARITY {Default} \
   CONFIG.PSU_MIO_15_DIRECTION {inout} \
   CONFIG.PSU_MIO_15_POLARITY {Default} \
   CONFIG.PSU_MIO_16_DIRECTION {inout} \
   CONFIG.PSU_MIO_16_POLARITY {Default} \
   CONFIG.PSU_MIO_17_DIRECTION {inout} \
   CONFIG.PSU_MIO_17_POLARITY {Default} \
   CONFIG.PSU_MIO_18_DIRECTION {in} \
   CONFIG.PSU_MIO_18_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_18_POLARITY {Default} \
   CONFIG.PSU_MIO_18_SLEW {fast} \
   CONFIG.PSU_MIO_19_DIRECTION {out} \
   CONFIG.PSU_MIO_19_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_19_POLARITY {Default} \
   CONFIG.PSU_MIO_1_DIRECTION {inout} \
   CONFIG.PSU_MIO_1_POLARITY {Default} \
   CONFIG.PSU_MIO_20_DIRECTION {out} \
   CONFIG.PSU_MIO_20_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_20_POLARITY {Default} \
   CONFIG.PSU_MIO_21_DIRECTION {in} \
   CONFIG.PSU_MIO_21_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_21_POLARITY {Default} \
   CONFIG.PSU_MIO_21_SLEW {fast} \
   CONFIG.PSU_MIO_22_DIRECTION {inout} \
   CONFIG.PSU_MIO_22_POLARITY {Default} \
   CONFIG.PSU_MIO_23_DIRECTION {inout} \
   CONFIG.PSU_MIO_23_POLARITY {Default} \
   CONFIG.PSU_MIO_24_DIRECTION {out} \
   CONFIG.PSU_MIO_24_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_24_POLARITY {Default} \
   CONFIG.PSU_MIO_25_DIRECTION {in} \
   CONFIG.PSU_MIO_25_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_25_POLARITY {Default} \
   CONFIG.PSU_MIO_25_SLEW {fast} \
   CONFIG.PSU_MIO_26_DIRECTION {inout} \
   CONFIG.PSU_MIO_26_POLARITY {Default} \
   CONFIG.PSU_MIO_27_DIRECTION {out} \
   CONFIG.PSU_MIO_27_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_27_POLARITY {Default} \
   CONFIG.PSU_MIO_28_DIRECTION {in} \
   CONFIG.PSU_MIO_28_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_28_POLARITY {Default} \
   CONFIG.PSU_MIO_28_SLEW {fast} \
   CONFIG.PSU_MIO_29_DIRECTION {out} \
   CONFIG.PSU_MIO_29_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_29_POLARITY {Default} \
   CONFIG.PSU_MIO_2_DIRECTION {inout} \
   CONFIG.PSU_MIO_2_POLARITY {Default} \
   CONFIG.PSU_MIO_30_DIRECTION {in} \
   CONFIG.PSU_MIO_30_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_30_POLARITY {Default} \
   CONFIG.PSU_MIO_30_SLEW {fast} \
   CONFIG.PSU_MIO_31_DIRECTION {inout} \
   CONFIG.PSU_MIO_31_POLARITY {Default} \
   CONFIG.PSU_MIO_32_DIRECTION {out} \
   CONFIG.PSU_MIO_32_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_32_POLARITY {Default} \
   CONFIG.PSU_MIO_33_DIRECTION {out} \
   CONFIG.PSU_MIO_33_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_33_POLARITY {Default} \
   CONFIG.PSU_MIO_34_DIRECTION {out} \
   CONFIG.PSU_MIO_34_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_34_POLARITY {Default} \
   CONFIG.PSU_MIO_35_DIRECTION {out} \
   CONFIG.PSU_MIO_35_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_35_POLARITY {Default} \
   CONFIG.PSU_MIO_36_DIRECTION {out} \
   CONFIG.PSU_MIO_36_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_36_POLARITY {Default} \
   CONFIG.PSU_MIO_37_DIRECTION {out} \
   CONFIG.PSU_MIO_37_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_37_POLARITY {Default} \
   CONFIG.PSU_MIO_38_DIRECTION {inout} \
   CONFIG.PSU_MIO_38_POLARITY {Default} \
   CONFIG.PSU_MIO_39_DIRECTION {inout} \
   CONFIG.PSU_MIO_39_POLARITY {Default} \
   CONFIG.PSU_MIO_3_DIRECTION {inout} \
   CONFIG.PSU_MIO_3_POLARITY {Default} \
   CONFIG.PSU_MIO_40_DIRECTION {inout} \
   CONFIG.PSU_MIO_40_POLARITY {Default} \
   CONFIG.PSU_MIO_41_DIRECTION {inout} \
   CONFIG.PSU_MIO_41_POLARITY {Default} \
   CONFIG.PSU_MIO_42_DIRECTION {inout} \
   CONFIG.PSU_MIO_42_POLARITY {Default} \
   CONFIG.PSU_MIO_43_DIRECTION {out} \
   CONFIG.PSU_MIO_43_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_43_POLARITY {Default} \
   CONFIG.PSU_MIO_44_DIRECTION {in} \
   CONFIG.PSU_MIO_44_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_44_POLARITY {Default} \
   CONFIG.PSU_MIO_44_SLEW {fast} \
   CONFIG.PSU_MIO_45_DIRECTION {in} \
   CONFIG.PSU_MIO_45_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_45_POLARITY {Default} \
   CONFIG.PSU_MIO_45_SLEW {fast} \
   CONFIG.PSU_MIO_46_DIRECTION {inout} \
   CONFIG.PSU_MIO_46_POLARITY {Default} \
   CONFIG.PSU_MIO_47_DIRECTION {inout} \
   CONFIG.PSU_MIO_47_POLARITY {Default} \
   CONFIG.PSU_MIO_48_DIRECTION {inout} \
   CONFIG.PSU_MIO_48_POLARITY {Default} \
   CONFIG.PSU_MIO_49_DIRECTION {inout} \
   CONFIG.PSU_MIO_49_POLARITY {Default} \
   CONFIG.PSU_MIO_4_DIRECTION {inout} \
   CONFIG.PSU_MIO_4_POLARITY {Default} \
   CONFIG.PSU_MIO_50_DIRECTION {inout} \
   CONFIG.PSU_MIO_50_POLARITY {Default} \
   CONFIG.PSU_MIO_51_DIRECTION {out} \
   CONFIG.PSU_MIO_51_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_51_POLARITY {Default} \
   CONFIG.PSU_MIO_52_DIRECTION {in} \
   CONFIG.PSU_MIO_52_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_52_POLARITY {Default} \
   CONFIG.PSU_MIO_52_SLEW {fast} \
   CONFIG.PSU_MIO_53_DIRECTION {in} \
   CONFIG.PSU_MIO_53_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_53_POLARITY {Default} \
   CONFIG.PSU_MIO_53_SLEW {fast} \
   CONFIG.PSU_MIO_54_DIRECTION {inout} \
   CONFIG.PSU_MIO_54_POLARITY {Default} \
   CONFIG.PSU_MIO_55_DIRECTION {in} \
   CONFIG.PSU_MIO_55_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_55_POLARITY {Default} \
   CONFIG.PSU_MIO_55_SLEW {fast} \
   CONFIG.PSU_MIO_56_DIRECTION {inout} \
   CONFIG.PSU_MIO_56_POLARITY {Default} \
   CONFIG.PSU_MIO_57_DIRECTION {inout} \
   CONFIG.PSU_MIO_57_POLARITY {Default} \
   CONFIG.PSU_MIO_58_DIRECTION {out} \
   CONFIG.PSU_MIO_58_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_58_POLARITY {Default} \
   CONFIG.PSU_MIO_59_DIRECTION {inout} \
   CONFIG.PSU_MIO_59_POLARITY {Default} \
   CONFIG.PSU_MIO_5_DIRECTION {out} \
   CONFIG.PSU_MIO_5_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_5_POLARITY {Default} \
   CONFIG.PSU_MIO_60_DIRECTION {inout} \
   CONFIG.PSU_MIO_60_POLARITY {Default} \
   CONFIG.PSU_MIO_61_DIRECTION {inout} \
   CONFIG.PSU_MIO_61_POLARITY {Default} \
   CONFIG.PSU_MIO_62_DIRECTION {inout} \
   CONFIG.PSU_MIO_62_POLARITY {Default} \
   CONFIG.PSU_MIO_63_DIRECTION {inout} \
   CONFIG.PSU_MIO_63_POLARITY {Default} \
   CONFIG.PSU_MIO_64_DIRECTION {out} \
   CONFIG.PSU_MIO_64_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_64_POLARITY {Default} \
   CONFIG.PSU_MIO_65_DIRECTION {out} \
   CONFIG.PSU_MIO_65_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_65_POLARITY {Default} \
   CONFIG.PSU_MIO_66_DIRECTION {out} \
   CONFIG.PSU_MIO_66_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_66_POLARITY {Default} \
   CONFIG.PSU_MIO_67_DIRECTION {out} \
   CONFIG.PSU_MIO_67_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_67_POLARITY {Default} \
   CONFIG.PSU_MIO_68_DIRECTION {out} \
   CONFIG.PSU_MIO_68_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_68_POLARITY {Default} \
   CONFIG.PSU_MIO_69_DIRECTION {out} \
   CONFIG.PSU_MIO_69_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_69_POLARITY {Default} \
   CONFIG.PSU_MIO_6_DIRECTION {out} \
   CONFIG.PSU_MIO_6_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_6_POLARITY {Default} \
   CONFIG.PSU_MIO_70_DIRECTION {in} \
   CONFIG.PSU_MIO_70_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_70_POLARITY {Default} \
   CONFIG.PSU_MIO_70_SLEW {fast} \
   CONFIG.PSU_MIO_71_DIRECTION {in} \
   CONFIG.PSU_MIO_71_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_71_POLARITY {Default} \
   CONFIG.PSU_MIO_71_SLEW {fast} \
   CONFIG.PSU_MIO_72_DIRECTION {in} \
   CONFIG.PSU_MIO_72_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_72_POLARITY {Default} \
   CONFIG.PSU_MIO_72_SLEW {fast} \
   CONFIG.PSU_MIO_73_DIRECTION {in} \
   CONFIG.PSU_MIO_73_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_73_POLARITY {Default} \
   CONFIG.PSU_MIO_73_SLEW {fast} \
   CONFIG.PSU_MIO_74_DIRECTION {in} \
   CONFIG.PSU_MIO_74_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_74_POLARITY {Default} \
   CONFIG.PSU_MIO_74_SLEW {fast} \
   CONFIG.PSU_MIO_75_DIRECTION {in} \
   CONFIG.PSU_MIO_75_DRIVE_STRENGTH {12} \
   CONFIG.PSU_MIO_75_POLARITY {Default} \
   CONFIG.PSU_MIO_75_SLEW {fast} \
   CONFIG.PSU_MIO_76_DIRECTION {out} \
   CONFIG.PSU_MIO_76_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_76_POLARITY {Default} \
   CONFIG.PSU_MIO_77_DIRECTION {inout} \
   CONFIG.PSU_MIO_77_POLARITY {Default} \
   CONFIG.PSU_MIO_7_DIRECTION {out} \
   CONFIG.PSU_MIO_7_INPUT_TYPE {cmos} \
   CONFIG.PSU_MIO_7_POLARITY {Default} \
   CONFIG.PSU_MIO_8_DIRECTION {inout} \
   CONFIG.PSU_MIO_8_POLARITY {Default} \
   CONFIG.PSU_MIO_9_DIRECTION {inout} \
   CONFIG.PSU_MIO_9_POLARITY {Default} \
   CONFIG.PSU_MIO_TREE_PERIPHERALS {Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Feedback Clk#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#Quad SPI Flash#GPIO0 MIO#I2C 0#I2C 0#I2C 1#I2C 1#UART 0#UART 0#UART 1#UART 1#GPIO0 MIO#GPIO0 MIO#CAN 1#CAN 1#GPIO1 MIO#DPAUX#DPAUX#DPAUX#DPAUX#GPIO1 MIO#PMU GPO 0#PMU GPO 1#PMU GPO 2#PMU GPO 3#PMU GPO 4#PMU GPO 5#GPIO1 MIO#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#SD 1#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#USB 0#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#Gem 3#MDIO 3#MDIO 3} \
   CONFIG.PSU_MIO_TREE_SIGNALS {sclk_out#miso_mo1#mo2#mo3#mosi_mi0#n_ss_out#clk_for_lpbk#n_ss_out_upper#mo_upper[0]#mo_upper[1]#mo_upper[2]#mo_upper[3]#sclk_out_upper#gpio0[13]#scl_out#sda_out#scl_out#sda_out#rxd#txd#txd#rxd#gpio0[22]#gpio0[23]#phy_tx#phy_rx#gpio1[26]#dp_aux_data_out#dp_hot_plug_detect#dp_aux_data_oe#dp_aux_data_in#gpio1[31]#gpo[0]#gpo[1]#gpo[2]#gpo[3]#gpo[4]#gpo[5]#gpio1[38]#sdio1_data_out[4]#sdio1_data_out[5]#sdio1_data_out[6]#sdio1_data_out[7]#sdio1_bus_pow#sdio1_wp#sdio1_cd_n#sdio1_data_out[0]#sdio1_data_out[1]#sdio1_data_out[2]#sdio1_data_out[3]#sdio1_cmd_out#sdio1_clk_out#ulpi_clk_in#ulpi_dir#ulpi_tx_data[2]#ulpi_nxt#ulpi_tx_data[0]#ulpi_tx_data[1]#ulpi_stp#ulpi_tx_data[3]#ulpi_tx_data[4]#ulpi_tx_data[5]#ulpi_tx_data[6]#ulpi_tx_data[7]#rgmii_tx_clk#rgmii_txd[0]#rgmii_txd[1]#rgmii_txd[2]#rgmii_txd[3]#rgmii_tx_ctl#rgmii_rx_clk#rgmii_rxd[0]#rgmii_rxd[1]#rgmii_rxd[2]#rgmii_rxd[3]#rgmii_rx_ctl#gem3_mdc#gem3_mdio_out} \
   CONFIG.PSU_SD1_INTERNAL_BUS_WIDTH {8} \
   CONFIG.PSU_USB3__DUAL_CLOCK_ENABLE {1} \
   CONFIG.PSU__ACT_DDR_FREQ_MHZ {1066.560059} \
   CONFIG.PSU__CAN1__GRP_CLK__ENABLE {0} \
   CONFIG.PSU__CAN1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__CAN1__PERIPHERAL__IO {MIO 24 .. 25} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__ACT_FREQMHZ {1199.880127} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__FREQMHZ {1200} \
   CONFIG.PSU__CRF_APB__ACPU_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FBDIV {72} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__APLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__APLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__APLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_FPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TRACE_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__DBG_TSTMP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__ACT_FREQMHZ {533.280029} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__FREQMHZ {1067} \
   CONFIG.PSU__CRF_APB__DDR_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__ACT_FREQMHZ {599.940063} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__DPDMA_REF_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FBDIV {64} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__DPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__DPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__DPLL_TO_LPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__ACT_FREQMHZ {24.164251} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR0 {20} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_AUDIO_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_AUDIO__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__ACT_FREQMHZ {26.849169} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR0 {18} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_STC_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__ACT_FREQMHZ {299.970032} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRF_APB__DP_VIDEO_REF_CTRL__SRCSEL {VPLL} \
   CONFIG.PSU__CRF_APB__DP_VIDEO__FRAC_ENABLED {0} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__ACT_FREQMHZ {599.940063} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__FREQMHZ {600} \
   CONFIG.PSU__CRF_APB__GDMA_REF_CTRL__SRCSEL {APLL} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__ACT_FREQMHZ {499.950043} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__DIVISOR0 {1} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRF_APB__GPU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__PCIE_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRF_APB__SATA_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__DIVISOR0 {5} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRF_APB__TOPSW_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__ACT_FREQMHZ {533.280029} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__FREQMHZ {533.33} \
   CONFIG.PSU__CRF_APB__TOPSW_MAIN_CTRL__SRCSEL {DPLL} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRF_APB__VPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRF_APB__VPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRF_APB__VPLL_TO_LPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__ACT_FREQMHZ {499.950043} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__ADMA_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__AFI6_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__ACT_FREQMHZ {49.995003} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR0 {30} \
   CONFIG.PSU__CRL_APB__AMS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__CAN1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__ACT_FREQMHZ {499.950043} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__CPU_R5_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__DBG_LPD_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__DLL_REF_CTRL__ACT_FREQMHZ {1499.850098} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__ACT_FREQMHZ {124.987511} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__GEM3_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__GEM_TSU_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__I2C1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FBDIV {90} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__IOPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__IOPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__IOPLL_TO_FPD_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__IOU_SWITCH_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__LPD_LSBUS_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__ACT_FREQMHZ {499.950043} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__FREQMHZ {500} \
   CONFIG.PSU__CRL_APB__LPD_SWITCH_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__NAND_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__ACT_FREQMHZ {187.481262} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__PCAP_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__ACT_FREQMHZ {187.481262} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__PL0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__ACT_FREQMHZ {322.190033} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR0 {3} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__FREQMHZ {333} \
   CONFIG.PSU__CRL_APB__PL1_REF_CTRL__SRCSEL {RPLL} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL2_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR0 {4} \
   CONFIG.PSU__CRL_APB__PL3_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__ACT_FREQMHZ {124.987511} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR0 {12} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__FREQMHZ {125} \
   CONFIG.PSU__CRL_APB__QSPI_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__DIV2 {1} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FBDIV {58} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__FRACDATA {0.000000} \
   CONFIG.PSU__CRL_APB__RPLL_CTRL__SRCSEL {PSS_REF_CLK} \
   CONFIG.PSU__CRL_APB__RPLL_FRAC_CFG__ENABLED {0} \
   CONFIG.PSU__CRL_APB__RPLL_TO_FPD_CTRL__DIVISOR0 {2} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SDIO0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__ACT_FREQMHZ {187.481262} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR0 {8} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__FREQMHZ {200} \
   CONFIG.PSU__CRL_APB__SDIO1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR0 {7} \
   CONFIG.PSU__CRL_APB__SPI1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__TIMESTAMP_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART0_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR0 {15} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__FREQMHZ {100} \
   CONFIG.PSU__CRL_APB__UART1_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__ACT_FREQMHZ {249.975021} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__FREQMHZ {250} \
   CONFIG.PSU__CRL_APB__USB0_BUS_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR0 {6} \
   CONFIG.PSU__CRL_APB__USB1_BUS_REF_CTRL__DIVISOR1 {1} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__ACT_FREQMHZ {19.998001} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR0 {25} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__DIVISOR1 {3} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__FREQMHZ {20} \
   CONFIG.PSU__CRL_APB__USB3_DUAL_REF_CTRL__SRCSEL {IOPLL} \
   CONFIG.PSU__CRL_APB__USB3__ENABLE {1} \
   CONFIG.PSU__CSUPMU__PERIPHERAL__VALID {1} \
   CONFIG.PSU__DDRC__ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__BANK_ADDR_COUNT {2} \
   CONFIG.PSU__DDRC__BG_ADDR_COUNT {2} \
   CONFIG.PSU__DDRC__BRC_MAPPING {ROW_BANK_COL} \
   CONFIG.PSU__DDRC__BUS_WIDTH {64 Bit} \
   CONFIG.PSU__DDRC__CL {15} \
   CONFIG.PSU__DDRC__CLOCK_STOP_EN {0} \
   CONFIG.PSU__DDRC__COL_ADDR_COUNT {10} \
   CONFIG.PSU__DDRC__COMPONENTS {UDIMM} \
   CONFIG.PSU__DDRC__CWL {14} \
   CONFIG.PSU__DDRC__DDR3L_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__DDR4_ADDR_MAPPING {0} \
   CONFIG.PSU__DDRC__DDR4_CAL_MODE_ENABLE {0} \
   CONFIG.PSU__DDRC__DDR4_CRC_CONTROL {0} \
   CONFIG.PSU__DDRC__DDR4_T_REF_MODE {0} \
   CONFIG.PSU__DDRC__DDR4_T_REF_RANGE {Normal (0-85)} \
   CONFIG.PSU__DDRC__DEEP_PWR_DOWN_EN {0} \
   CONFIG.PSU__DDRC__DEVICE_CAPACITY {4096 MBits} \
   CONFIG.PSU__DDRC__DIMM_ADDR_MIRROR {0} \
   CONFIG.PSU__DDRC__DM_DBI {DM_NO_DBI} \
   CONFIG.PSU__DDRC__DQMAP_0_3 {0} \
   CONFIG.PSU__DDRC__DQMAP_12_15 {0} \
   CONFIG.PSU__DDRC__DQMAP_16_19 {0} \
   CONFIG.PSU__DDRC__DQMAP_20_23 {0} \
   CONFIG.PSU__DDRC__DQMAP_24_27 {0} \
   CONFIG.PSU__DDRC__DQMAP_28_31 {0} \
   CONFIG.PSU__DDRC__DQMAP_32_35 {0} \
   CONFIG.PSU__DDRC__DQMAP_36_39 {0} \
   CONFIG.PSU__DDRC__DQMAP_40_43 {0} \
   CONFIG.PSU__DDRC__DQMAP_44_47 {0} \
   CONFIG.PSU__DDRC__DQMAP_48_51 {0} \
   CONFIG.PSU__DDRC__DQMAP_4_7 {0} \
   CONFIG.PSU__DDRC__DQMAP_52_55 {0} \
   CONFIG.PSU__DDRC__DQMAP_56_59 {0} \
   CONFIG.PSU__DDRC__DQMAP_60_63 {0} \
   CONFIG.PSU__DDRC__DQMAP_64_67 {0} \
   CONFIG.PSU__DDRC__DQMAP_68_71 {0} \
   CONFIG.PSU__DDRC__DQMAP_8_11 {0} \
   CONFIG.PSU__DDRC__DRAM_WIDTH {8 Bits} \
   CONFIG.PSU__DDRC__ECC {Disabled} \
   CONFIG.PSU__DDRC__ENABLE_LP4_HAS_ECC_COMP {0} \
   CONFIG.PSU__DDRC__ENABLE_LP4_SLOWBOOT {0} \
   CONFIG.PSU__DDRC__FGRM {1X} \
   CONFIG.PSU__DDRC__LPDDR3_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LPDDR4_T_REF_RANGE {NA} \
   CONFIG.PSU__DDRC__LP_ASR {manual normal} \
   CONFIG.PSU__DDRC__MEMORY_TYPE {DDR 4} \
   CONFIG.PSU__DDRC__PARITY_ENABLE {0} \
   CONFIG.PSU__DDRC__PER_BANK_REFRESH {0} \
   CONFIG.PSU__DDRC__PHY_DBI_MODE {0} \
   CONFIG.PSU__DDRC__RANK_ADDR_COUNT {0} \
   CONFIG.PSU__DDRC__ROW_ADDR_COUNT {15} \
   CONFIG.PSU__DDRC__SB_TARGET {15-15-15} \
   CONFIG.PSU__DDRC__SELF_REF_ABORT {0} \
   CONFIG.PSU__DDRC__SPEED_BIN {DDR4_2133P} \
   CONFIG.PSU__DDRC__STATIC_RD_MODE {0} \
   CONFIG.PSU__DDRC__TRAIN_DATA_EYE {1} \
   CONFIG.PSU__DDRC__TRAIN_READ_GATE {1} \
   CONFIG.PSU__DDRC__TRAIN_WRITE_LEVEL {1} \
   CONFIG.PSU__DDRC__T_FAW {30.0} \
   CONFIG.PSU__DDRC__T_RAS_MIN {33} \
   CONFIG.PSU__DDRC__T_RC {47.06} \
   CONFIG.PSU__DDRC__T_RCD {15} \
   CONFIG.PSU__DDRC__T_RP {15} \
   CONFIG.PSU__DDRC__VENDOR_PART {OTHERS} \
   CONFIG.PSU__DDRC__VREF {1} \
   CONFIG.PSU__DDR_HIGH_ADDRESS_GUI_ENABLE {1} \
   CONFIG.PSU__DDR__INTERFACE__FREQMHZ {533.500} \
   CONFIG.PSU__DISPLAYPORT__LANE0__ENABLE {1} \
   CONFIG.PSU__DISPLAYPORT__LANE0__IO {GT Lane1} \
   CONFIG.PSU__DISPLAYPORT__LANE1__ENABLE {1} \
   CONFIG.PSU__DISPLAYPORT__LANE1__IO {GT Lane0} \
   CONFIG.PSU__DISPLAYPORT__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__DLL__ISUSED {1} \
   CONFIG.PSU__DPAUX__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__DPAUX__PERIPHERAL__IO {MIO 27 .. 30} \
   CONFIG.PSU__DP__LANE_SEL {Dual Lower} \
   CONFIG.PSU__DP__REF_CLK_FREQ {27} \
   CONFIG.PSU__DP__REF_CLK_SEL {Ref Clk3} \
   CONFIG.PSU__ENET3__FIFO__ENABLE {0} \
   CONFIG.PSU__ENET3__GRP_MDIO__ENABLE {1} \
   CONFIG.PSU__ENET3__GRP_MDIO__IO {MIO 76 .. 77} \
   CONFIG.PSU__ENET3__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__ENET3__PERIPHERAL__IO {MIO 64 .. 75} \
   CONFIG.PSU__ENET3__PTP__ENABLE {0} \
   CONFIG.PSU__ENET3__TSU__ENABLE {0} \
   CONFIG.PSU__FPDMASTERS_COHERENCY {0} \
   CONFIG.PSU__FPD_SLCR__WDT1__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__FPD_SLCR__WDT1__FREQMHZ {99.990005} \
   CONFIG.PSU__FPD_SLCR__WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__FPGA_PL0_ENABLE {1} \
   CONFIG.PSU__FPGA_PL1_ENABLE {1} \
   CONFIG.PSU__GEM3_COHERENCY {0} \
   CONFIG.PSU__GEM3_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__GEM__TSU__ENABLE {0} \
   CONFIG.PSU__GPIO0_MIO__IO {MIO 0 .. 25} \
   CONFIG.PSU__GPIO0_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GPIO1_MIO__IO {MIO 26 .. 51} \
   CONFIG.PSU__GPIO1_MIO__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__GT__LINK_SPEED {HBR} \
   CONFIG.PSU__GT__PRE_EMPH_LVL_4 {0} \
   CONFIG.PSU__GT__VLT_SWNG_LVL_4 {0} \
   CONFIG.PSU__HIGH_ADDRESS__ENABLE {1} \
   CONFIG.PSU__I2C0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__I2C0__PERIPHERAL__IO {MIO 14 .. 15} \
   CONFIG.PSU__I2C1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__I2C1__PERIPHERAL__IO {MIO 16 .. 17} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC0_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC1_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC2_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__IOU_TTC_APB_CLK__TTC3_SEL {APB} \
   CONFIG.PSU__IOU_SLCR__TTC0__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC0__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC1__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC1__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC2__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC2__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC3__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__TTC3__FREQMHZ {100.000000} \
   CONFIG.PSU__IOU_SLCR__WDT0__ACT_FREQMHZ {99.990005} \
   CONFIG.PSU__IOU_SLCR__WDT0__FREQMHZ {99.990005} \
   CONFIG.PSU__IOU_SLCR__WDT_CLK_SEL__SELECT {APB} \
   CONFIG.PSU__LPD_SLCR__CSUPMU__ACT_FREQMHZ {100.000000} \
   CONFIG.PSU__LPD_SLCR__CSUPMU__FREQMHZ {100.000000} \
   CONFIG.PSU__MAXIGP0__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP1__DATA_WIDTH {128} \
   CONFIG.PSU__MAXIGP2__DATA_WIDTH {32} \
   CONFIG.PSU__OVERRIDE__BASIC_CLOCK {0} \
   CONFIG.PSU__PL_CLK0_BUF {TRUE} \
   CONFIG.PSU__PL_CLK1_BUF {TRUE} \
   CONFIG.PSU__PMU_COHERENCY {0} \
   CONFIG.PSU__PMU__AIBACK__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPI__ENABLE {0} \
   CONFIG.PSU__PMU__EMIO_GPO__ENABLE {0} \
   CONFIG.PSU__PMU__GPI0__ENABLE {0} \
   CONFIG.PSU__PMU__GPI1__ENABLE {0} \
   CONFIG.PSU__PMU__GPI2__ENABLE {0} \
   CONFIG.PSU__PMU__GPI3__ENABLE {0} \
   CONFIG.PSU__PMU__GPI4__ENABLE {0} \
   CONFIG.PSU__PMU__GPI5__ENABLE {0} \
   CONFIG.PSU__PMU__GPO0__ENABLE {1} \
   CONFIG.PSU__PMU__GPO0__IO {MIO 32} \
   CONFIG.PSU__PMU__GPO1__ENABLE {1} \
   CONFIG.PSU__PMU__GPO1__IO {MIO 33} \
   CONFIG.PSU__PMU__GPO2__ENABLE {1} \
   CONFIG.PSU__PMU__GPO2__IO {MIO 34} \
   CONFIG.PSU__PMU__GPO2__POLARITY {low} \
   CONFIG.PSU__PMU__GPO3__ENABLE {1} \
   CONFIG.PSU__PMU__GPO3__IO {MIO 35} \
   CONFIG.PSU__PMU__GPO3__POLARITY {low} \
   CONFIG.PSU__PMU__GPO4__ENABLE {1} \
   CONFIG.PSU__PMU__GPO4__IO {MIO 36} \
   CONFIG.PSU__PMU__GPO4__POLARITY {low} \
   CONFIG.PSU__PMU__GPO5__ENABLE {1} \
   CONFIG.PSU__PMU__GPO5__IO {MIO 37} \
   CONFIG.PSU__PMU__GPO5__POLARITY {low} \
   CONFIG.PSU__PMU__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__PMU__PLERROR__ENABLE {0} \
   CONFIG.PSU__PRESET_APPLIED {1} \
   CONFIG.PSU__PROTECTION__MASTERS {USB1:NonSecure;0|USB0:NonSecure;1|S_AXI_LPD:NA;0|S_AXI_HPC1_FPD:NA;0|S_AXI_HPC0_FPD:NA;0|S_AXI_HP3_FPD:NA;1|S_AXI_HP2_FPD:NA;1|S_AXI_HP1_FPD:NA;1|S_AXI_HP0_FPD:NA;1|S_AXI_ACP:NA;0|S_AXI_ACE:NA;0|SD1:NonSecure;1|SD0:NonSecure;0|SATA1:NonSecure;1|SATA0:NonSecure;1|RPU1:Secure;1|RPU0:Secure;1|QSPI:NonSecure;1|PMU:NA;1|PCIe:NonSecure;0|NAND:NonSecure;0|LDMA:NonSecure;1|GPU:NonSecure;1|GEM3:NonSecure;1|GEM2:NonSecure;0|GEM1:NonSecure;0|GEM0:NonSecure;0|FDMA:NonSecure;1|DP:NonSecure;1|DAP:NA;1|Coresight:NA;1|CSU:NA;1|APU:NA;1} \
   CONFIG.PSU__PROTECTION__SLAVES {LPD;USB3_1_XHCI;FE300000;FE3FFFFF;0|LPD;USB3_1;FF9E0000;FF9EFFFF;0|LPD;USB3_0_XHCI;FE200000;FE2FFFFF;1|LPD;USB3_0;FF9D0000;FF9DFFFF;1|LPD;UART1;FF010000;FF01FFFF;1|LPD;UART0;FF000000;FF00FFFF;1|LPD;TTC3;FF140000;FF14FFFF;1|LPD;TTC2;FF130000;FF13FFFF;1|LPD;TTC1;FF120000;FF12FFFF;1|LPD;TTC0;FF110000;FF11FFFF;1|FPD;SWDT1;FD4D0000;FD4DFFFF;1|LPD;SWDT0;FF150000;FF15FFFF;1|LPD;SPI1;FF050000;FF05FFFF;0|LPD;SPI0;FF040000;FF04FFFF;0|FPD;SMMU_REG;FD5F0000;FD5FFFFF;1|FPD;SMMU;FD800000;FDFFFFFF;1|FPD;SIOU;FD3D0000;FD3DFFFF;1|FPD;SERDES;FD400000;FD47FFFF;1|LPD;SD1;FF170000;FF17FFFF;1|LPD;SD0;FF160000;FF16FFFF;0|FPD;SATA;FD0C0000;FD0CFFFF;1|LPD;RTC;FFA60000;FFA6FFFF;1|LPD;RSA_CORE;FFCE0000;FFCEFFFF;1|LPD;RPU;FF9A0000;FF9AFFFF;1|LPD;R5_TCM_RAM_GLOBAL;FFE00000;FFE3FFFF;1|LPD;R5_1_Instruction_Cache;FFEC0000;FFECFFFF;1|LPD;R5_1_Data_Cache;FFED0000;FFEDFFFF;1|LPD;R5_1_BTCM_GLOBAL;FFEB0000;FFEBFFFF;1|LPD;R5_1_ATCM_GLOBAL;FFE90000;FFE9FFFF;1|LPD;R5_0_Instruction_Cache;FFE40000;FFE4FFFF;1|LPD;R5_0_Data_Cache;FFE50000;FFE5FFFF;1|LPD;R5_0_BTCM_GLOBAL;FFE20000;FFE2FFFF;1|LPD;R5_0_ATCM_GLOBAL;FFE00000;FFE0FFFF;1|LPD;QSPI_Linear_Address;C0000000;DFFFFFFF;1|LPD;QSPI;FF0F0000;FF0FFFFF;1|LPD;PMU_RAM;FFDC0000;FFDDFFFF;1|LPD;PMU_GLOBAL;FFD80000;FFDBFFFF;1|FPD;PCIE_MAIN;FD0E0000;FD0EFFFF;0|FPD;PCIE_LOW;E0000000;EFFFFFFF;0|FPD;PCIE_HIGH2;8000000000;BFFFFFFFFF;0|FPD;PCIE_HIGH1;600000000;7FFFFFFFF;0|FPD;PCIE_DMA;FD0F0000;FD0FFFFF;0|FPD;PCIE_ATTRIB;FD480000;FD48FFFF;0|LPD;OCM_XMPU_CFG;FFA70000;FFA7FFFF;1|LPD;OCM_SLCR;FF960000;FF96FFFF;1|OCM;OCM;FFFC0000;FFFFFFFF;1|LPD;NAND;FF100000;FF10FFFF;0|LPD;MBISTJTAG;FFCF0000;FFCFFFFF;1|LPD;LPD_XPPU_SINK;FF9C0000;FF9CFFFF;1|LPD;LPD_XPPU;FF980000;FF98FFFF;1|LPD;LPD_SLCR_SECURE;FF4B0000;FF4DFFFF;1|LPD;LPD_SLCR;FF410000;FF4AFFFF;1|LPD;LPD_GPV;FE100000;FE1FFFFF;1|LPD;LPD_DMA_7;FFAF0000;FFAFFFFF;1|LPD;LPD_DMA_6;FFAE0000;FFAEFFFF;1|LPD;LPD_DMA_5;FFAD0000;FFADFFFF;1|LPD;LPD_DMA_4;FFAC0000;FFACFFFF;1|LPD;LPD_DMA_3;FFAB0000;FFABFFFF;1|LPD;LPD_DMA_2;FFAA0000;FFAAFFFF;1|LPD;LPD_DMA_1;FFA90000;FFA9FFFF;1|LPD;LPD_DMA_0;FFA80000;FFA8FFFF;1|LPD;IPI_CTRL;FF380000;FF3FFFFF;1|LPD;IOU_SLCR;FF180000;FF23FFFF;1|LPD;IOU_SECURE_SLCR;FF240000;FF24FFFF;1|LPD;IOU_SCNTRS;FF260000;FF26FFFF;1|LPD;IOU_SCNTR;FF250000;FF25FFFF;1|LPD;IOU_GPV;FE000000;FE0FFFFF;1|LPD;I2C1;FF030000;FF03FFFF;1|LPD;I2C0;FF020000;FF02FFFF;1|FPD;GPU;FD4B0000;FD4BFFFF;1|LPD;GPIO;FF0A0000;FF0AFFFF;1|LPD;GEM3;FF0E0000;FF0EFFFF;1|LPD;GEM2;FF0D0000;FF0DFFFF;0|LPD;GEM1;FF0C0000;FF0CFFFF;0|LPD;GEM0;FF0B0000;FF0BFFFF;0|FPD;FPD_XMPU_SINK;FD4F0000;FD4FFFFF;1|FPD;FPD_XMPU_CFG;FD5D0000;FD5DFFFF;1|FPD;FPD_SLCR_SECURE;FD690000;FD6CFFFF;1|FPD;FPD_SLCR;FD610000;FD68FFFF;1|FPD;FPD_GPV;FD700000;FD7FFFFF;1|FPD;FPD_DMA_CH7;FD570000;FD57FFFF;1|FPD;FPD_DMA_CH6;FD560000;FD56FFFF;1|FPD;FPD_DMA_CH5;FD550000;FD55FFFF;1|FPD;FPD_DMA_CH4;FD540000;FD54FFFF;1|FPD;FPD_DMA_CH3;FD530000;FD53FFFF;1|FPD;FPD_DMA_CH2;FD520000;FD52FFFF;1|FPD;FPD_DMA_CH1;FD510000;FD51FFFF;1|FPD;FPD_DMA_CH0;FD500000;FD50FFFF;1|LPD;EFUSE;FFCC0000;FFCCFFFF;1|FPD;Display Port;FD4A0000;FD4AFFFF;1|FPD;DPDMA;FD4C0000;FD4CFFFF;1|FPD;DDR_XMPU5_CFG;FD050000;FD05FFFF;1|FPD;DDR_XMPU4_CFG;FD040000;FD04FFFF;1|FPD;DDR_XMPU3_CFG;FD030000;FD03FFFF;1|FPD;DDR_XMPU2_CFG;FD020000;FD02FFFF;1|FPD;DDR_XMPU1_CFG;FD010000;FD01FFFF;1|FPD;DDR_XMPU0_CFG;FD000000;FD00FFFF;1|FPD;DDR_QOS_CTRL;FD090000;FD09FFFF;1|FPD;DDR_PHY;FD080000;FD08FFFF;1|DDR;DDR_LOW;0;7FFFFFFF;1|DDR;DDR_HIGH;800000000;87FFFFFFF;1|FPD;DDDR_CTRL;FD070000;FD070FFF;1|LPD;Coresight;FE800000;FEFFFFFF;1|LPD;CSU_DMA;FFC80000;FFC9FFFF;1|LPD;CSU;FFCA0000;FFCAFFFF;1|LPD;CRL_APB;FF5E0000;FF85FFFF;1|FPD;CRF_APB;FD1A0000;FD2DFFFF;1|FPD;CCI_REG;FD5E0000;FD5EFFFF;1|FPD;CCI_GPV;FD6E0000;FD6EFFFF;1|LPD;CAN1;FF070000;FF07FFFF;1|LPD;CAN0;FF060000;FF06FFFF;0|FPD;APU;FD5C0000;FD5CFFFF;1|LPD;APM_INTC_IOU;FFA20000;FFA2FFFF;1|LPD;APM_FPD_LPD;FFA30000;FFA3FFFF;1|FPD;APM_5;FD490000;FD49FFFF;1|FPD;APM_0;FD0B0000;FD0BFFFF;1|LPD;APM2;FFA10000;FFA1FFFF;1|LPD;APM1;FFA00000;FFA0FFFF;1|LPD;AMS;FFA50000;FFA5FFFF;1|FPD;AFI_5;FD3B0000;FD3BFFFF;1|FPD;AFI_4;FD3A0000;FD3AFFFF;1|FPD;AFI_3;FD390000;FD39FFFF;1|FPD;AFI_2;FD380000;FD38FFFF;1|FPD;AFI_1;FD370000;FD37FFFF;1|FPD;AFI_0;FD360000;FD36FFFF;1|LPD;AFIFM6;FF9B0000;FF9BFFFF;1|FPD;ACPU_GIC;F9010000;F907FFFF;1} \
   CONFIG.PSU__PSS_REF_CLK__FREQMHZ {33.330} \
   CONFIG.PSU__QSPI_COHERENCY {0} \
   CONFIG.PSU__QSPI_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__QSPI__GRP_FBCLK__ENABLE {1} \
   CONFIG.PSU__QSPI__GRP_FBCLK__IO {MIO 6} \
   CONFIG.PSU__QSPI__PERIPHERAL__DATA_MODE {x4} \
   CONFIG.PSU__QSPI__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__QSPI__PERIPHERAL__IO {MIO 0 .. 12} \
   CONFIG.PSU__QSPI__PERIPHERAL__MODE {Dual Parallel} \
   CONFIG.PSU__SATA__LANE0__ENABLE {0} \
   CONFIG.PSU__SATA__LANE1__ENABLE {1} \
   CONFIG.PSU__SATA__LANE1__IO {GT Lane3} \
   CONFIG.PSU__SATA__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SATA__REF_CLK_FREQ {125} \
   CONFIG.PSU__SATA__REF_CLK_SEL {Ref Clk1} \
   CONFIG.PSU__SAXIGP2__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP3__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP4__DATA_WIDTH {128} \
   CONFIG.PSU__SAXIGP5__DATA_WIDTH {128} \
   CONFIG.PSU__SD1_COHERENCY {0} \
   CONFIG.PSU__SD1_ROUTE_THROUGH_FPD {0} \
   CONFIG.PSU__SD1__DATA_TRANSFER_MODE {8Bit} \
   CONFIG.PSU__SD1__GRP_CD__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_CD__IO {MIO 45} \
   CONFIG.PSU__SD1__GRP_POW__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_POW__IO {MIO 43} \
   CONFIG.PSU__SD1__GRP_WP__ENABLE {1} \
   CONFIG.PSU__SD1__GRP_WP__IO {MIO 44} \
   CONFIG.PSU__SD1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SD1__PERIPHERAL__IO {MIO 39 .. 51} \
   CONFIG.PSU__SD1__RESET__ENABLE {0} \
   CONFIG.PSU__SD1__SLOT_TYPE {SD 3.0} \
   CONFIG.PSU__SWDT0__CLOCK__ENABLE {0} \
   CONFIG.PSU__SWDT0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SWDT0__RESET__ENABLE {0} \
   CONFIG.PSU__SWDT1__CLOCK__ENABLE {0} \
   CONFIG.PSU__SWDT1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__SWDT1__RESET__ENABLE {0} \
   CONFIG.PSU__TSU__BUFG_PORT_PAIR {0} \
   CONFIG.PSU__TTC0__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC0__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC1__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC1__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC2__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC2__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC2__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__TTC3__CLOCK__ENABLE {0} \
   CONFIG.PSU__TTC3__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__TTC3__WAVEOUT__ENABLE {0} \
   CONFIG.PSU__UART0__BAUD_RATE {115200} \
   CONFIG.PSU__UART0__MODEM__ENABLE {0} \
   CONFIG.PSU__UART0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART0__PERIPHERAL__IO {MIO 18 .. 19} \
   CONFIG.PSU__UART1__BAUD_RATE {115200} \
   CONFIG.PSU__UART1__MODEM__ENABLE {0} \
   CONFIG.PSU__UART1__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__UART1__PERIPHERAL__IO {MIO 20 .. 21} \
   CONFIG.PSU__USB0_COHERENCY {0} \
   CONFIG.PSU__USB0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB0__PERIPHERAL__IO {MIO 52 .. 63} \
   CONFIG.PSU__USB0__REF_CLK_FREQ {26} \
   CONFIG.PSU__USB0__REF_CLK_SEL {Ref Clk2} \
   CONFIG.PSU__USB0__RESET__ENABLE {0} \
   CONFIG.PSU__USB1__RESET__ENABLE {0} \
   CONFIG.PSU__USB2_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__EMIO__ENABLE {0} \
   CONFIG.PSU__USB3_0__PERIPHERAL__ENABLE {1} \
   CONFIG.PSU__USB3_0__PERIPHERAL__IO {GT Lane2} \
   CONFIG.PSU__USB__RESET__MODE {Boot Pin} \
   CONFIG.PSU__USB__RESET__POLARITY {Active Low} \
   CONFIG.PSU__USE__IRQ0 {1} \
   CONFIG.PSU__USE__M_AXI_GP0 {1} \
   CONFIG.PSU__USE__M_AXI_GP1 {0} \
   CONFIG.PSU__USE__M_AXI_GP2 {0} \
   CONFIG.PSU__USE__S_AXI_GP2 {1} \
   CONFIG.PSU__USE__S_AXI_GP3 {1} \
   CONFIG.PSU__USE__S_AXI_GP4 {1} \
   CONFIG.PSU__USE__S_AXI_GP5 {1} \
   CONFIG.SUBPRESET1 {Custom} \
 ] $zynq_ultra_ps_e_0

  # Create interface connections
  connect_bd_intf_net -intf_net axi_dma_0_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_0/S00_AXIS] [get_bd_intf_pins axi_dma_0/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_0_M_AXI_MM2S [get_bd_intf_pins axi_dma_0/M_AXI_MM2S] [get_bd_intf_pins smartconnect_0/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_10_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_10/S00_AXIS] [get_bd_intf_pins axi_dma_10/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_10_M_AXI_MM2S [get_bd_intf_pins axi_dma_10/M_AXI_MM2S] [get_bd_intf_pins smartconnect_2/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_11_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_11/S00_AXIS] [get_bd_intf_pins axi_dma_11/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_11_M_AXI_MM2S [get_bd_intf_pins axi_dma_11/M_AXI_MM2S] [get_bd_intf_pins smartconnect_2/S03_AXI]
  connect_bd_intf_net -intf_net axi_dma_12_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_12/S00_AXIS] [get_bd_intf_pins axi_dma_12/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_12_M_AXI_MM2S [get_bd_intf_pins axi_dma_12/M_AXI_MM2S] [get_bd_intf_pins smartconnect_3/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_13_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_13/S00_AXIS] [get_bd_intf_pins axi_dma_13/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_13_M_AXI_MM2S [get_bd_intf_pins axi_dma_13/M_AXI_MM2S] [get_bd_intf_pins smartconnect_3/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_14_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_14/S00_AXIS] [get_bd_intf_pins axi_dma_14/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_14_M_AXI_MM2S [get_bd_intf_pins axi_dma_14/M_AXI_MM2S] [get_bd_intf_pins smartconnect_3/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_15_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_15/S00_AXIS] [get_bd_intf_pins axi_dma_15/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_15_M_AXI_MM2S [get_bd_intf_pins axi_dma_15/M_AXI_MM2S] [get_bd_intf_pins smartconnect_3/S03_AXI]
  connect_bd_intf_net -intf_net axi_dma_1_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_1/S00_AXIS] [get_bd_intf_pins axi_dma_1/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_1_M_AXI_MM2S [get_bd_intf_pins axi_dma_1/M_AXI_MM2S] [get_bd_intf_pins smartconnect_0/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_2_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_2/S00_AXIS] [get_bd_intf_pins axi_dma_2/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_2_M_AXI_MM2S [get_bd_intf_pins axi_dma_2/M_AXI_MM2S] [get_bd_intf_pins smartconnect_0/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_3_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_3/S00_AXIS] [get_bd_intf_pins axi_dma_3/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_3_M_AXI_MM2S [get_bd_intf_pins axi_dma_3/M_AXI_MM2S] [get_bd_intf_pins smartconnect_0/S03_AXI]
  connect_bd_intf_net -intf_net axi_dma_4_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_4/S00_AXIS] [get_bd_intf_pins axi_dma_4/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_4_M_AXI_MM2S [get_bd_intf_pins axi_dma_4/M_AXI_MM2S] [get_bd_intf_pins smartconnect_1/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_5_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_5/S00_AXIS] [get_bd_intf_pins axi_dma_5/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_5_M_AXI_MM2S [get_bd_intf_pins axi_dma_5/M_AXI_MM2S] [get_bd_intf_pins smartconnect_1/S01_AXI]
  connect_bd_intf_net -intf_net axi_dma_6_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_6/S00_AXIS] [get_bd_intf_pins axi_dma_6/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_6_M_AXI_MM2S [get_bd_intf_pins axi_dma_6/M_AXI_MM2S] [get_bd_intf_pins smartconnect_1/S02_AXI]
  connect_bd_intf_net -intf_net axi_dma_7_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_7/S00_AXIS] [get_bd_intf_pins axi_dma_7/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_7_M_AXI_MM2S [get_bd_intf_pins axi_dma_7/M_AXI_MM2S] [get_bd_intf_pins smartconnect_1/S03_AXI]
  connect_bd_intf_net -intf_net axi_dma_8_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_8/S00_AXIS] [get_bd_intf_pins axi_dma_8/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_8_M_AXI_MM2S [get_bd_intf_pins axi_dma_8/M_AXI_MM2S] [get_bd_intf_pins smartconnect_2/S00_AXI]
  connect_bd_intf_net -intf_net axi_dma_9_M_AXIS_MM2S [get_bd_intf_pins SipHash_X_Y_9/S00_AXIS] [get_bd_intf_pins axi_dma_9/M_AXIS_MM2S]
  connect_bd_intf_net -intf_net axi_dma_9_M_AXI_MM2S [get_bd_intf_pins axi_dma_9/M_AXI_MM2S] [get_bd_intf_pins smartconnect_2/S01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M00_AXI [get_bd_intf_pins axi_dma_0/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M00_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M01_AXI [get_bd_intf_pins SipHash_X_Y_0/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M01_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M02_AXI [get_bd_intf_pins axi_dma_1/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M02_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M03_AXI [get_bd_intf_pins SipHash_X_Y_1/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M03_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M04_AXI [get_bd_intf_pins axi_dma_2/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M04_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M05_AXI [get_bd_intf_pins SipHash_X_Y_2/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M05_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M06_AXI [get_bd_intf_pins axi_dma_3/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M06_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M07_AXI [get_bd_intf_pins SipHash_X_Y_3/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M07_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M08_AXI [get_bd_intf_pins axi_dma_4/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M08_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M09_AXI [get_bd_intf_pins SipHash_X_Y_4/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M09_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M10_AXI [get_bd_intf_pins axi_dma_5/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M10_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M11_AXI [get_bd_intf_pins SipHash_X_Y_5/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M11_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M12_AXI [get_bd_intf_pins axi_dma_6/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M12_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M13_AXI [get_bd_intf_pins SipHash_X_Y_6/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M13_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M14_AXI [get_bd_intf_pins axi_dma_7/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M14_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M15_AXI [get_bd_intf_pins SipHash_X_Y_7/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M15_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M16_AXI [get_bd_intf_pins axi_dma_8/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M16_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M17_AXI [get_bd_intf_pins SipHash_X_Y_8/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M17_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M18_AXI [get_bd_intf_pins axi_dma_9/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M18_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M19_AXI [get_bd_intf_pins SipHash_X_Y_9/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M19_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M20_AXI [get_bd_intf_pins axi_dma_10/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M20_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M21_AXI [get_bd_intf_pins SipHash_X_Y_10/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M21_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M22_AXI [get_bd_intf_pins axi_dma_11/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M22_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M23_AXI [get_bd_intf_pins SipHash_X_Y_11/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M23_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M24_AXI [get_bd_intf_pins SipHash_X_Y_12/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M24_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M25_AXI [get_bd_intf_pins axi_dma_12/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M25_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M26_AXI [get_bd_intf_pins SipHash_X_Y_13/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M26_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M27_AXI [get_bd_intf_pins axi_dma_13/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M27_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M28_AXI [get_bd_intf_pins SipHash_X_Y_14/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M28_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M29_AXI [get_bd_intf_pins axi_dma_14/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M29_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M30_AXI [get_bd_intf_pins SipHash_X_Y_15/S00_AXI] [get_bd_intf_pins axi_interconnect_0/M30_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M31_AXI [get_bd_intf_pins axi_dma_15/S_AXI_LITE] [get_bd_intf_pins axi_interconnect_0/M31_AXI]
  connect_bd_intf_net -intf_net axi_interconnect_0_M32_AXI [get_bd_intf_pins axi_interconnect_0/M32_AXI] [get_bd_intf_pins axi_timer_0/S_AXI]
  connect_bd_intf_net -intf_net smartconnect_0_M00_AXI [get_bd_intf_pins smartconnect_0/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP0_FPD]
  connect_bd_intf_net -intf_net smartconnect_1_M00_AXI [get_bd_intf_pins smartconnect_1/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP1_FPD]
  connect_bd_intf_net -intf_net smartconnect_2_M00_AXI [get_bd_intf_pins smartconnect_2/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP2_FPD]
  connect_bd_intf_net -intf_net smartconnect_3_M00_AXI [get_bd_intf_pins smartconnect_3/M00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/S_AXI_HP3_FPD]
  connect_bd_intf_net -intf_net zynq_ultra_ps_e_0_M_AXI_HPM0_FPD [get_bd_intf_pins axi_interconnect_0/S00_AXI] [get_bd_intf_pins zynq_ultra_ps_e_0/M_AXI_HPM0_FPD]

  # Create port connections
  connect_bd_net -net rst_ps8_0_187M_peripheral_aresetn [get_bd_pins SipHash_X_Y_0/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_0/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_0/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_1/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_1/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_1/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_10/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_10/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_10/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_11/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_11/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_11/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_12/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_12/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_12/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_13/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_13/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_13/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_14/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_14/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_14/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_15/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_15/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_15/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_2/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_2/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_2/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_3/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_3/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_3/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_4/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_4/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_4/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_5/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_5/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_5/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_6/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_6/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_6/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_7/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_7/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_7/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_8/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_8/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_8/s00_axis_aresetn] [get_bd_pins SipHash_X_Y_9/m00_axis_aresetn] [get_bd_pins SipHash_X_Y_9/s00_axi_aresetn] [get_bd_pins SipHash_X_Y_9/s00_axis_aresetn] [get_bd_pins axi_dma_0/axi_resetn] [get_bd_pins axi_dma_1/axi_resetn] [get_bd_pins axi_dma_10/axi_resetn] [get_bd_pins axi_dma_11/axi_resetn] [get_bd_pins axi_dma_12/axi_resetn] [get_bd_pins axi_dma_13/axi_resetn] [get_bd_pins axi_dma_14/axi_resetn] [get_bd_pins axi_dma_15/axi_resetn] [get_bd_pins axi_dma_2/axi_resetn] [get_bd_pins axi_dma_3/axi_resetn] [get_bd_pins axi_dma_4/axi_resetn] [get_bd_pins axi_dma_5/axi_resetn] [get_bd_pins axi_dma_6/axi_resetn] [get_bd_pins axi_dma_7/axi_resetn] [get_bd_pins axi_dma_8/axi_resetn] [get_bd_pins axi_dma_9/axi_resetn] [get_bd_pins axi_interconnect_0/ARESETN] [get_bd_pins axi_interconnect_0/M00_ARESETN] [get_bd_pins axi_interconnect_0/M01_ARESETN] [get_bd_pins axi_interconnect_0/M02_ARESETN] [get_bd_pins axi_interconnect_0/M03_ARESETN] [get_bd_pins axi_interconnect_0/M04_ARESETN] [get_bd_pins axi_interconnect_0/M05_ARESETN] [get_bd_pins axi_interconnect_0/M06_ARESETN] [get_bd_pins axi_interconnect_0/M07_ARESETN] [get_bd_pins axi_interconnect_0/M08_ARESETN] [get_bd_pins axi_interconnect_0/M09_ARESETN] [get_bd_pins axi_interconnect_0/M10_ARESETN] [get_bd_pins axi_interconnect_0/M11_ARESETN] [get_bd_pins axi_interconnect_0/M12_ARESETN] [get_bd_pins axi_interconnect_0/M13_ARESETN] [get_bd_pins axi_interconnect_0/M14_ARESETN] [get_bd_pins axi_interconnect_0/M15_ARESETN] [get_bd_pins axi_interconnect_0/M16_ARESETN] [get_bd_pins axi_interconnect_0/M17_ARESETN] [get_bd_pins axi_interconnect_0/M18_ARESETN] [get_bd_pins axi_interconnect_0/M19_ARESETN] [get_bd_pins axi_interconnect_0/M20_ARESETN] [get_bd_pins axi_interconnect_0/M21_ARESETN] [get_bd_pins axi_interconnect_0/M22_ARESETN] [get_bd_pins axi_interconnect_0/M23_ARESETN] [get_bd_pins axi_interconnect_0/M24_ARESETN] [get_bd_pins axi_interconnect_0/M25_ARESETN] [get_bd_pins axi_interconnect_0/M26_ARESETN] [get_bd_pins axi_interconnect_0/M27_ARESETN] [get_bd_pins axi_interconnect_0/M28_ARESETN] [get_bd_pins axi_interconnect_0/M29_ARESETN] [get_bd_pins axi_interconnect_0/M30_ARESETN] [get_bd_pins axi_interconnect_0/M31_ARESETN] [get_bd_pins axi_interconnect_0/M32_ARESETN] [get_bd_pins axi_interconnect_0/S00_ARESETN] [get_bd_pins axi_timer_0/s_axi_aresetn] [get_bd_pins rst_ps8_0_187M/peripheral_aresetn] [get_bd_pins smartconnect_0/aresetn] [get_bd_pins smartconnect_1/aresetn] [get_bd_pins smartconnect_2/aresetn] [get_bd_pins smartconnect_3/aresetn]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk0 [get_bd_pins SipHash_X_Y_0/m00_axis_aclk] [get_bd_pins SipHash_X_Y_0/s00_axi_aclk] [get_bd_pins SipHash_X_Y_0/s00_axis_aclk] [get_bd_pins SipHash_X_Y_1/m00_axis_aclk] [get_bd_pins SipHash_X_Y_1/s00_axi_aclk] [get_bd_pins SipHash_X_Y_1/s00_axis_aclk] [get_bd_pins SipHash_X_Y_10/m00_axis_aclk] [get_bd_pins SipHash_X_Y_10/s00_axi_aclk] [get_bd_pins SipHash_X_Y_10/s00_axis_aclk] [get_bd_pins SipHash_X_Y_11/m00_axis_aclk] [get_bd_pins SipHash_X_Y_11/s00_axi_aclk] [get_bd_pins SipHash_X_Y_11/s00_axis_aclk] [get_bd_pins SipHash_X_Y_12/m00_axis_aclk] [get_bd_pins SipHash_X_Y_12/s00_axi_aclk] [get_bd_pins SipHash_X_Y_12/s00_axis_aclk] [get_bd_pins SipHash_X_Y_13/m00_axis_aclk] [get_bd_pins SipHash_X_Y_13/s00_axi_aclk] [get_bd_pins SipHash_X_Y_13/s00_axis_aclk] [get_bd_pins SipHash_X_Y_14/m00_axis_aclk] [get_bd_pins SipHash_X_Y_14/s00_axi_aclk] [get_bd_pins SipHash_X_Y_14/s00_axis_aclk] [get_bd_pins SipHash_X_Y_15/m00_axis_aclk] [get_bd_pins SipHash_X_Y_15/s00_axi_aclk] [get_bd_pins SipHash_X_Y_15/s00_axis_aclk] [get_bd_pins SipHash_X_Y_2/m00_axis_aclk] [get_bd_pins SipHash_X_Y_2/s00_axi_aclk] [get_bd_pins SipHash_X_Y_2/s00_axis_aclk] [get_bd_pins SipHash_X_Y_3/m00_axis_aclk] [get_bd_pins SipHash_X_Y_3/s00_axi_aclk] [get_bd_pins SipHash_X_Y_3/s00_axis_aclk] [get_bd_pins SipHash_X_Y_4/m00_axis_aclk] [get_bd_pins SipHash_X_Y_4/s00_axi_aclk] [get_bd_pins SipHash_X_Y_4/s00_axis_aclk] [get_bd_pins SipHash_X_Y_5/m00_axis_aclk] [get_bd_pins SipHash_X_Y_5/s00_axi_aclk] [get_bd_pins SipHash_X_Y_5/s00_axis_aclk] [get_bd_pins SipHash_X_Y_6/m00_axis_aclk] [get_bd_pins SipHash_X_Y_6/s00_axi_aclk] [get_bd_pins SipHash_X_Y_6/s00_axis_aclk] [get_bd_pins SipHash_X_Y_7/m00_axis_aclk] [get_bd_pins SipHash_X_Y_7/s00_axi_aclk] [get_bd_pins SipHash_X_Y_7/s00_axis_aclk] [get_bd_pins SipHash_X_Y_8/m00_axis_aclk] [get_bd_pins SipHash_X_Y_8/s00_axi_aclk] [get_bd_pins SipHash_X_Y_8/s00_axis_aclk] [get_bd_pins SipHash_X_Y_9/m00_axis_aclk] [get_bd_pins SipHash_X_Y_9/s00_axi_aclk] [get_bd_pins SipHash_X_Y_9/s00_axis_aclk] [get_bd_pins axi_dma_0/m_axi_mm2s_aclk] [get_bd_pins axi_dma_0/s_axi_lite_aclk] [get_bd_pins axi_dma_1/m_axi_mm2s_aclk] [get_bd_pins axi_dma_1/s_axi_lite_aclk] [get_bd_pins axi_dma_10/m_axi_mm2s_aclk] [get_bd_pins axi_dma_10/s_axi_lite_aclk] [get_bd_pins axi_dma_11/m_axi_mm2s_aclk] [get_bd_pins axi_dma_11/s_axi_lite_aclk] [get_bd_pins axi_dma_12/m_axi_mm2s_aclk] [get_bd_pins axi_dma_12/s_axi_lite_aclk] [get_bd_pins axi_dma_13/m_axi_mm2s_aclk] [get_bd_pins axi_dma_13/s_axi_lite_aclk] [get_bd_pins axi_dma_14/m_axi_mm2s_aclk] [get_bd_pins axi_dma_14/s_axi_lite_aclk] [get_bd_pins axi_dma_15/m_axi_mm2s_aclk] [get_bd_pins axi_dma_15/s_axi_lite_aclk] [get_bd_pins axi_dma_2/m_axi_mm2s_aclk] [get_bd_pins axi_dma_2/s_axi_lite_aclk] [get_bd_pins axi_dma_3/m_axi_mm2s_aclk] [get_bd_pins axi_dma_3/s_axi_lite_aclk] [get_bd_pins axi_dma_4/m_axi_mm2s_aclk] [get_bd_pins axi_dma_4/s_axi_lite_aclk] [get_bd_pins axi_dma_5/m_axi_mm2s_aclk] [get_bd_pins axi_dma_5/s_axi_lite_aclk] [get_bd_pins axi_dma_6/m_axi_mm2s_aclk] [get_bd_pins axi_dma_6/s_axi_lite_aclk] [get_bd_pins axi_dma_7/m_axi_mm2s_aclk] [get_bd_pins axi_dma_7/s_axi_lite_aclk] [get_bd_pins axi_dma_8/m_axi_mm2s_aclk] [get_bd_pins axi_dma_8/s_axi_lite_aclk] [get_bd_pins axi_dma_9/m_axi_mm2s_aclk] [get_bd_pins axi_dma_9/s_axi_lite_aclk] [get_bd_pins axi_interconnect_0/ACLK] [get_bd_pins axi_interconnect_0/M00_ACLK] [get_bd_pins axi_interconnect_0/M01_ACLK] [get_bd_pins axi_interconnect_0/M02_ACLK] [get_bd_pins axi_interconnect_0/M03_ACLK] [get_bd_pins axi_interconnect_0/M04_ACLK] [get_bd_pins axi_interconnect_0/M05_ACLK] [get_bd_pins axi_interconnect_0/M06_ACLK] [get_bd_pins axi_interconnect_0/M07_ACLK] [get_bd_pins axi_interconnect_0/M08_ACLK] [get_bd_pins axi_interconnect_0/M09_ACLK] [get_bd_pins axi_interconnect_0/M10_ACLK] [get_bd_pins axi_interconnect_0/M11_ACLK] [get_bd_pins axi_interconnect_0/M12_ACLK] [get_bd_pins axi_interconnect_0/M13_ACLK] [get_bd_pins axi_interconnect_0/M14_ACLK] [get_bd_pins axi_interconnect_0/M15_ACLK] [get_bd_pins axi_interconnect_0/M16_ACLK] [get_bd_pins axi_interconnect_0/M17_ACLK] [get_bd_pins axi_interconnect_0/M18_ACLK] [get_bd_pins axi_interconnect_0/M19_ACLK] [get_bd_pins axi_interconnect_0/M20_ACLK] [get_bd_pins axi_interconnect_0/M21_ACLK] [get_bd_pins axi_interconnect_0/M22_ACLK] [get_bd_pins axi_interconnect_0/M23_ACLK] [get_bd_pins axi_interconnect_0/M24_ACLK] [get_bd_pins axi_interconnect_0/M25_ACLK] [get_bd_pins axi_interconnect_0/M26_ACLK] [get_bd_pins axi_interconnect_0/M27_ACLK] [get_bd_pins axi_interconnect_0/M28_ACLK] [get_bd_pins axi_interconnect_0/M29_ACLK] [get_bd_pins axi_interconnect_0/M30_ACLK] [get_bd_pins axi_interconnect_0/M31_ACLK] [get_bd_pins axi_interconnect_0/M32_ACLK] [get_bd_pins axi_interconnect_0/S00_ACLK] [get_bd_pins axi_timer_0/s_axi_aclk] [get_bd_pins rst_ps8_0_187M/slowest_sync_clk] [get_bd_pins smartconnect_0/aclk] [get_bd_pins smartconnect_1/aclk] [get_bd_pins smartconnect_2/aclk] [get_bd_pins smartconnect_3/aclk] [get_bd_pins zynq_ultra_ps_e_0/maxihpm0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/pl_clk0]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_clk1 [get_bd_pins smartconnect_0/aclk1] [get_bd_pins smartconnect_1/aclk1] [get_bd_pins smartconnect_2/aclk1] [get_bd_pins smartconnect_3/aclk1] [get_bd_pins zynq_ultra_ps_e_0/pl_clk1] [get_bd_pins zynq_ultra_ps_e_0/saxihp0_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp1_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp2_fpd_aclk] [get_bd_pins zynq_ultra_ps_e_0/saxihp3_fpd_aclk]
  connect_bd_net -net zynq_ultra_ps_e_0_pl_resetn0 [get_bd_pins rst_ps8_0_187M/ext_reset_in] [get_bd_pins zynq_ultra_ps_e_0/pl_resetn0]

  # Create address segments
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_1/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_1/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_1/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_2/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_2/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_2/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_3/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_3/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_3/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_4/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_4/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_4/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_5/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_5/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_5/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_6/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_6/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_6/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_7/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_7/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_7/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_8/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_8/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_8/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_9/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_9/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_9/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_10/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_10/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_10/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_11/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_11/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_11/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_12/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_12/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_12/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_13/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_13/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_13/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_14/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_14/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_14/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_QSPI] -force
  assign_bd_address -offset 0x000800000000 -range 0x000800000000 -target_address_space [get_bd_addr_spaces axi_dma_15/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_HIGH] -force
  assign_bd_address -offset 0x00000000 -range 0x80000000 -target_address_space [get_bd_addr_spaces axi_dma_15/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_DDR_LOW] -force
  assign_bd_address -offset 0xC0000000 -range 0x20000000 -target_address_space [get_bd_addr_spaces axi_dma_15/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_QSPI] -force
  assign_bd_address -offset 0xA0000000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_0/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0020000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_10/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0030000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_11/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0040000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_12/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0050000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_13/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0060000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_14/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0070000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_15/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0010000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_1/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0080000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_2/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0090000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_3/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA00A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_4/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA00B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_5/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA00C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_6/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA00D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_7/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA00E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_8/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA00F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs SipHash_X_Y_9/S00_AXI/S00_AXI_reg] -force
  assign_bd_address -offset 0xA0100000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_0/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0120000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_10/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0130000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_11/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0140000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_12/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0150000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_13/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0160000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_14/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0170000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_15/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0110000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_1/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0180000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_2/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0190000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_3/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA01A0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_4/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA01B0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_5/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA01C0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_6/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA01D0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_7/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA01E0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_8/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA01F0000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_dma_9/S_AXI_LITE/Reg] -force
  assign_bd_address -offset 0xA0200000 -range 0x00010000 -target_address_space [get_bd_addr_spaces zynq_ultra_ps_e_0/Data] [get_bd_addr_segs axi_timer_0/S_AXI/Reg] -force

  # Exclude Address Segments
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_0/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_1/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_10/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_11/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_12/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_13/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_14/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_15/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP5/HP3_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_2/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_3/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP2/HP0_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_4/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_5/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_6/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_7/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP3/HP1_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_8/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_LPS_OCM]
  exclude_bd_addr_seg -offset 0xFF000000 -range 0x01000000 -target_address_space [get_bd_addr_spaces axi_dma_9/Data_MM2S] [get_bd_addr_segs zynq_ultra_ps_e_0/SAXIGP4/HP2_LPS_OCM]

  # Perform GUI Layout
  regenerate_bd_layout -layout_string {
   "ActiveEmotionalView":"Default View",
   "Default View_ScaleFactor":"0.856079",
   "Default View_TopLeft":"667,2825",
   "ExpandedHierarchyInLayout":"",
   "guistr":"# # String gsaved with Nlview 7.0r6  2020-01-29 bk=1.5227 VDI=41 GEI=36 GUI=JA:9.0 non-TLS
#  -string -flagsOSRD
preplace inst zynq_ultra_ps_e_0 -pg 1 -lvl 1 -x -160 -y -180 -defaultsOSRD
preplace inst axi_interconnect_0 -pg 1 -lvl 2 -x 360 -y 2230 -defaultsOSRD
preplace inst axi_dma_0 -pg 1 -lvl 3 -x 890 -y -50 -defaultsOSRD
preplace inst SipHash_X_Y_0 -pg 1 -lvl 4 -x 1430 -y -10 -defaultsOSRD
preplace inst smartconnect_0 -pg 1 -lvl 5 -x 1830 -y -140 -defaultsOSRD
preplace inst SipHash_X_Y_1 -pg 1 -lvl 4 -x 1430 -y 240 -defaultsOSRD
preplace inst axi_dma_1 -pg 1 -lvl 3 -x 890 -y 210 -defaultsOSRD
preplace inst SipHash_X_Y_2 -pg 1 -lvl 4 -x 1430 -y 490 -defaultsOSRD
preplace inst axi_dma_2 -pg 1 -lvl 3 -x 890 -y 460 -defaultsOSRD
preplace inst SipHash_X_Y_3 -pg 1 -lvl 4 -x 1430 -y 740 -defaultsOSRD
preplace inst axi_dma_3 -pg 1 -lvl 3 -x 890 -y 710 -defaultsOSRD
preplace inst SipHash_X_Y_4 -pg 1 -lvl 4 -x 1430 -y 1040 -defaultsOSRD
preplace inst SipHash_X_Y_5 -pg 1 -lvl 4 -x 1430 -y 1290 -defaultsOSRD
preplace inst SipHash_X_Y_6 -pg 1 -lvl 4 -x 1430 -y 1540 -defaultsOSRD
preplace inst SipHash_X_Y_7 -pg 1 -lvl 4 -x 1430 -y 1790 -defaultsOSRD
preplace inst axi_dma_4 -pg 1 -lvl 3 -x 890 -y 1000 -defaultsOSRD
preplace inst axi_dma_5 -pg 1 -lvl 3 -x 890 -y 1250 -defaultsOSRD
preplace inst axi_dma_6 -pg 1 -lvl 3 -x 890 -y 1500 -defaultsOSRD
preplace inst axi_dma_7 -pg 1 -lvl 3 -x 890 -y 1750 -defaultsOSRD
preplace inst smartconnect_1 -pg 1 -lvl 5 -x 1830 -y 940 -defaultsOSRD
preplace inst SipHash_X_Y_8 -pg 1 -lvl 4 -x 1430 -y 2090 -defaultsOSRD
preplace inst SipHash_X_Y_9 -pg 1 -lvl 4 -x 1430 -y 2340 -defaultsOSRD
preplace inst SipHash_X_Y_10 -pg 1 -lvl 4 -x 1430 -y 2590 -defaultsOSRD
preplace inst SipHash_X_Y_11 -pg 1 -lvl 4 -x 1430 -y 2840 -defaultsOSRD
preplace inst axi_dma_8 -pg 1 -lvl 3 -x 890 -y 2050 -defaultsOSRD
preplace inst axi_dma_9 -pg 1 -lvl 3 -x 890 -y 2300 -defaultsOSRD
preplace inst axi_dma_10 -pg 1 -lvl 3 -x 890 -y 2550 -defaultsOSRD
preplace inst axi_dma_11 -pg 1 -lvl 3 -x 890 -y 2800 -defaultsOSRD
preplace inst smartconnect_2 -pg 1 -lvl 5 -x 1830 -y 2000 -defaultsOSRD
preplace inst SipHash_X_Y_12 -pg 1 -lvl 4 -x 1430 -y 3140 -defaultsOSRD
preplace inst SipHash_X_Y_13 -pg 1 -lvl 4 -x 1430 -y 3390 -defaultsOSRD
preplace inst SipHash_X_Y_14 -pg 1 -lvl 4 -x 1430 -y 3640 -defaultsOSRD
preplace inst SipHash_X_Y_15 -pg 1 -lvl 4 -x 1430 -y 3890 -defaultsOSRD
preplace inst axi_dma_12 -pg 1 -lvl 3 -x 890 -y 3100 -defaultsOSRD
preplace inst axi_dma_13 -pg 1 -lvl 3 -x 890 -y 3350 -defaultsOSRD
preplace inst axi_dma_14 -pg 1 -lvl 3 -x 890 -y 3600 -defaultsOSRD
preplace inst axi_dma_15 -pg 1 -lvl 3 -x 890 -y 3850 -defaultsOSRD
preplace inst smartconnect_3 -pg 1 -lvl 5 -x 1830 -y 3040 -defaultsOSRD
preplace inst axi_timer_0 -pg 1 -lvl 2 -x 360 -y 3630 -defaultsOSRD
preplace inst rst_ps8_0_187M -pg 1 -lvl 2 -x 360 -y -50 -defaultsOSRD
preplace netloc zynq_ultra_ps_e_0_pl_clk1 1 0 5 -460 -20 140 -210 N -210 N -210 1640
preplace netloc zynq_ultra_ps_e_0_pl_clk0 1 0 5 -480 -10 150 -150 630 -150 1170 -180 1620
preplace netloc zynq_ultra_ps_e_0_pl_resetn0 1 1 1 170 -190n
preplace netloc rst_ps8_0_187M_peripheral_aresetn 1 1 4 160 1470 650 40 1190 -150 1590
preplace netloc axi_interconnect_0_M19_AXI 1 2 2 580 2390 1150
preplace netloc axi_dma_12_M_AXI_MM2S 1 3 2 1050 2980 N
preplace netloc smartconnect_0_M00_AXI 1 0 6 -470 -350 NJ -350 NJ -350 N -350 NJ -350 1980
preplace netloc axi_interconnect_0_M28_AXI 1 2 2 720 2450 1110
preplace netloc axi_dma_7_M_AXIS_MM2S 1 3 1 N 1740
preplace netloc axi_dma_13_M_AXIS_MM2S 1 3 1 N 3340
preplace netloc zynq_ultra_ps_e_0_M_AXI_HPM0_FPD 1 1 1 130 -210n
preplace netloc axi_dma_1_M_AXIS_MM2S 1 3 1 1100 190n
preplace netloc axi_interconnect_0_M07_AXI 1 2 2 600 800 1150
preplace netloc axi_dma_2_M_AXIS_MM2S 1 3 1 1150 440n
preplace netloc axi_dma_3_M_AXIS_MM2S 1 3 1 1160 690n
preplace netloc axi_interconnect_0_M22_AXI 1 2 1 640 2350n
preplace netloc axi_interconnect_0_M06_AXI 1 2 1 590 680n
preplace netloc axi_dma_0_M_AXIS_MM2S 1 3 1 N -60
preplace netloc axi_interconnect_0_M03_AXI 1 2 2 550 120 1200
preplace netloc axi_interconnect_0_M02_AXI 1 2 1 560 180n
preplace netloc axi_dma_6_M_AXI_MM2S 1 3 2 1100 900 1660
preplace netloc axi_interconnect_0_M13_AXI 1 2 2 690 1590 1160
preplace netloc axi_dma_3_M_AXI_MM2S 1 3 2 1110 -140 N
preplace netloc axi_interconnect_0_M10_AXI 1 2 1 670 1220n
preplace netloc axi_interconnect_0_M01_AXI 1 2 2 530 -140 1100
preplace netloc axi_interconnect_0_M00_AXI 1 2 1 540 -80n
preplace netloc axi_dma_0_M_AXI_MM2S 1 3 2 1050 -200 NJ
preplace netloc axi_dma_11_M_AXIS_MM2S 1 3 1 N 2790
preplace netloc axi_dma_9_M_AXIS_MM2S 1 3 1 N 2290
preplace netloc axi_dma_10_M_AXIS_MM2S 1 3 1 N 2540
preplace netloc axi_dma_1_M_AXI_MM2S 1 3 2 1060 -170 1630
preplace netloc axi_dma_11_M_AXI_MM2S 1 3 2 1100 1960 1600
preplace netloc axi_interconnect_0_M26_AXI 1 2 2 NJ 2430 1130
preplace netloc axi_dma_2_M_AXI_MM2S 1 3 2 1090 -160 N
preplace netloc axi_interconnect_0_M05_AXI 1 2 2 570 370 1200
preplace netloc axi_interconnect_0_M04_AXI 1 2 1 580 430n
preplace netloc axi_dma_4_M_AXI_MM2S 1 3 2 1050 880 N
preplace netloc axi_dma_5_M_AXI_MM2S 1 3 2 1060 890 1670
preplace netloc axi_interconnect_0_M08_AXI 1 2 1 620 970n
preplace netloc axi_dma_7_M_AXI_MM2S 1 3 2 1110 910 1650
preplace netloc axi_dma_6_M_AXIS_MM2S 1 3 1 N 1490
preplace netloc axi_interconnect_0_M31_AXI 1 2 1 540 2530n
preplace netloc axi_interconnect_0_M29_AXI 1 2 1 550 2490n
preplace netloc axi_dma_9_M_AXI_MM2S 1 3 2 1060 1950 1610
preplace netloc axi_interconnect_0_M12_AXI 1 2 1 680 1470n
preplace netloc axi_dma_4_M_AXIS_MM2S 1 3 1 N 990
preplace netloc axi_dma_8_M_AXIS_MM2S 1 3 1 N 2040
preplace netloc axi_interconnect_0_M09_AXI 1 2 2 610 910 1090
preplace netloc axi_dma_5_M_AXIS_MM2S 1 3 1 N 1240
preplace netloc axi_interconnect_0_M14_AXI 1 2 1 710 1720n
preplace netloc axi_interconnect_0_M11_AXI 1 2 2 660 1160 1200
preplace netloc axi_interconnect_0_M15_AXI 1 2 2 700 1660 1180
preplace netloc axi_dma_8_M_AXI_MM2S 1 3 2 1050 1940 NJ
preplace netloc axi_dma_13_M_AXI_MM2S 1 3 2 1060 2990 1580
preplace netloc axi_dma_15_M_AXI_MM2S 1 3 2 1080 3010 1560
preplace netloc axi_dma_12_M_AXIS_MM2S 1 3 1 N 3090
preplace netloc axi_interconnect_0_M17_AXI 1 2 2 720 1960 1090
preplace netloc axi_dma_15_M_AXIS_MM2S 1 3 1 N 3840
preplace netloc axi_dma_10_M_AXI_MM2S 1 3 2 1120 2970 1670
preplace netloc axi_interconnect_0_M25_AXI 1 2 1 580 2410n
preplace netloc axi_interconnect_0_M30_AXI 1 2 2 730 2460 1090
preplace netloc axi_interconnect_0_M16_AXI 1 2 1 730 2020n
preplace netloc axi_dma_14_M_AXI_MM2S 1 3 2 1070 3000 1570
preplace netloc axi_interconnect_0_M18_AXI 1 2 1 N 2270
preplace netloc axi_interconnect_0_M20_AXI 1 2 1 540 2310n
preplace netloc axi_interconnect_0_M23_AXI 1 2 2 720J 2410 1150
preplace netloc axi_interconnect_0_M21_AXI 1 2 2 560 2400 1160
preplace netloc axi_dma_14_M_AXIS_MM2S 1 3 1 N 3590
preplace netloc smartconnect_1_M00_AXI 1 0 6 -460 -330 NJ -330 NJ -330 NJ -330 NJ -330 1970
preplace netloc axi_interconnect_0_M27_AXI 1 2 1 560 2450n
preplace netloc axi_interconnect_0_M32_AXI 1 1 2 170 2990 530
preplace netloc smartconnect_3_M00_AXI 1 0 6 -480 -340 NJ -340 NJ -340 NJ -340 NJ -340 1990
preplace netloc smartconnect_2_M00_AXI 1 0 6 -470 -30 160J -260 NJ -260 NJ -260 NJ -260 1960
preplace netloc axi_interconnect_0_M24_AXI 1 2 2 530J 2420 1140
levelinfo -pg 1 -500 -160 360 890 1430 1830 2010
pagesize -pg 1 -db -bbox -sgen -500 -2330 2010 4020
"
}

  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
  close_bd_design $design_name 
}
# End of cr_bd_SipHashZcu106()
cr_bd_SipHashZcu106 ""
set_property EXCLUDE_DEBUG_LOGIC "0" [get_files SipHashZcu106.bd ] 
set_property GENERATE_SYNTH_CHECKPOINT "1" [get_files SipHashZcu106.bd ] 
set_property IS_ENABLED "1" [get_files SipHashZcu106.bd ] 
set_property IS_GLOBAL_INCLUDE "0" [get_files SipHashZcu106.bd ] 
set_property IS_LOCKED "0" [get_files SipHashZcu106.bd ] 
set_property LIBRARY "xil_defaultlib" [get_files SipHashZcu106.bd ] 
set_property PATH_MODE "RelativeFirst" [get_files SipHashZcu106.bd ] 
set_property PFM_NAME "" [get_files SipHashZcu106.bd ] 
set_property REGISTERED_WITH_MANAGER "1" [get_files SipHashZcu106.bd ] 
set_property SYNTH_CHECKPOINT_MODE "Hierarchical" [get_files SipHashZcu106.bd ] 
set_property USED_IN "synthesis implementation simulation" [get_files SipHashZcu106.bd ] 
set_property USED_IN_IMPLEMENTATION "1" [get_files SipHashZcu106.bd ] 
set_property USED_IN_SIMULATION "1" [get_files SipHashZcu106.bd ] 
set_property USED_IN_SYNTHESIS "1" [get_files SipHashZcu106.bd ] 

# Create 'synth_1' run (if not found)
if {[string equal [get_runs -quiet synth_1] ""]} {
    create_run -name synth_1 -part xczu7ev-ffvc1156-2-e -flow {Vivado Synthesis 2020} -strategy "Flow_PerfOptimized_high" -report_strategy {No Reports} -constrset constrs_1
} else {
  set_property strategy "Flow_PerfOptimized_high" [get_runs synth_1]
  set_property flow "Vivado Synthesis 2020" [get_runs synth_1]
}
set obj [get_runs synth_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Synthesis Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'synth_1_synth_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0] "" ] } {
  create_report_config -report_name synth_1_synth_report_utilization_0 -report_type report_utilization:1.0 -steps synth_design -runs synth_1
}
set obj [get_report_configs -of_objects [get_runs synth_1] synth_1_synth_report_utilization_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.pblocks" -value "" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.slr" -value "0" -objects $obj
set_property -name "options.packthru" -value "0" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.hierarchical_percentages" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
set obj [get_runs synth_1]
set_property -name "constrset" -value "constrs_1" -objects $obj
set_property -name "description" -value "Higher performance designs, resource sharing is turned off, the global fanout guide is set to a lower number, FSM extraction forced to one-hot, LUT combining is disabled, equivalent registers are preserved, SRL are inferred  with a larger threshold" -objects $obj
set_property -name "flow" -value "Vivado Synthesis 2020" -objects $obj
set_property -name "name" -value "synth_1" -objects $obj
set_property -name "needs_refresh" -value "0" -objects $obj
set_property -name "srcset" -value "sources_1" -objects $obj
set_property -name "incremental_checkpoint" -value "" -objects $obj
set_property -name "auto_incremental_checkpoint" -value "0" -objects $obj
set_property -name "rqs_files" -value "" -objects $obj
set_property -name "incremental_checkpoint.more_options" -value "" -objects $obj
set_property -name "include_in_archive" -value "1" -objects $obj
set_property -name "gen_full_bitstream" -value "1" -objects $obj
set_property -name "write_incremental_synth_checkpoint" -value "0" -objects $obj
set_property -name "strategy" -value "Flow_PerfOptimized_high" -objects $obj
set_property -name "steps.synth_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.synth_design.tcl.post" -value "" -objects $obj
set_property -name "steps.synth_design.args.flatten_hierarchy" -value "rebuilt" -objects $obj
set_property -name "steps.synth_design.args.gated_clock_conversion" -value "off" -objects $obj
set_property -name "steps.synth_design.args.bufg" -value "12" -objects $obj
set_property -name "steps.synth_design.args.directive" -value "PerformanceOptimized" -objects $obj
set_property -name "steps.synth_design.args.retiming" -value "0" -objects $obj
set_property -name "steps.synth_design.args.fsm_extraction" -value "one_hot" -objects $obj
set_property -name "steps.synth_design.args.keep_equivalent_registers" -value "1" -objects $obj
set_property -name "steps.synth_design.args.resource_sharing" -value "off" -objects $obj
set_property -name "steps.synth_design.args.control_set_opt_threshold" -value "auto" -objects $obj
set_property -name "steps.synth_design.args.no_lc" -value "1" -objects $obj
set_property -name "steps.synth_design.args.no_srlextract" -value "0" -objects $obj
set_property -name "steps.synth_design.args.shreg_min_size" -value "5" -objects $obj
set_property -name "steps.synth_design.args.max_bram" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_uram" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_dsp" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_bram_cascade_height" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.max_uram_cascade_height" -value "-1" -objects $obj
set_property -name "steps.synth_design.args.cascade_dsp" -value "auto" -objects $obj
set_property -name "steps.synth_design.args.assert" -value "0" -objects $obj
set_property -name "steps.synth_design.args.more options" -value "" -objects $obj

# set the current synth run
current_run -synthesis [get_runs synth_1]

# Create 'impl_1' run (if not found)
if {[string equal [get_runs -quiet impl_1] ""]} {
    create_run -name impl_1 -part xczu7ev-ffvc1156-2-e -flow {Vivado Implementation 2020} -strategy "Performance_ExtraTimingOpt" -report_strategy {No Reports} -constrset constrs_1 -parent_run synth_1
} else {
  set_property strategy "Performance_ExtraTimingOpt" [get_runs impl_1]
  set_property flow "Vivado Implementation 2020" [get_runs impl_1]
}
set obj [get_runs impl_1]
set_property set_report_strategy_name 1 $obj
set_property report_strategy {Vivado Implementation Default Reports} $obj
set_property set_report_strategy_name 0 $obj
# Create 'impl_1_init_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_init_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps init_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_init_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_opt_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_drc_0 -report_type report_drc:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_drc_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.upgrade_cw" -value "0" -objects $obj
set_property -name "options.checks" -value "" -objects $obj
set_property -name "options.ruledecks" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_io_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0] "" ] } {
  create_report_config -report_name impl_1_place_report_io_0 -report_type report_io:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_io_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0] "" ] } {
  create_report_config -report_name impl_1_place_report_utilization_0 -report_type report_utilization:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_utilization_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.pblocks" -value "" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.slr" -value "0" -objects $obj
set_property -name "options.packthru" -value "0" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.hierarchical_percentages" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_control_sets_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0] "" ] } {
  create_report_config -report_name impl_1_place_report_control_sets_0 -report_type report_control_sets:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_control_sets_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.verbose" -value "1" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_incremental_reuse_1' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1] "" ] } {
  create_report_config -report_name impl_1_place_report_incremental_reuse_1 -report_type report_incremental_reuse:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_incremental_reuse_1]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_place_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_place_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps place_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_place_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_post_place_power_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_place_power_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_place_power_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_place_power_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "0" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_drc_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0] "" ] } {
  create_report_config -report_name impl_1_route_report_drc_0 -report_type report_drc:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_drc_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.upgrade_cw" -value "0" -objects $obj
set_property -name "options.checks" -value "" -objects $obj
set_property -name "options.ruledecks" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_methodology_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0] "" ] } {
  create_report_config -report_name impl_1_route_report_methodology_0 -report_type report_methodology:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_methodology_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.checks" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_power_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0] "" ] } {
  create_report_config -report_name impl_1_route_report_power_0 -report_type report_power:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_power_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.advisory" -value "0" -objects $obj
set_property -name "options.xpe" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_route_status_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0] "" ] } {
  create_report_config -report_name impl_1_route_report_route_status_0 -report_type report_route_status:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_route_status_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.of_objects" -value "" -objects $obj
set_property -name "options.route_type" -value "" -objects $obj
set_property -name "options.list_all_nets" -value "0" -objects $obj
set_property -name "options.show_all" -value "0" -objects $obj
set_property -name "options.has_routing" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_route_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "0" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_incremental_reuse_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0] "" ] } {
  create_report_config -report_name impl_1_route_report_incremental_reuse_0 -report_type report_incremental_reuse:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_incremental_reuse_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.cells" -value "" -objects $obj
set_property -name "options.hierarchical" -value "0" -objects $obj
set_property -name "options.hierarchical_depth" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_clock_utilization_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0] "" ] } {
  create_report_config -report_name impl_1_route_report_clock_utilization_0 -report_type report_clock_utilization:1.0 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_clock_utilization_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.write_xdc" -value "0" -objects $obj
set_property -name "options.clock_roots_only" -value "0" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_route_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_route_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps route_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_route_report_bus_skew_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.slack_greater_than" -value "" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_timing_summary_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_timing_summary_0 -report_type report_timing_summary:1.0 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_timing_summary_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.check_timing_verbose" -value "0" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "10" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.report_unconstrained" -value "0" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.cell" -value "" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
# Create 'impl_1_post_route_phys_opt_report_bus_skew_0' report (if not found)
if { [ string equal [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0] "" ] } {
  create_report_config -report_name impl_1_post_route_phys_opt_report_bus_skew_0 -report_type report_bus_skew:1.1 -steps post_route_phys_opt_design -runs impl_1
}
set obj [get_report_configs -of_objects [get_runs impl_1] impl_1_post_route_phys_opt_report_bus_skew_0]
if { $obj != "" } {
set_property -name "is_enabled" -value "1" -objects $obj
set_property -name "options.delay_type" -value "" -objects $obj
set_property -name "options.setup" -value "0" -objects $obj
set_property -name "options.hold" -value "0" -objects $obj
set_property -name "options.max_paths" -value "" -objects $obj
set_property -name "options.nworst" -value "" -objects $obj
set_property -name "options.unique_pins" -value "0" -objects $obj
set_property -name "options.path_type" -value "" -objects $obj
set_property -name "options.slack_lesser_than" -value "" -objects $obj
set_property -name "options.slack_greater_than" -value "" -objects $obj
set_property -name "options.significant_digits" -value "" -objects $obj
set_property -name "options.warn_on_violation" -value "1" -objects $obj
set_property -name "options.more_options" -value "" -objects $obj

}
set obj [get_runs impl_1]
set_property -name "constrset" -value "constrs_1" -objects $obj
set_property -name "description" -value "Includes alternate algorithms for timing-driven optimization" -objects $obj
set_property -name "flow" -value "Vivado Implementation 2020" -objects $obj
set_property -name "name" -value "impl_1" -objects $obj
set_property -name "needs_refresh" -value "0" -objects $obj
set_property -name "pr_configuration" -value "" -objects $obj
set_property -name "srcset" -value "sources_1" -objects $obj
set_property -name "incremental_checkpoint" -value "" -objects $obj
set_property -name "auto_incremental_checkpoint" -value "0" -objects $obj
set_property -name "rqs_files" -value "" -objects $obj
set_property -name "incremental_checkpoint.more_options" -value "" -objects $obj
set_property -name "include_in_archive" -value "1" -objects $obj
set_property -name "gen_full_bitstream" -value "1" -objects $obj
set_property -name "strategy" -value "Performance_ExtraTimingOpt" -objects $obj
set_property -name "steps.init_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.init_design.tcl.post" -value "" -objects $obj
set_property -name "steps.opt_design.is_enabled" -value "1" -objects $obj
set_property -name "steps.opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.opt_design.args.verbose" -value "0" -objects $obj
set_property -name "steps.opt_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.power_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.power_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.power_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.power_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.place_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.place_design.tcl.post" -value "" -objects $obj
set_property -name "steps.place_design.args.directive" -value "ExtraTimingOpt" -objects $obj
set_property -name "steps.place_design.args.more options" -value "" -objects $obj
set_property -name "steps.post_place_power_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.post_place_power_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.post_place_power_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.post_place_power_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.phys_opt_design.is_enabled" -value "1" -objects $obj
set_property -name "steps.phys_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.phys_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.phys_opt_design.args.directive" -value "Explore" -objects $obj
set_property -name "steps.phys_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.route_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.route_design.tcl.post" -value "" -objects $obj
set_property -name "steps.route_design.args.directive" -value "NoTimingRelaxation" -objects $obj
set_property -name "steps.route_design.args.more options" -value "" -objects $obj
set_property -name "steps.post_route_phys_opt_design.is_enabled" -value "0" -objects $obj
set_property -name "steps.post_route_phys_opt_design.tcl.pre" -value "" -objects $obj
set_property -name "steps.post_route_phys_opt_design.tcl.post" -value "" -objects $obj
set_property -name "steps.post_route_phys_opt_design.args.directive" -value "Default" -objects $obj
set_property -name "steps.post_route_phys_opt_design.args.more options" -value "" -objects $obj
set_property -name "steps.write_bitstream.tcl.pre" -value "" -objects $obj
set_property -name "steps.write_bitstream.tcl.post" -value "" -objects $obj
set_property -name "steps.write_bitstream.args.raw_bitfile" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.mask_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.no_binary_bitfile" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.bin_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.readback_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.logic_location_file" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.verbose" -value "0" -objects $obj
set_property -name "steps.write_bitstream.args.more options" -value "" -objects $obj

# set the current impl run
current_run -implementation [get_runs impl_1]

puts "INFO: Project created:${_xil_proj_name_}"
# Create 'drc_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "drc_1" ] ] ""]} {
create_dashboard_gadget -name {drc_1} -type drc
}
set obj [get_dashboard_gadgets [ list "drc_1" ] ]
set_property -name "active_reports" -value "" -objects $obj
set_property -name "active_reports_invalid" -value "" -objects $obj
set_property -name "active_run" -value "0" -objects $obj
set_property -name "hide_unused_data" -value "1" -objects $obj
set_property -name "incl_new_reports" -value "0" -objects $obj
set_property -name "reports" -value "impl_1#impl_1_route_report_drc_0" -objects $obj
set_property -name "run.step" -value "route_design" -objects $obj
set_property -name "run.type" -value "implementation" -objects $obj
set_property -name "statistics.critical_warning" -value "1" -objects $obj
set_property -name "statistics.error" -value "1" -objects $obj
set_property -name "statistics.info" -value "1" -objects $obj
set_property -name "statistics.warning" -value "1" -objects $obj
set_property -name "view.orientation" -value "Horizontal" -objects $obj
set_property -name "view.type" -value "Graph" -objects $obj

# Create 'methodology_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "methodology_1" ] ] ""]} {
create_dashboard_gadget -name {methodology_1} -type methodology
}
set obj [get_dashboard_gadgets [ list "methodology_1" ] ]
set_property -name "active_reports" -value "" -objects $obj
set_property -name "active_reports_invalid" -value "" -objects $obj
set_property -name "active_run" -value "0" -objects $obj
set_property -name "hide_unused_data" -value "1" -objects $obj
set_property -name "incl_new_reports" -value "0" -objects $obj
set_property -name "reports" -value "impl_1#impl_1_route_report_methodology_0" -objects $obj
set_property -name "run.step" -value "route_design" -objects $obj
set_property -name "run.type" -value "implementation" -objects $obj
set_property -name "statistics.critical_warning" -value "1" -objects $obj
set_property -name "statistics.error" -value "1" -objects $obj
set_property -name "statistics.info" -value "1" -objects $obj
set_property -name "statistics.warning" -value "1" -objects $obj
set_property -name "view.orientation" -value "Horizontal" -objects $obj
set_property -name "view.type" -value "Graph" -objects $obj

# Create 'power_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "power_1" ] ] ""]} {
create_dashboard_gadget -name {power_1} -type power
}
set obj [get_dashboard_gadgets [ list "power_1" ] ]
set_property -name "active_reports" -value "" -objects $obj
set_property -name "active_reports_invalid" -value "" -objects $obj
set_property -name "active_run" -value "0" -objects $obj
set_property -name "hide_unused_data" -value "1" -objects $obj
set_property -name "incl_new_reports" -value "0" -objects $obj
set_property -name "reports" -value "impl_1#impl_1_route_report_power_0" -objects $obj
set_property -name "run.step" -value "route_design" -objects $obj
set_property -name "run.type" -value "implementation" -objects $obj
set_property -name "statistics.bram" -value "1" -objects $obj
set_property -name "statistics.clocks" -value "1" -objects $obj
set_property -name "statistics.dsp" -value "1" -objects $obj
set_property -name "statistics.gth" -value "1" -objects $obj
set_property -name "statistics.gtp" -value "1" -objects $obj
set_property -name "statistics.gtx" -value "1" -objects $obj
set_property -name "statistics.gtz" -value "1" -objects $obj
set_property -name "statistics.io" -value "1" -objects $obj
set_property -name "statistics.logic" -value "1" -objects $obj
set_property -name "statistics.mmcm" -value "1" -objects $obj
set_property -name "statistics.pcie" -value "1" -objects $obj
set_property -name "statistics.phaser" -value "1" -objects $obj
set_property -name "statistics.pll" -value "1" -objects $obj
set_property -name "statistics.pl_static" -value "1" -objects $obj
set_property -name "statistics.ps7" -value "1" -objects $obj
set_property -name "statistics.ps" -value "1" -objects $obj
set_property -name "statistics.ps_static" -value "1" -objects $obj
set_property -name "statistics.signals" -value "1" -objects $obj
set_property -name "statistics.total_power" -value "1" -objects $obj
set_property -name "statistics.transceiver" -value "1" -objects $obj
set_property -name "statistics.xadc" -value "1" -objects $obj
set_property -name "view.orientation" -value "Horizontal" -objects $obj
set_property -name "view.type" -value "Graph" -objects $obj

# Create 'timing_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "timing_1" ] ] ""]} {
create_dashboard_gadget -name {timing_1} -type timing
}
set obj [get_dashboard_gadgets [ list "timing_1" ] ]
set_property -name "active_reports" -value "" -objects $obj
set_property -name "active_reports_invalid" -value "" -objects $obj
set_property -name "active_run" -value "0" -objects $obj
set_property -name "hide_unused_data" -value "1" -objects $obj
set_property -name "incl_new_reports" -value "0" -objects $obj
set_property -name "reports" -value "impl_1#impl_1_route_report_timing_summary_0" -objects $obj
set_property -name "run.step" -value "route_design" -objects $obj
set_property -name "run.type" -value "implementation" -objects $obj
set_property -name "statistics.ths" -value "1" -objects $obj
set_property -name "statistics.tns" -value "1" -objects $obj
set_property -name "statistics.tpws" -value "1" -objects $obj
set_property -name "statistics.whs" -value "1" -objects $obj
set_property -name "statistics.wns" -value "1" -objects $obj
set_property -name "view.orientation" -value "Horizontal" -objects $obj
set_property -name "view.type" -value "Table" -objects $obj

# Create 'utilization_1' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_1" ] ] ""]} {
create_dashboard_gadget -name {utilization_1} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_1" ] ]
set_property -name "active_reports" -value "" -objects $obj
set_property -name "active_reports_invalid" -value "" -objects $obj
set_property -name "active_run" -value "0" -objects $obj
set_property -name "hide_unused_data" -value "1" -objects $obj
set_property -name "incl_new_reports" -value "0" -objects $obj
set_property -name "reports" -value "synth_1#synth_1_synth_report_utilization_0" -objects $obj
set_property -name "run.step" -value "synth_design" -objects $obj
set_property -name "run.type" -value "synthesis" -objects $obj
set_property -name "statistics.bram" -value "1" -objects $obj
set_property -name "statistics.bufg" -value "1" -objects $obj
set_property -name "statistics.dsp" -value "1" -objects $obj
set_property -name "statistics.ff" -value "1" -objects $obj
set_property -name "statistics.gt" -value "1" -objects $obj
set_property -name "statistics.io" -value "1" -objects $obj
set_property -name "statistics.lut" -value "1" -objects $obj
set_property -name "statistics.lutram" -value "1" -objects $obj
set_property -name "statistics.mmcm" -value "1" -objects $obj
set_property -name "statistics.pcie" -value "1" -objects $obj
set_property -name "statistics.pll" -value "1" -objects $obj
set_property -name "statistics.uram" -value "1" -objects $obj
set_property -name "view.orientation" -value "Horizontal" -objects $obj
set_property -name "view.type" -value "Graph" -objects $obj

# Create 'utilization_2' gadget (if not found)
if {[string equal [get_dashboard_gadgets  [ list "utilization_2" ] ] ""]} {
create_dashboard_gadget -name {utilization_2} -type utilization
}
set obj [get_dashboard_gadgets [ list "utilization_2" ] ]
set_property -name "active_reports" -value "" -objects $obj
set_property -name "active_reports_invalid" -value "" -objects $obj
set_property -name "active_run" -value "0" -objects $obj
set_property -name "hide_unused_data" -value "1" -objects $obj
set_property -name "incl_new_reports" -value "0" -objects $obj
set_property -name "reports" -value "impl_1#impl_1_place_report_utilization_0" -objects $obj
set_property -name "run.step" -value "place_design" -objects $obj
set_property -name "run.type" -value "implementation" -objects $obj
set_property -name "statistics.bram" -value "1" -objects $obj
set_property -name "statistics.bufg" -value "1" -objects $obj
set_property -name "statistics.dsp" -value "1" -objects $obj
set_property -name "statistics.ff" -value "1" -objects $obj
set_property -name "statistics.gt" -value "1" -objects $obj
set_property -name "statistics.io" -value "1" -objects $obj
set_property -name "statistics.lut" -value "1" -objects $obj
set_property -name "statistics.lutram" -value "1" -objects $obj
set_property -name "statistics.mmcm" -value "1" -objects $obj
set_property -name "statistics.pcie" -value "1" -objects $obj
set_property -name "statistics.pll" -value "1" -objects $obj
set_property -name "statistics.uram" -value "1" -objects $obj
set_property -name "view.orientation" -value "Horizontal" -objects $obj
set_property -name "view.type" -value "Graph" -objects $obj

move_dashboard_gadget -name {utilization_1} -row 0 -col 0
move_dashboard_gadget -name {power_1} -row 1 -col 0
move_dashboard_gadget -name {drc_1} -row 2 -col 0
move_dashboard_gadget -name {timing_1} -row 0 -col 1
move_dashboard_gadget -name {utilization_2} -row 1 -col 1
move_dashboard_gadget -name {methodology_1} -row 2 -col 1

# Generate Block Design (BW)
generate_target all [get_files  $origin_dir/SipHashZcu106/SipHashZcu106.srcs/sources_1/bd/SipHashZcu106/SipHashZcu106.bd]

# Generate VHDL wrapper (BW)
make_wrapper -files [get_files $origin_dir/SipHashZcu106/SipHashZcu106.srcs/sources_1/bd/SipHashZcu106/SipHashZcu106.bd] -top
add_files -norecurse $origin_dir/SipHashZcu106/SipHashZcu106.srcs/sources_1/bd/SipHashZcu106/hdl/SipHashZcu106_wrapper.vhd
