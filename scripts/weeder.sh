if [ ! -d workingdir ]
then
# gather TagGroup files
mkdir workingdir
for i in `find ../historical -name '*TagGroup.json'`
do
FILENAME="`basename $i`"
cp --backup=numbered $i workingdir/$FILENAME
done
fi
# compare TagGroup to copies
for i in `find workingdir -name '*TagGroup.json'`
do
FILENAME="`basename $i`"
for j in workingdir/$FILENAME.~*
do
	diff -ub >/dev/null $i $j && (ls -l $i $j ; rm -f $j)
done
for k in workingdir/$FILENAME.~*
do
if [ -f $k ]
then
for j in workingdir/$FILENAME.~*
do
if [ -f $j ]
then
if [ "$j" != "$k" ]
then
	diff -ub >/dev/null $k $j && (ls -l $k $j ; rm -f $j)
fi
fi
done
fi
done
#WHATSLEFT="`ls workingdir/${FILENAME}*`"
#for j in $WHATSLEFT
#do
#	for k in $WHATSLEFT
#	do
#		if [ $j != $k ]
#		then
#			echo $j $k
#			#kdiff3 $j $k | grep -c -e '^[-+]'
			#kdiff3 $j $k 
#		fi
#	done
#done

done
# whatever is left, move it to its context directory
for i in workingdir/*
do
CONTEXT=`grep "context" $i |
sed 's;^.*context" *: *";;
s;" *,[ \t\n\r]*$;;'` 
VERSION=`grep -e '"version" *: *"' $i |
sed 's;^.*"version" *: *";;
s;" *,.*$;;' `
echo $CONTEXT $VERSION
mkdir -p $CONTEXT/$VERSION
mv $i $CONTEXT/$VERSION
done
rmdir workingdir
rm -fr com.vision.*
for i in `find . -type f`
do
j=`echo $i | sed 's/.json.*$/.json/'`
if [ $i != $j ]
then
mv -i $i $j
fi
done
