# ASI/OSC hackathon

Here is the code repository of the analysis for the joint Australia Society of Immunology / Oz Single Cell Hackathon 

There are three immunologists top challenges included in this Hackathon:

1. **Minimal cluster identification/marker extraction**: Identifying the ideal/minimal (i.e. 12-15) protein marker combinations to identify the maximal number of cell clusters based on RNA ± CITE-seq reference data set.
    + 1a Novel pipeline that allows extraction
    + 1b Utility: Lead to better panel choice for subsequent experiments
    + 1c Reference of rank order gene-protein correlation values (e.g. CD8 terrible with RNA, great with protein)
    + 1d Create minimal marker reference from dataset that can evolve for people to split into all immune subsets. Ala Simon Haas but better? Different?
    + 1e Novel biomarker identification from clinical cohorts
2. **Cell-cell, protein-protein interaction** (visualisation? More refined? Interpretation?)
    + 2a Don’t reinvent the great databases out there? Rather leverage these so immunologists can better use them
    + 3b Interfacing with the proteogenomics data
3. **Can we use RNA+protein references to inform genes likely to be expressed in FACS subsets? Vice versa?**
    + 3a Hopefully have a normalised reference FACS whole blood data set. Perhaps healthy vs COVID


I'll post the analysis pipeline specifically for the challenge #1 and #2 in `/main` folder

The  `/data` folder contains the data download instructions

The  `/src` folder contains the necessary R functions and other relevant files 

The  `/job` folder contains the qsub script for HPC jobs including the stderr and stdout files




