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


MESSAGE=""
while IFS= read line
do 
    # this will extract the disk usage in number format
    USAGE=$(echo $line | awk '{print $6}' | cut -d % -f 1)
    echo $USAGE

    # this command will extact the partition from the line
    PARTITION=$(echo $line | awk '{print $1}')

    #check whether disk usage is greater than threshold value
    if [ $USAGE -gt $DISK_USAGE_THRESHOLD ]
    then
        MESSAGE+="High Usage on disk $PARTITION: $USAGE"
    fi

done <<< $DISK_USAGE

echo -e " $R MESSAGE ALERT : $MESSAGE $N "
echo "$MESSAGE" | mail -s "Warning ! High Disk Usage Alert..." rashidkhan7805@gmail.com 