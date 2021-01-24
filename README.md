# iocage-plugin-lidarr
Artifact file(s) for iocage lidarr plugin.

**Note:** This will install version 0.5.0.583.  You can install this version and use the update feature in Lidarr or you change the version to install.
* To change the version to install go to https://github.com/lidarr/Lidarr/releases and find the latest release, **Lidar.develop.x.x.x.xxx.linux.tar.gz**   
* In iocage-plugin-lidarr **post_install.sh** script, change VERSION="x.x.x.xxx" to be the version you want.

## To install this Plugin
Download the plugin manifest file to your local file system.
```
fetch https://raw.githubusercontent.com/dlcisme/iocage-my-plugins/master/lidarr.json
```
Install the plugin.  Adjust host interface and IP address as needed.  
```
iocage fetch -P -n lidarr.json ip4_addr="em0|192.168.0.100"
```


NOTE: I had issues running Lidarr once the mount points were created. To resolve:
* stop the lidarr service
* make a copy of the app-data/lidarr/Backups folder (you need this to restore a backup)
* clean out (delete) all the files in the app-data/lidarr folder
* restart the lidarr service (it will create all the files it needs)
* stop the lidarr service
* copy the files (backups) from the backup folder you saved previously into the /app-data/lidarr/Backups folder
* start the lidarr service
* restore a backup (lidarr should be back to normal now)
