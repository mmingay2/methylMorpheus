#!/bin/bash

while [ -n "$1" ]; do # while loop starts

    case "$1" in

    -i)
        indir="$2"

        #echo "-o option passed, with value $outdir"

        shift
        ;;

    -o)
        outdir="$2"

        #echo "-l option passed, with value $labels"

        shift
        ;;

    *) echo "Option $1 not recognized" ;;

    esac

    shift

done

total=1

for param in "$@"; do

    echo "#$total: $param"

    total=$(($total + 1))

done

echo "making directory: "$outdir

mkdir $outdir

for tcgafile in $indir/*/*.gdc_hg38.txt

do

    name=$(echo $tcgafile | awk '{gsub(".*lvl-3.", "", $0); print $0}' | awk '{gsub(".gdc_hg38.txt", "", $0); print $0}')
    echo "processing data for: "$name
    awk 'NR > 1 {print $3"\t"$4"\t"$5"\t"$2"\t"$10"\t"$1"\t"$6}' $tcgafile | cut -d ";" -f 1 | sort -k1,1 -k2,2n > $outdir"/"$name"_betavalues.bed"

done


