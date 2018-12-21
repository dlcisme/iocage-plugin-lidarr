
# set the version 
VERSION="0.5.0.583"
# set the destination to install "lidarr"
DESTINATION="/usr/local/share"

# make sure "mono" points to the proper location
ln -s /usr/local/bin/mono /usr/bin/mono

# get the "lidarr" package
fetch https://github.com/lidarr/Lidarr/releases/download/v$VERSION/Lidarr.develop.$VERSION.linux.tar.gz -o $DESTINATION

# unpack the package to the destination directory
tar -xzvf /usr/local/share/Lidarr.develop.*.linux.tar.gz -C $DESTINATION

# remove the package as no longer needed
rm $DESTINATION/Lidarr.*.tar.gz

# create "lidarr" user
pw user add lidarr -c lidarr -u 353 -d /nonexistent -s /usr/bin/nologin


mkdir /usr/local/lidarr

chown -R lidarr:lidarr /usr/local/share/Lidarr /usr/local/lidarr



chmod u+x /usr/local/etc/rc.d/lidarr

sysrc "lidarr_enable=YES"

service lidarr start


sysrc -f /etc/rc.conf  lidarr_enable="YES"

service start lidarr
