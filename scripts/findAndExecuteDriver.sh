#!/bin/bash

##############Variable Declarations################

testEnvHome='/home/debian/TestHome'
localDriverDir='/home/debian/TestHome/attachmentDrivers'
driverList=`ls $localDriverDir`
attachmentNumber=`cat $testEnvHome/attachmentNumber`
githubCurlUrl='https://raw.githubusercontent.com/calebergy/Posterus/master/CompiledDrivers/driver'"$attachmentNumber"'/bin/'"$attachmentNumber"''

echo $attachmentNumber

isLocal=0

###############Search local directory for driver#####
for i in $driverList
do
	if [ $i -eq $attachmentNumber ]
	then
		echo 'Found driver on local machine'
		isLocal=1
		break
	fi
	echo 'End of iteration'
done

##############execute the local driver#############
if [ $isLocal -eq 1 ]
then
	echo 'Executing driver for attachment "'$attachmentNumber'"'
	$localDriverDir/$attachmentNumber
fi

#############Search github for driver############
if [ $isLocal -eq 0 ]
then
	echo 'Could not find driver for attachment "'$attachmentNumber'" on local machine'
	echo 'Searc
h github for driver'
	echo 'Downloading driver...'
	curl -k -o $localDriverDir/$attachmentNumber $githubCurlUrl
	echo 'Executing driver for attachment "'$attachmentNumber'"'
	chmod 777 $localDriverDir/$attachmentNumber
	$localDriverDir/$attachmentNumber
fi
