import pandas as pd
import sys
import os

len(sys.argv)

if len(sys.argv) != 3:
    print("usage (python3): python process_probes.py <indir> <outdir>")
    sys.exit()

# indir = sys.argv[1]
indir = "/global/projectb/scratch/mmingay/gdc_cancer/TCGA-COAD/methylation"
# outdir = sys.argv[2]
outdir = "/global/projectb/scratch/mmingay/gdc_cancer/temp/"

if not os.path.isdir(outdir):
    os.system('mkdir ' + outdir)
    
indirs = os.listdir(indir)

for subdir in indirs:
    subdir = os.path.join(indir,subdir)
    files = os.listdir(subdir)
    for file in files:
        if file.endswith(".gdc_hg38.txt"):
            filepath = os.path.join(subdir,file)
            filename = filepath.rsplit("lvl-3.")[1].rsplit(".gdc")[0]
            outpath = os.path.join(outdir,filename) + "_betavalues.bed"
            df = pd.read_csv(filepath, sep="\t", header=None, skiprows=1)
            outdf = df.copy()[[1, 9]]
            meandf = outdf.groupby(9).mean()
            meandf[1:len(meandf)].to_csv(outpath, sep="\t", header=None, index=False)