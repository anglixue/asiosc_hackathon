##############################################################################
# Script information
# Title: Explore the data from ASI/OSC Hackathon
# Author: Angli Xue
# Date: 2022-08-22
# Description: This R script was to explore the data provided by ASI/OSC Hackathon.
##############################################################################
library(Seurat)
library(SeuratObject)
library(ggplot2)

#### Liu_et_al_Cell_2021_COVID ####
## Technology: 10x 5' v1,CITE-seq
# For scRNA-seq data just change the "protein" to "rna" in the file name
data1 = readRDS("../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_innate_rna.rds")
data2 = readRDS("../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_adaptive_rna.rds")

# Check meta data
data1
# An object of class Seurat 
# 192 features across 125117 samples within 1 assay 
# Active assay: ADT (192 features, 0 variable features)
# 1 dimensional reduction calculated: umap

data2
# An object of class Seurat 
# 192 features across 246964 samples within 1 assay 
# Active assay: ADT (192 features, 0 variable features)
# 1 dimensional reduction calculated: umap

dim(data1@meta.data)
# There are 123 columns of meta data information
# Some typical meta data include nCount_RNA, nFeature_RNA, sex, age, batch, Pool, cell_type, sample_id, percent.mito

# perform visualization and clustering steps
data1@assays$RNA@counts = data1@assays$RNA@data
data1@assays$RNA@key = "rna_"

data1 <- NormalizeData(data1)
data1 <- FindVariableFeatures(data1)
data1 <- ScaleData(data1)
data1 <- RunPCA(data1, verbose = TRUE)
data1 <- FindNeighbors(data1, dims = 1:15)
data1 <- FindClusters(data1, resolution = 1, verbose = TRUE)
data1 <- RunUMAP(data1, dims = 1:30)

## Visualize the two subsets
p1 <- DimPlot(data1, group.by = "cell_type", label = TRUE, label.size = 3) + NoLegend() + ggtitle("Innate cell only: 125,117 cells")
p2 <- DimPlot(data2, group.by = "cell_type", label = TRUE, label.size = 3) + NoLegend() + ggtitle("Adaptive cell only: 246,964 cells")
p1 + p2

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