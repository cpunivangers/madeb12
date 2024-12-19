#!/bin/sh

# Steve Zazeski
# Compression e-pub
# dependence webp

echo compressing with webp...

rm -rf /tmp/epub #delete the folder if it already exists
unzip "$1" -d /tmp/epub

# find all images
shopt -s globstar
for i in /tmp/epub/*.{png,jpg,jpeg}; do
    cwebp -short "${i}" -o "${i}"
done

# zip epub
zip -0 -X "/tmp/compress.epub" mimetype
zip -rDX9 "/tmp/compress.epub" /tmp/epub/* -x mimetype
cd ..

rm -rf /tmp/epub # remove work directory

# move the compressed one and rename the other to original
mv "$1" "${1}.original"
mv /tmp/compress.epub "$1"

echo '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
du -h "${1}.original"
du -h "$1"
echo '-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-'
