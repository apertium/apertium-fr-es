TMPDIR=/tmp

if [[ $1 = "spa-fra" ]]; then

lt-expand ../apertium-fra-spa.spa.dix | grep -v '<prn><enc>' | grep -e ':>:' -e '\w:\w' | sed 's/:>:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-fra-spa.spa-fra.t1x  ../spa-fra.t1x.bin  ../spa-fra.autobil.bin |
        apertium-interchunk ../apertium-fra-spa.spa-fra.t2x  ../spa-fra.t2x.bin |
        apertium-postchunk ../apertium-fra-spa.spa-fra.t3x  ../spa-fra.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../spa-fra.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'

elif [[ $1 = "fra-spa" ]]; then

lt-expand ../fra.dix | grep -v '<prn><enc>' | grep -e ':>:' -e '\w:\w' | sed 's/:>:/%/g' | sed 's/:/%/g' | cut -f2 -d'%' |  sed 's/^/^/g' | sed 's/$/$ ^.<sent>$/g' | tee $TMPDIR/tmp_testvoc1.txt |
        apertium-pretransfer|
        apertium-transfer ../apertium-fra-spa.fra-spa.t1x  ../fra-spa.t1x.bin  ../fra-spa.autobil.bin |
        apertium-interchunk ../apertium-fra-spa.fra-spa.t2x  ../fra-spa.t2x.bin |
        apertium-postchunk ../apertium-fra-spa.fra-spa.t3x  ../fra-spa.t3x.bin  | tee $TMPDIR/tmp_testvoc2.txt |
        lt-proc -d ../fra-spa.autogen.bin > $TMPDIR/tmp_testvoc3.txt
paste -d _ $TMPDIR/tmp_testvoc1.txt $TMPDIR/tmp_testvoc2.txt $TMPDIR/tmp_testvoc3.txt | sed 's/\^.<sent>\$//g' | sed 's/_/   --------->  /g'


else
	echo "sh inconsistency.sh <direction>";
fi
