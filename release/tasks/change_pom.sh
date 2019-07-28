#!/bin/bash
region=${1}
art=`echo -e 'setns x=http://maven.apache.org/POM/4.0.0\ncat /x:project/x:artifactId/text()' | xmllint --shell pom.xml | grep -v /`
isZZ=`echo "$art"|awk -F'--' '{print $2}'`
if [ "$isZZ" = "zz" ]
   then
   iszz=`echo "$art"|awk -F'--' '{print $1}'`
   newart=${isZZ}${region}
   else
   newart=${art}${region}
fi

sed -i "s/$art/$newart/" pom.xml
#rm -Rf /home/ec2-user/autorel/*'
# sed -i "s/${art}.raml/${newart}.raml/" pom.xml
