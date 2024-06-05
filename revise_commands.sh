#!/bin/bash

# find all edited files in the last 30 minutes
find /path/to/directory -type f -mmin -30

# taking backup at time 00:00 everyday
0 0 * * * /path/to/backup.sh >>/var/log/backup.log 2>&1

# Find all empty directories in the current directory and delete them
find /path/to/start/directory -depth -type d -empty -exec rmdir {} \;

# setting the priority of a process to -10
nice -n -10 ./my_program

# setting the priority of a process to -5
renice -n -5 -p 12345

# open ports
netstat -tuln

# check the disk space
df -h