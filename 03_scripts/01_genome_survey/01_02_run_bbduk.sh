##
## This bash script is to trim illumina reads using bbduk 
## Zhipeng Qu
## 23/06/2022
##

#! /bin/bash

echo -ne "The program starts at: "
date

proj_DIR="/hpcfs/users/a1183549/Hibbertia_project_2022"
fastq_DIR="${proj_DIR}/01_raw_data/01_illumina"
trim_DIR="${proj_DIR}/02_results/01_genome_survey/02_bbduk"
bin_bbduk_DIR="${HOME}/apps/bbmap"
bin_fastqc_DIR="${HOME}/apps/FastQC"

if [ -d $trim_DIR ]; then
    echo "Folder $trim_DIR exists ... "
else
    mkdir $trim_DIR
fi

cd $fastq_DIR
fq_FILES=$(ls *_R1_001.fastq.gz)

cd $trim_DIR

for f in $fq_FILES
do
    filename=${f%_R1_001.fastq.gz}
    echo -ne "Now is processing $filename"
    date
        ${bin_bbduk_DIR}/bbduk.sh \
            in1=${fastq_DIR}/${filename}_R1_001.fastq.gz \
            in2=${fastq_DIR}/${filename}_R2_001.fastq.gz \
            out1=${trim_DIR}/${filename}_R1.clean.fastq.gz \
            out2=${trim_DIR}/${filename}_R2.clean.fastq.gz \
            ref=${bin_bbduk_DIR}/resources/adapters.fa \
            hdist=1 \
            mink=11 \
            ktrim=r \
            qtrim=rl \
            trimq=20 \
            minlen=30 \
            trimpolyg=20 \
            stats=${trim_DIR}/${filename}.stats.txt


        ${bin_fastqc_DIR}/fastqc -t 16 -o ${trim_DIR} ${trim_DIR}/${filename}_R1.clean.fastq.gz
        ${bin_fastqc_DIR}/fastqc -t 16 -o ${trim_DIR} ${trim_DIR}/${filename}_R2.clean.fastq.gz
done

echo -ne "The program ends at: "
date
