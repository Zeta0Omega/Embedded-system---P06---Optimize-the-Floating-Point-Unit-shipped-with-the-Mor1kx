#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.2 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sat Feb 09 12:40:49 CET 2019
# SW Build 2258646 on Thu Jun 14 20:02:38 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xsim tb_i2f_func_synth -key {Post-Synthesis:sim_1:Functional:tb_i2f} -tclbatch tb_i2f.tcl -view /home/luca/Scrivania/ES_Project/FPU_fast/tb_i2f_behav.wcfg -view /home/luca/Scrivania/ES_Project/FPU_fast/tb_i2f_behavtesting.wcfg -view /home/luca/Scrivania/ES_Project/FPU_fast/mul_behav.wcfg -log simulate.log