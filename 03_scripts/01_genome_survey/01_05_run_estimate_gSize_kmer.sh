###
## Use estimate_gSize_kmer.R to do genome survey for Hibbertia project based on kmer 
## distribution from Jellyfish. k = {15, 18, 21, 24, 27, 30}, k = 12 failed because 
## of out of memory 
## Zhipeng Qu
## 27/06/2022
###

#! /bin/bash

echo -ne "The program starts at: "
date

# Set up folders
proj_DIR="${HOME}/Genomics/Lab_projects/Hibbertia_project_2022"
kmer_DIR="${proj_DIR}/02_results/01_genome_survey/03_kmer"
gSize_DIR="${proj_DIR}/02_results/01_genome_survey/05_gSize"
externalScripts_DIR="${proj_DIR}/03_scripts/externalScripts"

# Create output folder if it doesn't exist
if [ -d $gSize_DIR ]; then
    echo "Folder $gSize_DIR exists ... "
else
    mkdir $gSize_DIR
fi

# get .histo files
cd $kmer_DIR
FILES=$(ls *.histo)

for i in $FILES
do

    k=${i%mer.histo}
    echo -ne "Now is processing ${k}mer ... "
    date
    /usr/bin/time --verbose Rscript ${externalScripts_DIR}/estimate_gSize_kmer.R

done

# Run gSize 
cd $gSize_DIR
mv ${kmer_DIR}/*.pdf ${kmer_DIR}/*.txt ./

echo -ne "The program ends at: "
date
