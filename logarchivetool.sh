#!/bin/bash

#This is a command line tool for log archiving

logfile_name=$(basename "$1")
#echo "$logfile_name"
tarball_name="${logfile_name}_$(date +"%Y%m%d")_$(date +"%H%M%S").tar.gz"
#echo "$tarball_name"
newdir_name="newarchive"

sudo mkdir "$newdir_name"
sudo tar -czf "$newdir_name/$tarball_name" "$1"
