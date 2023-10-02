# gitauto and utils

## gitauto
Short shell script to speed up small commits.
It takes a filename as argument and prompts for the commit message.
Aborts if empty commit message and/or non-existent file
#### USAGE
```
./gitauto [FILE] 
```
where ***[FILE]*** is the file you want to commit and push.

## cpyfile - create py file
interactive pyfile generator. the files generated will include ``#!/usr/bin/python3`` at the top
it will also make the permissions of the created file to u+x
will check if exists and will error exit on failed file creation.
#### USAGE
```
./cpyfile
```

## install_util.sh - installer
interactve installer, must be run with sudo otherwise will exit 1
it prompts you to copy either/both gitauto and cpyfile into you ``/usr/bin`` directory
