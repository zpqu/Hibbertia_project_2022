###
## Count kmer frequencies using jellyfish with different size of kmers
## Zhipeng Qu
## 24/06/2022
###

#! /bin/bash

echo -ne "The program starts at: "
date

# Set up folders
proj_DIR="/hpcfs/users/a1183549/Hibbertia_project_2022"
trim_DIR="${proj_DIR}/02_results/01_genome_survey/02_bbduk"
kmer_DIR="${proj_DIR}/02_results/01_genome_survey/03_kmer"

# Create output folder if it doesn't exist
if [ -d $kmer_DIR ]; then
    echo "Folder $kmer_DIR exists ... "
else
    mkdir $kmer_DIR
fi

# Set kmer variable to include kmers to run
kmer=(15 18 21 24 27 30)

# Run jellyfish
# Note, -s 16G, setting this parameter as 32G requires more than 64G memory

cd $kmer_DIR
fileName="378099_LibID382905_GAP_UNSW_H2T7NDRX2_CTCGCTTCGG-TACTAGTCAA_S1"
for i in "${kmer[@]}"
do
    echo -ne "Now is processing $i ... "
    date

    /usr/bin/time --verbose jellyfish count \
        -t 16 -C -m $i -s 16G \
        -o ${i}mer.out \
        --min-qual-char=? \
        <(zcat ${trim_DIR}/${fileName}_L001_R1.clean.fastq.gz) \
        <(zcat ${trim_DIR}/${fileName}_L001_R2.clean.fastq.gz) \
        <(zcat ${trim_DIR}/${fileName}_L002_R1.clean.fastq.gz) \
        <(zcat ${trim_DIR}/${fileName}_L002_R2.clean.fastq.gz)

    /usr/bin/time --verbose jellyfish histo \
        -t 16 -h 1000000 \
        -o ${i}mer.histo ${i}mer.out

    rm ${i}mer.out #delete out file due to big size

done

echo -ne "The program ends at: "
date
