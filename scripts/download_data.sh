manifest=$PWD/$1

cd ./data/

mkdir tcga_coad_450probes

cd tcga_coad_450probes

../../scripts/gdc-client download -m $manifest
 
