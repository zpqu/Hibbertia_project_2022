##
## This bash script is to QC illumina reads
## Zhipeng Qu
## 23/06/2022
##

#! /bin/bash

echo -ne "The program starts at: "
date

proj_DIR="/hpcfs/users/a1183549/Hibbertia_project_2022"
data_DIR="${proj_DIR}/01_raw_data/01_illumina"
qc_DIR="${proj_DIR}/02_results/01_genome_survey/01_QC"
bin_DIR="${HOME}/apps/FastQC"

if [ -d $qc_DIR ]; then
    echo "Folder $qc_DIR exists ... "
else
    mkdir $qc_DIR
fi

cd $qc_DIR

echo -ne "***Now is performing QC using fastqc***"
date

fq_FILES=$(ls ${data_DIR}/*.fastq.gz)

for f in $fq_FILES
do
    ${bin_DIR}/fastqc -t 16 -o ${qc_DIR} $f
    echo -ne "Now is processing $f ..."
    date
done

echo -ne "The program ends at: "
date
