#!/bin/bash
echo  "=======cpu usage ======="
top -bn1 | grep "%Cpu"
echo "successfully cpu monitored"
