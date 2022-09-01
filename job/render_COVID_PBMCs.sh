## SGE SETTINGS
#$ -cwd
#$ -S /bin/bash
#$ -q short.q
#$ -pe smp 1
#$ -r yes
#$ -l mem_requested=200G
#$ -N render_COVID_PBMCs
#$ -o stdout_render_COVID_PBMCs
#$ -e stderr_render_COVID_PBMCs

cd $SGE_O_WORKDIR

Rscript=/share/ScratchGeneral/angxue/software/miniconda3/envs/py37/bin/Rscript

$Rscript -e 'library(rmarkdown); rmarkdown::render("../main/Azimuth_annotation_COVID_PBMCs.Rmd", "html_document")'


