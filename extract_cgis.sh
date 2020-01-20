#!/bin/bash

region=/global/projectb/scratch/mmingay/gdc_cancer/regions/pid_illmn_probes_hg19_cgi_bothbuild.bed
outdir=/global/projectb/scratch/mmingay/gdc_cancer/coverage/cgi/

cd /global/projectb/scratch/mmingay/gdc_cancer/TCGA-COAD/processed_methyl450/

for methylprobe in *.bed

do
        name=$(echo $methylprobe | awk '{gsub("_betavalues.bed", "", $0); print $0}')
        echo "processing data for "$name
        cat $methylprobe | awk 'NR >1 {print $6"\t"$4}'| sort | \
        join - $region | \
        awk '{print $3"\t"$4"\t"$5"\t"$2"\t"$1}' | sort -k1,1 -k2,2n > $outdir$name"_cgi_betavalues.bed"

done

