# methylMorpheus
This repo provides guidelines on how to acquire, process, visualize and analyze massive [TCGA](https://portal.gdc.cancer.gov/) datasets and associated clinical metadata using heatmaps ([Morpheus.js](https://github.com/cmap/morpheus.js)) in the browser.

The first step is to clone this directory. 

Move to a suitable directory (using `~/Desktop/` for example purposes):

`cd ~/Desktop`

Then clone the repo:

`git clone https://github.com/mmingay2/methylMorpheus.git`

Then enter the repo:

`cd methylMorpheus`

To install gdc-client for downloading datasets from the gdc portal run the following script:

`sh scripts/install_gdc_client.sh`

Now you are ready to prepare your data for download. Please see [this page](https://docs.gdc.cancer.gov/Data_Transfer_Tool/Users_Guide/Preparing_for_Data_Download_and_Upload/) for more info on preparing manifest files for downloading data. To simplify this walkthrough this repository contains a manifest for downloading all DNA methylation array datasets for the TCGA-COAD (Colorectal Cancer) project. [Check out this data in the Data Portal](https://portal.gdc.cancer.gov/repository?facetTab=files&files_size=100&filters=%7B%22op%22%3A%22and%22%2C%22content%22%3A%5B%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.primary_site%22%2C%22value%22%3A%5B%22Colon%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22cases.project.project_id%22%2C%22value%22%3A%5B%22TCGA-COAD%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_category%22%2C%22value%22%3A%5B%22DNA%20Methylation%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.data_type%22%2C%22value%22%3A%5B%22Methylation%20Beta%20Value%22%5D%7D%7D%2C%7B%22op%22%3A%22in%22%2C%22content%22%3A%7B%22field%22%3A%22files.platform%22%2C%22value%22%3A%5B%22Illumina%20Human%20Methylation%20450%22%5D%7D%7D%5D%7D){:target="_blank"}.

If you would just like to test this out download the first 5 datasets (about 600mb) by running:

`sh scripts/download_data.sh other/tcga-coad-450probe_manifest_first5.txt`

If you have alot of hard drive space and would like to download the entire dataset (about 50gb) run:

`sh scripts/download_data.sh other/tcga-coad-450probe_manifest.txt`

If you would like to download a custom dataset just point the download_data.sh script to the relative path of a suitable [manifest file](https://docs.gdc.cancer.gov/Data_Transfer_Tool/Users_Guide/Preparing_for_Data_Download_and_Upload/#obtaining-a-manifest-file-for-data-download).







