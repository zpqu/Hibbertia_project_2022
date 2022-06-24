#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16 
#Job requires 32 tasks (32 cores)
#SBATCH --time=24:00:00
#SBATCH --mem=32GB
#SBATCH --ntasks-per-core=2

#SBATCH --mail-type=END
#SBATCH --mail-user=zhipeng.qu@adelaide.edu.au
#SBATCH -o 01_01_job_fastqc.slurm-%j.log

#load module
module load Java

cd ../../03_scripts/01_genome_survey/

./01_01_run_fastqc.sh >01_01_run_fastqc.20220623.log 2>&1

sacct -j $SLURM_JOBID --format="JobID,JobName,Partition,ReqNodes,ReqCPUS,ReqMem,Timelimit,ExitCode,Cluster,Account,AllocCPUS,AllocNodes,CPUTime,MaxRSS,Elapsed,MaxDiskRead,MaxDiskWrite,Submit,Start"
