#/bin/bash

DB_HOST=$1
DB_NAME=$2
DB_USER=$3
DB_PASSWORD=$4
BUCKET_NAME=$5

AWS_ACCESS_KEY_ID=$6
AWS_SECRET_ACCESS_KEY=$7
AWS_DEFAULT_REGION=$8

DATE=$(date +%H-%M-%S)
BACKUP=db-dump-$DATE.sql

mysqldump -u $DB_USER -h $DB_HOST -p$DB_PASSWORD $DB_NAME > /tmp/$BACKUP && \
export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID && \
export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY && \
export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION && \
echo "Uploading the $BACKUP backup to s3://$BUCKET_NAME" && \
aws s3 cp /tmp/$BACKUP s3://$BUCKET_NAME/$BACKUP 

echo "Deleting the local $BACKUP backup" && \
rm /tmp/$BACKUP 
