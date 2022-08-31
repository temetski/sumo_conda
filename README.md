# sumo_conda
Scripts to install a working build of sumo using only the conda compiling toolkit

This is a useful script to install a running copy of sumo on kubernetes-like systems that lack administrative privileges.

## Usage
Run the `sumo_install.sh` script using a bash terminal.
```
bash sumo_install.sh
```
This installs a conda environment named sumo, which will then download and compile sumo as a headless application.

## Issues
Currently, `libsumo` does not work due to hardcoded dependencies on the `libfox` headers.
