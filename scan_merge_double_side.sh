#/bin/bash

echo "use as scan_merge_double_side.sh file1.pdf file2.pdf"

export tot1=`pdftk $1 dump_data output | grep NumberOfPages | awk '{print $2}'`
export tot2=`pdftk $2 dump_data output | grep NumberOfPages | awk '{print $2}'`

echo $tot1
echo $tot2

file1=$1
file2=$2 

merged=$1_$2

j=$tot1
list=`for i in \`seq 1 $tot1\`
	do 
	echo -n "A$i "
	let j=tot1-i+1 
	echo -n "B$j " 
	done 
echo` 

echo pdftk A=$file1  B=$file2 cat $list output $merged
