#!/bin/bash
# Program:
#	This program is used to check which students have handed in their homework and output those who haven't handed it in or have handed in the wrong type of archive.
# History: 
# 2023/03/17

PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin


#unzip Linux_Week5_Lab.zip

targetFile="/home/maomao/Downloads/Linux_Week5_Lab"

for file in "${targetFile}/compressed_files/"*;
do 
	namefile=${file%%.*}
	echo "${namefile##*/}" >> "${targetFile}/handInID.txt"
done

grep -v -f "${targetFile}/handInID.txt" "${targetFile}/student_id" > "${targetFile}/missing_list"

mkdir "${targetFile}/compressed_files/zip/" "${targetFile}/compressed_files/rar/" "${targetFile}/compressed_files/tar.gz/" "${targetFile}/compressed_files/unknown/"

find ${targetFile}/compressed_files/ -maxdepth 1 -type f -name "*.rar" -exec mv {} ${targetFile}/compressed_files/rar/ \;
find ${targetFile}/compressed_files/ -maxdepth 1 -type f -name "*.zip" -exec mv {} ${targetFile}/compressed_files/zip/ \;
find ${targetFile}/compressed_files/ -maxdepth 1 -type f -name "*.tar.gz" -exec mv {} ${targetFile}/compressed_files/tar.gz/ \;
find ${targetFile}/compressed_files/ -maxdepth 1 -type f -exec mv {} ${targetFile}/compressed_files/unknown/ \;


for f in ${targetFile}/compressed_files/unknown/*;
do
        namefile=${f%%.*}
        echo "${namefile##*/}" >> "${targetFile}/wrong_list"
done
	

for r in ${targetFile}/compressed_files/rar/*; do
	unrar e ${r} ${targetFile}/compressed_files/rar/
done

for z in ${targetFile}/compressed_files/zip/*; do
	unzip ${z} -d ${targetFile}/compressed_files/zip/
done

for t in ${targetFile}/compressed_files/tar.gz/*; do
	tar -xf ${t} -C ${targetFile}/compressed_files/tar.gz/
done

rm ${targetFile}/compressed_files handInID.txt
