webtalk_init -webtalk_dir /home/chrispy/workspace/cod_lab4/cod_lab4.sim/sim_1/behav/xsim/xsim.dir/slt_16_testbench_behav/webtalk/
webtalk_register_client -client project
webtalk_add_data -client project -key date_generated -value "Sun Nov 15 15:28:53 2020" -context "software_version_and_target_device"
webtalk_add_data -client project -key product_version -value "XSIM v2019.2 (64-bit)" -context "software_version_and_target_device"
webtalk_add_data -client project -key build_version -value "2708876" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_platform -value "LIN64" -context "software_version_and_target_device"
webtalk_add_data -client project -key registration_id -value "" -context "software_version_and_target_device"
webtalk_add_data -client project -key tool_flow -value "xsim_vivado" -context "software_version_and_target_device"
webtalk_add_data -client project -key beta -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key route_design -value "FALSE" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_family -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_device -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_package -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key target_speed -value "not_applicable" -context "software_version_and_target_device"
webtalk_add_data -client project -key random_id -value "029d18be-4587-4fb4-a6ec-7ce5197d95fb" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_id -value "02b5322fde53492e8ead4750ed1019bb" -context "software_version_and_target_device"
webtalk_add_data -client project -key project_iteration -value "3" -context "software_version_and_target_device"
webtalk_add_data -client project -key os_name -value "Ubuntu" -context "user_environment"
webtalk_add_data -client project -key os_release -value "Ubuntu 20.04.1 LTS" -context "user_environment"
webtalk_add_data -client project -key cpu_name -value "AMD Ryzen 7 3800X 8-Core Processor" -context "user_environment"
webtalk_add_data -client project -key cpu_speed -value "2199.544 MHz" -context "user_environment"
webtalk_add_data -client project -key total_processors -value "1" -context "user_environment"
webtalk_add_data -client project -key system_ram -value "16.000 GB" -context "user_environment"
webtalk_register_client -client xsim
webtalk_add_data -client xsim -key Command -value "xsim" -context "xsim\\command_line_options"
webtalk_add_data -client xsim -key trace_waveform -value "true" -context "xsim\\usage"
webtalk_add_data -client xsim -key runtime -value "70 ns" -context "xsim\\usage"
webtalk_add_data -client xsim -key iteration -value "0" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Time -value "0.01_sec" -context "xsim\\usage"
webtalk_add_data -client xsim -key Simulation_Memory -value "119236_KB" -context "xsim\\usage"
webtalk_transmit -clientid 2255934542 -regid "" -xml /home/chrispy/workspace/cod_lab4/cod_lab4.sim/sim_1/behav/xsim/xsim.dir/slt_16_testbench_behav/webtalk/usage_statistics_ext_xsim.xml -html /home/chrispy/workspace/cod_lab4/cod_lab4.sim/sim_1/behav/xsim/xsim.dir/slt_16_testbench_behav/webtalk/usage_statistics_ext_xsim.html -wdm /home/chrispy/workspace/cod_lab4/cod_lab4.sim/sim_1/behav/xsim/xsim.dir/slt_16_testbench_behav/webtalk/usage_statistics_ext_xsim.wdm -intro "<H3>XSIM Usage Report</H3><BR>"
webtalk_terminate
