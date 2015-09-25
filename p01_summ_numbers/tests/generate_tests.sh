echo "1 1" > t001.dat
echo 2 > t001.dat.ans

echo "1 2" > t002.dat
echo 3 > t002.dat.ans

echo "1 1 1" > t003.dat
echo 3 > t003.dat.ans

echo "1000000000 1000000000" > t004.dat
echo 2000000000 > t004.dat.ans

seq 10 > t011.dat
echo 55 > t011.dat.ans
seq 100 > t012.dat
echo 5050 > t012.dat.ans
seq 1000 > t013.dat
echo 500500 > t013.dat.ans

perl -e 'print "1\n" for 1..1000' > t021.dat
echo 1000 > t021.dat.ans
perl -e 'print "0\n" for 1..1000' > t022.dat
echo 0 > t022.dat.ans


