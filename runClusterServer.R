#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# devtools::install_github("https://github.com/raymondlouie/ClusterMarkers/tree/Dev")
 

# Check to see if packages are installed

packages_required = c("CiteFuse","sc2marker","geneBasisR","xgboost","dplyr","MiniMarS")
packages_required_not_installed=setdiff(packages_required, rownames(installed.packages()))
if (length(packages_required_not_installed)>0){
    stop(paste0("Please install packages ",packages_required_not_installed,"\n"))
}

library(MiniMarS)
library(dplyr)
# library(SingleCellExperiment)
# library(RColorBrewer)


# base_dir = "C:/Users/Ray/Dropbox/UNSW work/ClusterMarker Shared/OtherDatasets/sce/"
base_dir = "/directflow/SCCGGroupShare/projects/angxue/proj/ASI_OZS_Hackathon/data/dataset3/new_31JAN2024/"
out_dir = "/directflow/SCCGGroupShare/projects/angxue/proj/ASI_OZS_Hackathon/analysis/dataset3/results/"
files = list.files(base_dir)
files = files[grep("RData",files)]
print(files)
dir.create(out_dir, showWarnings = FALSE)


# list_num_markers = c(5,15,30,50)
list_num_markers = c(10,15,20,30,40,50)


jj = as.numeric(args[1])
# for (jj in 1:length(files)){

print(jj)
load(paste0(base_dir,files[[jj]]))


# Loop through each number of markers
for (i in 1:length(list_num_markers)){
    
    numMarkers = list_num_markers[[i]]
    
    print(paste0("Iteration: ",i,
                 ", Number of markers: ",numMarkers))
     
    # Loop through each run
    for (kk in 8:length(final_out.ls)){
        
        print(paste0("Run: ",kk,
                     " out of ",length(final_out.ls)))
        
        final_out=final_out.ls[[kk]] 

        curr_name = paste0(names(final_out.ls)[[kk]],
                           "_",
                           numMarkers,
                           "_",
                           files[[jj]])        
        
        # if (!file.exists(paste0(out_dir,curr_name))){
        if (!file.exists(paste0(out_dir,"performance_",curr_name))){
            print("Calculating markers.")	
	print(1)    
	list_markers_time = tryCatch(findClusterMarkers(final_out,
                                                   num_markers=numMarkers,
                                                   method="all",
                                                   # method="citeFuse",
                                                   # method = "sc2marker",
                                                   # method = "geneBasis",
                                                   # method = c("sc2marker", "xgBoost"),
                                                   verbose=FALSE
            ), error = function(e){print("Error")}
	)
         print(2)   
            list_time = list_manput_matrix = t(as.matrix(final_out$training_matrix))
	print(3)    	    
clusters = final_out$training_clusters
	print(4)
    	    num_markers_original = list_markers_time$runtime_secs
	print(5)            
names(list_time) = names(list_markers_time)[which(!(names(list_markers_time) %in% c("consensus",
                                                                                                "runtime_secs")))]
print(6)            
list_markers = list_markers_time[which(!(names(list_markers_time) %in% c("runtime_secs")))]
       print(7)     
            save(list_markers,list_time,
                 file=paste0(out_dir,"markers_",curr_name))
            
            # } else{
            #     message(paste0(out_dir,"markers_",curr_name))
            # }
            
            # if (!file.exists(paste0(out_dir,"performance_",curr_name))){
            
            print("Calculating Performance.")
            
            list_performance = performanceAllMarkers(list_markers,
                                                     final_out=final_out,
                                                     method="all",
                                                     nrounds=1500,
                                                     nthread=6,
                                                     verbose=FALSE)
            
            # save(list_markers,list_performance,list_time,
            #      file=paste0(out_dir,curr_name))
            
            save(list_performance,
                 file=paste0(out_dir,"performance_",curr_name))
            
        } else{
            message(paste0("Exists ", paste0(out_dir,"performance_",curr_name)))
        }
        
    }
    
    
}


