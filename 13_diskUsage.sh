DATE=$(date +%F--%H:%M:%S)
USERID=$(id -u)
SCRIPT_NAME=$0
LOGDIR=/tmp
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

DISK_USAGE=$(df -h | grep -vE "tmpfs|Filesystem")
DISK_USAGE_THRESHOLD=1

# Create and attach a new volume to you EC2 Running Instance...!
# Volume must be available in the same AZ where your EC2 is running.

while read line
do 

    echo "Output : $line"

done <<< $DISK_USAGE


