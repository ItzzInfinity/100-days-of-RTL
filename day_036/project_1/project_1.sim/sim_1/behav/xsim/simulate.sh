#!/usr/bin/env bash
# ****************************************************************************
# Vivado (TM) v2024.1 (64-bit)
#
# Filename    : simulate.sh
# Simulator   : AMD Vivado Simulator
# Description : Script for simulating the design by launching the simulator
#
# Generated by Vivado on Sun Oct 13 16:56:03 IST 2024
# SW Build 5076996 on Wed May 22 18:36:09 MDT 2024
#
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# Copyright 2022-2024 Advanced Micro Devices, Inc. All Rights Reserved.
#
# usage: simulate.sh
#
# ****************************************************************************
set -Eeuo pipefail
# simulate design
echo "xsim three_to_eight_decoder_tb_behav -key {Behavioral:sim_1:Functional:three_to_eight_decoder_tb} -tclbatch three_to_eight_decoder_tb.tcl -log simulate.log"
xsim three_to_eight_decoder_tb_behav -key {Behavioral:sim_1:Functional:three_to_eight_decoder_tb} -tclbatch three_to_eight_decoder_tb.tcl -log simulate.log

