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
## Technology: 10x 5' v1,CITE-seq
data1 = readRDS("../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_adaptive_protein.rds")
data2 = readRDS("../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_innate_protein.rds")

# Check meta data
data1
# An object of class Seurat 
# 192 features across 246964 samples within 1 assay 
# Active assay: ADT (192 features, 0 variable features)
# 1 dimensional reduction calculated: umap

dim(data1@meta.data)
# There are 123 columns of meta data information
# Some typical meta data include nCount_RNA, nFeature_RNA, sex, age, batch, Pool, cell_type, sample_id, percent.mito

data2
# An object of class Seurat 
# 192 features across 125117 samples within 1 assay 
# Active assay: ADT (192 features, 0 variable features)
# 1 dimensional reduction calculated: umap

#### Triana_et_al_Nat_Immunol_2021_Leukemia ####
## Technology: targeted BD Rhapsody, Abseq
ctrl1 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_200ABs_protein.rds")
ctrl2 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_healthy_protein.rds")
ctrl3 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_wholetranscriptome_protein.rds")
case1 = readRDS("../data/Triana_et_al_Nat_Immunol_2021_Leukemia/10_1038_s41590_021_01059_0_leukemia_protein.rds")

# Three control datasets
ctrl1
# An object of class Seurat 
# 197 features across 15502 samples within 1 assay 
# Active assay: ADT (197 features, 0 variable features)
# 2 dimensional reductions calculated: projected, projectedmean

ctrl2
# An object of class Seurat 
# 97 features across 49057 samples within 1 assay 
# Active assay: ADT (97 features, 0 variable features)
# 10 dimensional reductions calculated: mofa, mofatsne, mofaumap, pca, projected, projectedmean, tsne, tsneni, umap, umapni

ctrl3
# An object of class Seurat 
# 97 features across 13165 samples within 1 assay 
# Active assay: ADT (97 features, 0 variable features)
# 8 dimensional reductions calculated: bothtsne, bothumap, mofa, mofatsne, mofaumap, pca, projected, projectedmean

# This is the data collected from patients of acute myeloid leukemia and acute promyelocytic leukemia
case1
# An object of class Seurat 
# 97 features across 31586 samples within 1 assay 
# Active assay: ADT (97 features, 0 variable features)
# 6 dimensional reductions calculated: bothumap, pca, projected, projectedmean, tsneni, umapni


####