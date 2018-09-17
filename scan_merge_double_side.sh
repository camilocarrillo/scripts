#/bin/bash

echo "use as scan_merge_double_side.sh A-sides.pdf B-sides-reversed.pdf"

export tot1=`pdftk $1 dump_data output | grep NumberOfPages | awk '{print $2}'`
export tot2=`pdftk $2 dump_data output | grep NumberOfPages | awk '{print $2}'`

echo $tot1
echo $tot2

file1=$1
file2=$2 

if [ $tot1 == $tot2 ]
then
    echo "both documents have the same number of pages:$tot1"
else
    echo "the documents do not have the same number of pages, $file1:$tot1 $file2:$tot2"
    exit 
fi

export name1=`echo $1 | sed -e "s|.pdf||g"`
export mergedname=`echo "$name1-$2"`

j=$tot1
list=`for i in \`seq 1 $tot1\`
	do 
	echo -n "A$i "
	let j=tot1-i+1 
	echo -n "B$j " 
	done 
echo` 

echo "execute:"
echo pdftk A=$file1  B=$file2 cat $list output $mergedname
