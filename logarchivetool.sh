#!/usr/bin/env bash

#Author: Chamodi De Silva
#Date: 2025-04-26
#Version: 1.0
#Description: This script will take a log file as an argument and create an archive of the log file and create a new directory to store the archive
#Usage: ./logarchivetool.sh <logfile>
#Example: ./logarchivetool.sh /var/log/syslog

usage() {
    echo "Usage: logarchive <logfile>"
    echo "Example: logarchive /var/log/syslog"
}

if [ "$#" -eq 0 ]; then
    echo "Error: No arguments provided"
    usage
    exit 1
elif [ "$#" -gt 1 ]; then
    echo "Error: Too many arguments"
    usage
    exit 1
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    usage
    exit 0
elif [ ! -e "$1" ]; then
    echo "Error: File not found"
    usage
    exit 1
fi

logfile_name=$(basename "$1")
tarball_name="${logfile_name}_$(date +"%Y%m%d")_$(date +"%H%M%S").tar.gz"
newdir_name="newarchive"

mkdir -p "$newdir_name"
tar -czf "$newdir_name/$tarball_name" "$1" > /dev/null 2>&1
