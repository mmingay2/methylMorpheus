#from wget ftp://webdata2:webdata2@ussd-ftp.illumina.com/downloads/ProductFiles/HumanMethylation450/HumanMethylation450_15017482_v1-2.csv 
library(dplyr)
probefile <- "/global/projectb/scratch/mmingay/gdc_cancer/regions/HumanMethylation450_15017482_v1-2.csv"
probes <- read.csv(probefile, skip = 7)

cgi_probes <- tbl_df(probes) %>% 
  #filter(Genome_Build == "37") %>% 
  select(IlmnID, UCSC_CpG_Islands_Name) %>% 
  filter(UCSC_CpG_Islands_Name != "") %>% 
  mutate(chr=gsub(":.*", "", UCSC_CpG_Islands_Name), 
         start=gsub("-.*", "", gsub(".*:", "", UCSC_CpG_Islands_Name)), 
         end=gsub(".*-", "", gsub(".*:", "", UCSC_CpG_Islands_Name))) %>% 
  select(IlmnID, chr, start, end) %>%
  data.frame()

write.table(cgi_probes, file = "/global/projectb/scratch/mmingay/gdc_cancer/regions/pid_illmn_probes_hg19_cgi2.bed", quote = F, sep="\t", col.names = F, row.names = F)