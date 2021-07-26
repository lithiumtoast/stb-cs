#!/bin/bash

regex='^.*(?<version>[0-9]+\.[0-9]+)\s+'
file='./ext/stb/stb_image.h'
grep -oP -m1 $regex $file