##############################################################################
# Script information
# Title: Explore the data from ASI/OSC Hackathon
# Author: Angli Xue
# Date: 2022-08-22
# Description: This R script was to explore the data provided by ASI/OSC Hackathon.
##############################################################################
library(Seurat)
library(SeuratObject)


#### Liu_et_al_Cell_2021_COVID ####
data1 = readRDS("../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_adaptive_protein.rds")
data2 = readRDS("../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_innate_protein.rds")

# Check meta data
data1
dim(data1@meta.data)
data2
dim(data2@meta.data)

#### Triana_et_al_Nat_Immunol_2021_Leukemia ####
ctrl1 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_200ABs_protein.rds")
ctrl2 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_healthy_protein.rds")
ctrl3 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_wholetranscriptome_protein.rds")
case1 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_leukemia_protein.rds")


####