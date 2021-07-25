#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Started building native libraries... Directory: $script_dir"

build_dir="$script_dir/cmake-build-release"
lib_dir="$script_dir/lib/"

cmake -S $script_dir/src/c/stb_image -B $build_dir
cmake --build $build_dir --config Release
mkdir -p $lib_dir

for filename in $build_dir/*.{a,dylib,so}; do
    if [[ -f $filename ]]; then
        filename_base="${filename##*/}"
        filename_new="${lib_dir}${filename_base}"
        mv $filename $filename_new
        echo "Moved $filename to $filename_new"
    fi
done

rm -r $build_dir
echo "Finished building native libraries."