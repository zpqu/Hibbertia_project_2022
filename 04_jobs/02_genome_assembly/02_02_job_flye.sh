#!/bin/bash
#SBATCH -p highmem 
#SBATCH -N 1
#SBATCH -n 32
#SBATCH --time=72:00:00
#SBATCH --mem=1000GB
#SBATCH --ntasks-per-core=2

#SBATCH --mail-type=END
#SBATCH --mail-user=zhipeng.qu@adelaide.edu.au
#SBATCH -o 02_02_job_flye.slurm-%j.log

#load module

cd ../../03_scripts/02_genome_assembly/

./02_02_run_flye.sh >02_02_run_flye.20220805.log 2>&1

sacct -j $SLURM_JOBID --format="JobID,JobName,Partition,ReqNodes,ReqCPUS,ReqMem,Timelimit,ExitCode,Cluster,Account,AllocCPUS,AllocNodes,CPUTime,MaxRSS,Elapsed,MaxDiskRead,MaxDiskWrite,Submit,Start"
