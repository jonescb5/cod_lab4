#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Tue Nov 17 23:28:11 EST 2020
# SW Build 2708876 on Wed Nov  6 21:39:14 MST 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto 02b5322fde53492e8ead4750ed1019bb --incr --debug typical --relax --mt 8 -L xil_defaultlib -L knappe_lib -L secureip --snapshot processor_toplevel_testbench_behav xil_defaultlib.processor_toplevel_testbench -log elaborate.log"
xelab -wto 02b5322fde53492e8ead4750ed1019bb --incr --debug typical --relax --mt 8 -L xil_defaultlib -L knappe_lib -L secureip --snapshot processor_toplevel_testbench_behav xil_defaultlib.processor_toplevel_testbench -log elaborate.log

