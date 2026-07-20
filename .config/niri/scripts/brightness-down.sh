#!/bin/sh
# Decrease monitor brightness via DDC/CI
ddcutil setvcp 10 - 5 --bus 2
