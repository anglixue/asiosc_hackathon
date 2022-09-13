#### Test of sc2marker 

# install.packages("devtools")
# devtools::install_github("https://github.com/CostaLab/sc2marker", build_vignettes = TRUE)

library(sc2marker)
library(Seurat)

data = readRDS("../../results/innate_adapative_rna_processed.rds")
meta = readRDS("../../results/innate_adapative_rna_processed_metadata.rds")

prot1 = readRDS("../../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_innate_protein.rds")
prot2 = readRDS("../../data/Liu_et_al_Cell_2021_COVID/10_1016_j_cell_2021_02_018_adaptive_protein.rds")

# Rename the cell type
prot1$cell_type_abbr = rename_cells(prot1$cell_type)
prot2$cell_type_abbr = rename_cells(prot2$cell_type)
prot1@assays$ADT@key = "adt1_"
prot2@assays$ADT@key = "adt2_"

data2 <- merge(prot1, y = prot2, add.cell.ids = c("Innate", "Adaptive"))

# Main function
Idents(data2) = "cell_type"

# nk.markers <- Detect_single_marker(data2, assay = "ADT", id = "natural killer cell", category = "Flow", org = "human")
# mono.markers <- Detect_single_marker(data2, assay = "ADT", id = "classical monocyte", category = "Flow", org = "human")

# Display
# get_antibody(nk.markers, org = "human")
# get_antibody(mono.markers, org = "human")

# Ridge plot
# plot_ridge(data2, id = "natural killer cell", genes = nk.markers[1:6,]$gene, 
#            ncol = 3, assay = "ADT", aggr.other = F) + coord_trans(x="sqrt")
# 
# scrna = data2
# id = "natural killer cell"
# genes = nk.markers[1:9,]$gene 
# ncol = 3
# assay = "ADT"
# aggr.other = F
# ncol = 1
# step = 0.01
# show_split = T
# slot = "data"
# 
# plot_ridge2(data2, id = "natural killer cell", genes = nk.markers[1:6,]$gene, 
#            ncol = 3, assay = "ADT", aggr.other = F)

# For all
all.markers <- Detect_single_marker_all(data2, assay = "ADT", category = "Flow", org = "human")

# This will generate a Rmd file for user to knit a html page for visualizing the results
generate_report(data2, all.markers, fpath = ".", fname = "COVID_innate_adaptive_ADT")

# Cannot upload the intermediate results to Github because it's too big
# The rds files will be moved to the upper level folder ../../results/

####