#! /bin/bash
shopt -s expand_aliases

if command -v mamba &> /dev/null
then
    echo "using mamba"
    alias conda=mamba
fi

if [ "$(uname)" == "Darwin" ]; then
    echo "installing macos build tools"
    build_tools="clang_osx-64 clangxx_osx-64"
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    echo "installing linux build tools"
    build_tools="gcc_linux-64 gxx_linux-64"
fi

conda create -n sumo -y python=3 xerces-c cmake swig gdal proj $build_tools
source activate sumo

pushd ~/

git clone --recursive https://github.com/eclipse/sumo
pushd sumo
echo export SUMO_HOME=$(pwd) >> ~/.bashrc
mkdir -p build/cmake-build/
cd build/cmake-build/
cmake ../..
make -j4

echo 'export PYTHONPATH="$SUMO_HOME/tools:$PYTHONPATH"'  >> ~/.bashrc
echo 'export PATH="$SUMO_HOME/bin:$PATH"'  >> ~/.bashrc
source ~/.bashrc