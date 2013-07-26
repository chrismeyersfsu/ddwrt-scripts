#!/bin/sh

# By default many DDWRT routers don't have very much persistant storage.
# This script sets up a usb device filesystem structure for mounting over (bind)
# directories to provide the usb storage.

ROOT=/tmp/mnt/disc0-part1/ddwrt_fs

mkdir -p $ROOT
mkdir -p $ROOT/etc
mkdir -p $ROOT/root
mkdir -p $ROOT/opt

chmod 755 $ROOT
chmod 755 $ROOT/etc
chmod 755 $ROOT/root
chmod 755 $ROOT/opt
