# Main analysis for cell type classification

This folder contains the analysis code pipeline in the R markdown file for the two datasets

We will try to use three methods to predict the cell type:
* Transcriptomics only
* Proteomics only
* Transcriptomics + Proteomics

For those who are not familiar with the datasets, you can first check the `data_exploration.R`

## 1.  Liu_et_al_Cell_2021_COVID ([Paper](https://doi.org/10.1016/j.cell.2021.02.018)) 

You can preview the results in the following [link](https://htmlpreview.github.io/?https://github.com/anglixue/asiosc_hackathon/blob/main/main/Azimuth_annotation_COVID_PBMCs.html)

The whole analysis took ~ 2h 12 mins in the HPC.

style="color: red;">Update on 13-SEP-2022</span>

We tried to use sc2marker to find the minimal protein markers to differentiate certain cell type from the rest of the clusters. The results can be found in the following [link](https://htmlpreview.github.io/?https://github.com/anglixue/asiosc_hackathon/blob/main/main/COVID_innate_adaptive_ADT.sc2marker.report.html)

The whole analysis for 24 cell types took ~ 1h in the MacBook pro.

## 2.  Triana_et_al_Nat_Immunol_2021_Leukemia ([Paper](https://doi.org/10.1038/s41590-021-01059-0))

You can preview the results in the following (page under construction)





