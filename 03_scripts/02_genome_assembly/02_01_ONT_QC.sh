##
## This bash script is to QC ONT reads
## Zhipeng Qu
## 04/08/2022
##

#! /bin/bash

echo -ne "The program starts at: "
date

proj_DIR="/hpcfs/users/a1183549/Hibbertia_project_2022"
ont_data_DIR="${proj_DIR}/01_raw_data/02_ONT"
ont_qc_DIR="${proj_DIR}/02_results/02_genome_assembly/01_QC"
bin_DIR="${HOME}/apps/assembly-stats/build"

if [ -d $ont_qc_DIR ]; then
    echo "Folder $ont_qc_DIR exists ... "
else
    mkdir -p $ont_qc_DIR
fi


echo -ne "***Now is performing QC using fastqc***"
date

cd $ont_data_DIR
fq_FILES=$(ls *.fastq.gz)

cd $ont_qc_DIR

for f in $fq_FILES
do
    filename=${f%.fastq.gz$}
    echo -ne "Now is processing $f ..."
    ${bin_DIR}/assembly-stats -s <(zcat ${ont_data_DIR}/$f) > \
        ${filename}.assembly_stats.txt
    date
done

echo -ne "The program ends at: "
date
