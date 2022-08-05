##
## This bash script is to de novo assembly genome using Flye (v2.9) 
## Zhipeng Qu
## 04/08/2022
##

#! /bin/bash

echo -ne "The program starts at: "
date

proj_DIR="/hpcfs/users/a1183549/Hibbertia_project_2022"
ont_data_DIR="${proj_DIR}/01_raw_data/02_ONT"
asm_DIR="${proj_DIR}/02_results/02_genome_assembly/02_Flye_default"
bin_DIR="${HOME}/apps/Flye_2.9"

if [ -d $asm_DIR ]; then
    echo "Folder $asm_DIR exists ... "
else
    mkdir -p $asm_DIR
fi

cd $asm_DIR

echo -ne "***Starting de novo assembly genome using Flye (v.2.9): "
date

/usr/bin/time --verbose python ${bin_DIR}/bin/flye \
    --nano-hq ${ont_data_DIR}/nanopore_pass.fastq.gz \
    -g 2.2g \
    -o ${asm_DIR} \
    -t 64

echo -ne "***Finishing de novo assembly genome using Flye (v.2.9): "
date

echo -ne "The program ends at: "
date
