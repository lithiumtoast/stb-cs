#!/bin/bash

function exit_if_last_command_failed() {
    error=$?
    if [ $error -ne 0 ]; then
        exit $error
    fi
}

function download_C2CS_ubuntu() {
    if [ ! -f "./C2CS" ]; then
        wget https://nightly.link/lithiumtoast/c2cs/workflows/build-test-deploy/main/ubuntu.20.04-x64.zip
        unzip ./ubuntu.20.04-x64.zip
        rm ./ubuntu.20.04-x64.zip
        chmod +x ./C2CS
    fi
}

function download_C2CS_osx() {
    if [ ! -f "./C2CS" ]; then
        wget https://nightly.link/lithiumtoast/c2cs/workflows/build-test-deploy/main/osx-x64.zip
        unzip ./osx-x64.zip
        rm ./osx-x64.zip
        chmod +x ./C2CS
    fi
}

function bindgen {
    ./C2CS ast -i ./src/c/stb_image/main.h -o ./ast/stb_image.json -s ./ext/stb -b 64
    exit_if_last_command_failed
    ./C2CS cs -i ./ast/stb_image.json -o ./src/cs/production/stb_image-cs/stb_image.cs -l "stb_image" -c "stb_image" -a \
"stbi_uc -> byte" \
"stbi_us -> ushort"
    exit_if_last_command_failed
}

unamestr="$(uname | tr '[:upper:]' '[:lower:]')"
if [[ "$unamestr" == "linux" ]]; then
    download_C2CS_ubuntu
    bindgen
elif [[ "$unamestr" == "darwin" ]]; then
    download_C2CS_osx
    bindgen
else
    echo "Unknown platform: '$unamestr'."
fi
