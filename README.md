# methylMorpheus
This repo provides guidelines on how to acquire, process, visualize and analyze massive [TCGA](https://portal.gdc.cancer.gov/) datasets and associated clinical metadata using heatmaps ([Morpheus.js](https://github.com/cmap/morpheus.js)) in the browser.

The first step is to clone this directory. 

Move to a suitable directory (using `~/Desktop/` for example purposes), clone the repo and enter the repo:

`cd ~/Desktop`

`git clone https://github.com/mmingay2/methylMorpheus.git`

`cd methylMorpheus`

To install gdc-client for downloading datasets from the gdc portal run the following script:

`sh scripts/install_gdc_client.sh`

Now you are ready to prepare your data for download. Please see [this page](https://docs.gdc.cancer.gov/Data_Transfer_Tool/Users_Guide/Preparing_for_Data_Download_and_Upload/) for more info on preparing manifest files for downloading data. To simplify this walkthrough this repository contains a manifest for downloading all DNA methylation array datasets for the TCGA-COAD (Colorectal Cancer) project. [Check out this data in the Data Portal](https://portal.gdc.cancer.gov/repository?facetTab=files&files_size=100&filters=%7B%22op%22%3A%22and%22%2C%22content%22%3A%5B%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.primary_site%22%2C%22value%22%3A%5B%22Colon%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.project.project_id%22%2C%22value%22%3A%5B%22TCGA-COAD%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_category%22%2C%22value%22%3A%5B%22DNA%20Methylation%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_type%22%2C%22value%22%3A%5B%22Methylation%20Beta%20Value%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.platform%22%2C%22value%22%3A%5B%22Illumina%20Human%20Methylation%20450%22%5D%7D%7D%5D%7D).

If you would just like to test this out download the first 5 datasets (RECOMMENDED; about 600mb) by running:

`sh scripts/download_data.sh other/tcga-coad-450probe_manifest_first5.txt`

If you have alot of hard drive space and would like to download the entire dataset (about 50GB) run:

`sh scripts/download_data.sh other/tcga-coad-450probe_manifest.txt`

If you would like to download a custom dataset just point the download_data.sh script to the relative path of a suitable [manifest file](https://docs.gdc.cancer.gov/Data_Transfer_Tool/Users_Guide/Preparing_for_Data_Download_and_Upload/#obtaining-a-manifest-file-for-data-download).

The download_data.sh script is pre-configured to make a new directory `./data/tcga_coad_450probes/` and download the data into it.

Next it is a good idea to process the raw data a bit to extract and organize the useful information. To do this run `process_probedata.sh -i $in_directory -o $out_directory`

By default the in directory will be where the `download_data.sh` script downloaded the data into. The out directory is a new directory that the script will make to place the processed data.

`sh ./scripts/process_probedata.sh -i data/tcga_coad_450probes/ -i data/processed/`

Now take a look at one of the new processed data sets in `data/processed`

`tail data/processed/$(ls -1 data/processed/ | head -n 1)`

Now we have clean files containing: 
1. the genomic coordinates for each CpG on the array (cols 1-3) 
2. beta value (col 4) 
3. CpG Island ID (col 5)
4. Illumina Probe ID (col 6)
5. nearest gene (col 7)

`head data/processed/$(ls -1 data/processed/ | head -n 1)`

It looks like there are some lines with missing information...keep this in mind for later....

**notice that this data is all associated with hg38 not hg19**

If you need hg19 coordinates you will need to process the data a bit. 

You can download the [HumanMethylation450 v1.2 Manifest File](ftp://ussd-ftp.illumina.com/downloads/ProductFiles/HumanMethylation450/HumanMethylation450_15017482_v1-2.csv) which contains genomic locations for multiple assemblies and other metadata associated with [Illumina's Infinium HumanMethylation450K probes](https://support.illumina.com/downloads/infinium_humanmethylation450_product_files.html)

Since we want to visualize this dataset (ideally for every patient) it would be good to reduce the dimensions a bit. For DNA methylation a reasonable way to do this would be to group by CpG island and take the average of the methylation values.



FYI. You can download the [HumanMethylation450 v1.2 Manifest File](ftp://ussd-ftp.illumina.com/downloads/ProductFiles/HumanMethylation450/HumanMethylation450_15017482_v1-2.csv) which contains genomic locations and other metadata associated with [Illumina's Infinium HumanMethylation450K probes](https://support.illumina.com/downloads/infinium_humanmethylation450_product_files.html)







