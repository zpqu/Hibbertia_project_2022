###
## Use genomescope to do genome survey for Hibbertia project based on kmer distribution
## from Jellyfish. k = {15, 18, 21, 24, 27, 30}, k = 12 failed because of out of memory
## Zhipeng Qu
## 27/06/2022
## NOTE: genomescope.R can only be run in systeme with X11, the run in HPC was failed
###

#! /bin/bash

echo -ne "The program starts at: "
date

# Set up folders
proj_DIR="${HOME}/Genomics/Lab_projects/Hibbertia_project_2022"
kmer_DIR="${proj_DIR}/02_results/01_genome_survey/03_kmer"
genomescope_DIR="${proj_DIR}/02_results/01_genome_survey/04_genomescope"
externalScripts_DIR="${proj_DIR}/03_scripts/externalScripts"

# Create output folder if it doesn't exist
if [ -d $genomescope_DIR ]; then
    echo "Folder $genomescope_DIR exists ... "
else
    mkdir $genomescope_DIR
fi

# get .histo files
cd $kmer_DIR
FILES=$(ls *.histo)

# Run genomescope 
cd $genomescope_DIR
for i in $FILES
do
    k=${i%mer.histo}
    echo -ne "Now is processing ${k}mer ... "
    date
    
    /usr/bin/time --verbose Rscript ${externalScripts_DIR}/genomescope.R \
        ${kmer_DIR}/$i $k 250 ${k}mer
done

echo -ne "The program ends at: "
date
