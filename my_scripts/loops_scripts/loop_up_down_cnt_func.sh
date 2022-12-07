#! /bin/bash -x
iteration=1
cntup() {
for i in {0..15..3}
do
echo "The No. $iteration iteration is $i"

iteration=$(( $iteration + 1 ))
done

echo -e "this \is the end of the loop"
}

cntdwn() {
for (( a=100; a<110; a++  ))
do
echo $a
done
}

#case $1 in 
#cntup)
#	"$@"; exit;;
#cntdwn)
#	"$@"; exit;;

#esac

cntup
cntdwn
