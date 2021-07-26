#!/bin/bash
script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Started building native libraries... Directory: $script_dir"

build_dir="$script_dir/cmake-build-release"
lib_dir="$script_dir/lib/"

cmake -S $script_dir/src/c/stb_image -B $build_dir
cmake --build $build_dir --config Release
mkdir -p $lib_dir

for filepath in $build_dir/*.{a,dylib,so}; do
    if [[ -f $filepath ]]; then
        filename="${filename##*/}"
        filepath_new="${lib_dir}${filename}"
        mv $filepath $filepath_new
        echo "Moved $filepath to $filepath_new"
    fi
done

rm -r $build_dir
echo "Finished building native libraries."