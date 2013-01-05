#!/bin/sh

PATH="/sbin:/bin:/usr/sbin:/usr/bin"

mount -n proc /proc -t proc
mount -n sysfs /sys -t sysfs

if grep devtmpfs /proc/filesystems 1>/dev/null 2>/dev/null ; then
  DEVTMPFS=1
  mount -n devtmpfs /dev -t devtmpfs
fi

/sbin/syslogd 2> /dev/null
sleep 1
/sbin/klogd -c 3 1> /dev/null

/sbin/udevd --daemon 2>/dev/null
