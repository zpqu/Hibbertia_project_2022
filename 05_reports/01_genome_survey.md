# Part 1, genome survey analysis for Hibbertia_project
**date: 23/06/2022**

## 1 Summary

## 2 File structure

In Phoenix [23/06/2022]
- raw_data: Hibbertia_project_2022/01_raw_data/01_illumina 
- results: Hibbertia_project_2022/02_results/01_genome_survey
- scripts: Hibbertia_project_2022/03_scripts/01_genome_survey
- jobs: /hpcfs/users/a1183549/Hibbertia_project_2022/04_jobs/01_genome_survey

## 3 Methods and results

### 3.1 QC for raw reads

[23/06/2022]

**Packages:**
- FastQC (v0.11.9)

**Scripts:**
1. 01_01_run_fastqc.sh
**Jobs:**
1. 01_01_job_fastqc.sh

**Runtime:**
1. 06:02:36 (16 cpus)

### 3.2 Trim adaptor and low-quality sequences

[23/06/2022]

**Packages:** 
- bbduk in BBMap (v38.96)
- FastQC (v0.11.9)

**Scripts:** 
1. 01_02_run_bbduk.sh

**Jobs:**
1. 01_02_job_bbduk.sh

**Runtime:**
1. 05:32:42 (16 cpus)

### 3.3 Count kmer frequencies using Jellyfish

[24/06/2022]

**packages:**
- Jellyfish (v2.2.7)

**Scripts:**
1. 01_03_run_jellyfish.sh

**Jobs:**
1. 01_03_job_jellyfish.sh

**Runtime:**
1. 06:59:44 (16 cpus)

**Note:**
Job for kmer=12 failed due to out of memory issue (memory = 128Gb). Therefore kmer=12 was ignored in following anaysis.

### 3.4 Genome survey using genomescope

[27/06/2022]

**packages:**
- genomescope.R (v1)

**Scripts:**
1. 01_04_run_genomescope.sh

**Jobs:**
1. This step was carried out in freebie, because genomescope requires X11.

**Runtime:**
1. 5 mins (1 cpus)

## 4 Additional information

