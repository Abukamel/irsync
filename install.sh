#!/bin/bash
#
#
inspath=/usr/local/irsync

if [ ! -d "$inspath" ] && [ -d "files" ]; then
	mkdir -p $inspath
	chmod 750 $inspath
	cp -pR files/* $inspath
	cp CHANGELOG COPYING.GPL README $inspath
	chmod 750 $inspath/irsync
	chmod 750 $inspath/irsync-rate
	ln -fs $inspath/irsync /usr/local/sbin
	ln -fs $inspath/irsync-rate /usr/local/sbin
else
	bkpath=$inspath.bk$$
	mv $inspath $bkpath
	mkdir -p $inspath
	chmod 750 $inspath
	cp -pR files/* $inspath
	cp CHANGELOG COPYING.GPL README $inspath
	chmod 750 $inspath/irsync
	chmod 750 $inspath/irsync-rate
	ln -fs $inspath/irsync /usr/local/sbin
	ln -fs $inspath/irsync-rate /usr/local/sbin
	cp -f $bkpath/paths.irsync $bkpath/excludes.irsync $inspath
	cp -f $bkpath/ssh/* $inspath/ssh
fi

	echo "irsync version 1.0 <irsync@r-fx.org>"
	echo "Copyright (C) 2010, Ryan MacDonald <ryan@r-fx.org>"
	echo "This program may be freely redistributed under the terms of the GNU GPL"
	echo ""
	echo "installation completed:"
	echo "install path: $inspath"
	echo "config file: $inspath/conf.irsync"
	echo "executables: irsync , irsync-rate"
