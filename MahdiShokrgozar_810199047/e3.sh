#!/bin/bash

# find /home -type f -mtime -1 -ls

find /home -newermt "-24 hours" -ls
exit 1