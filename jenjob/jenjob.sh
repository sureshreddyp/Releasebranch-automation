#!/bin/bash
read -p 'jenkins user:' user
read -s -p 'password:' pass

while read line
do
var_url=`echo "$line" |awk -F',' '{print $1}'`
cp jentemplate.xml config.xml
# updating config.xml file
sed -i -e "s#var_url#$var_url#" config.xml
# creating jenkins job
curl -X POST --user ${user}:${pass} http://3.15.21.214:8080/jenkins/createItem?name=new-git02 --data-binary @config.xml -H "Content-Type:text/xml"
rm -rf config.xml
done < jobdetails.txt
