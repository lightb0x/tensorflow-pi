#!/bin/bash
version=$1
if [ $version = "2.2.0" ]
then
    gID="175SQaXgc5eLlIPrkf1Lskx3gA4gmzy7r"
    chk="^e2b702ee8d8cc5dd064c11563b1dbb48*"
elif [ $version = "2.3.1" ]
then
    gID="139vgrWvVLyqdLf-sr5btL4iF6i6RlLqQ"
    chk="^0eca8ccb0b5f1954f81796e66b2d1ec8*"
else
    echo "not available."
    exit 1
fi

/bin/bash ./gdrive_download.sh $gID
cchk=$(md5sum ./tensorflow-$version-cp37-none-linux_armv7l.whl)
if [[ $cchk =~ $chk ]]
then
    echo "checksum passed"
else
    echo "corrupted file"
    exit 1
fi

python3 -m pip install tensorflow-$version-cp37-none-linux_armv7l.whl

