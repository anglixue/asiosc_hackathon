####
# Recode cell type names
# library(readxl)
# setwd("~/Documents/Study/Post-doc/project/ASI_OZS_Hackathon/asiosc_hackathon")
# my_data <- read_excel("../hackathon_dataset.xlsx", sheet = 3)
# rc = paste0("\`", my_data$`OBO Ontology ID`, "\`"," = ", "'", my_data$Label, "'", ",")
# write.table(rc,"./src/Azimuth_celltype.l2.txt", row.names = F, quote = F, col.names = F)

rename_cells2 <- function(cell_type){
  recode(cell_type,

	`mature B cell` = 'B intermediate',
	`memory B cell` = 'B memory',
	`naive B cell` = 'B naive',
	`plasmablast` = 'Plasmablast',
	`CD4-positive, alpha-beta cytotoxic T cell` = 'CD4 CTL',
	`naive thymus-derived CD4-positive, alpha-beta T cell` = 'CD4 Naive',
	`activated CD4-positive, alpha-beta T cell` = 'CD4 Proliferating',
	`CD4-positive, alpha-beta memory T cell` = 'CD4 TCM',
	`effector CD4-positive, alpha-beta T cell` = 'CD4 TEM',
	`regulatory T cell` = 'Treg',
	`naive thymus-derived CD8-positive, alpha-beta T cell` = 'CD8 Naive',
	`activated CD8-positive, alpha-beta T cell` = 'CD8 Proliferating',
	`CD8-positive, alpha-beta memory T cell` = 'CD8 TCM',
	`effector CD8-positive, alpha-beta T cell` = 'CD8 TEM',
	`dendritic cell` = 'ASDC',
	`CD141-positive myeloid dendritic cell` = 'cDC1',
	`CD1c-positive myeloid dendritic cell` = 'cDC2',
	`plasmacytoid dendritic cell` = 'pDC',
	`CD14-positive, CD16-negative classical monocyte` = 'CD14 Mono',
	`CD14-low, CD16-positive monocyte` = 'CD16 Mono',
	`CD16-positive, CD56-dim natural killer cell, human` = 'NK',
	`natural killer cell` = 'NK Proliferating',
	`CD16-negative, CD56-bright natural killer cell, human` = 'NK_CD56bright',
	`erythroid lineage cell` = 'Eryth',
	`hematopoietic precursor cell` = 'HSPC',
	`innate lymphoid cell` = 'ILC',
	`platelet` = 'Platelet',
	`CD4-negative, CD8-negative, alpha-beta intraepithelial T cell` = 'dnT',
	`gamma-delta T cell` = 'gdT',
	`mucosal invariant T cell` = 'MAIT'
  
  )

}


####
