#!/bin/sh

# set the data location
DATA_LOCATION="/app-data/lidarr"

# create the data location
mkdir -p $DATA_LOCATION

# make "lidarr" the owner of the data locations
chown -R lidarr:lidarr $DATA_LOCATION

# give write permission for plugin update
chmod 755 $DATA_LOCATION

# make lidarr the owner of it's directory
chown -R lidarr:lidarr /usr/local/share/lidarr

# we need write permission to be able to write plugins update.
chmod 755 /usr/local/share/lidarr

# enable lidarr to start at boot
sysrc "lidarr_enable=YES"

# set the location for the data directory
sysrc "lidarr_data_dir=$DATA_LOCATION"

# start the lidarr service
service lidarr start
