DATE=$(date +%F--%H:%M:%S)
USERID=$(id -u)
SCRIPT_NAME=$0
LOGDIR=/tmp
LOGFILE=$LOGDIR/$SCRIPT_NAME-$DATE.log

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

# This command will extract only the line except tmpfs or Filesystem i.e /dev/xvdf portions only.
DISK_USAGE=$(df -h | grep -vE "tmpfs|Filesystem")
DISK_USAGE_THRESHOLD=2

# Create and attach a new volume to you EC2 Running Instance...!
# Volume must be available in the same AZ where your EC2 is running.

# IFS= is the default Internal Field separator environment variable.
# Default IFS value is space.
# It will trim the extra whitespaces (no need but good practice to write)

#Looping through all the available disk lines

MESSAGE=""
while IFS= read line
do 
    # this will extract the disk usage in number format
    USAGE=$(echo $line | awk '{print $6}' | cut -d % -f 1)

    # this command will extact the partition from the line
    PARTITION=$(echo $line | awk '{print $1}')

    #check whether disk usage is greater than threshold value
    if [ $USAGE -gt $DISK_USAGE_THRESHOLD]
    then
        MESSAGE+="$R High Usage on disk $PARTITION : $USAGE $N"
    fi

done <<< $DISK_USAGE

echo -e " $R MESSAGE ALERT : $MESSAGE $N "
echo "$MESSAGE" | mail -s "Warning ! High Disk Usage Alert..." rashidkhan7805@gmail.com 