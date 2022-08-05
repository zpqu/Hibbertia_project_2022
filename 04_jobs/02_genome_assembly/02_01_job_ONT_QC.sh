#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 1 
#SBATCH --time=2:00:00
#SBATCH --mem=16GB
#SBATCH --ntasks-per-core=2

#SBATCH --mail-type=END
#SBATCH --mail-user=zhipeng.qu@adelaide.edu.au
#SBATCH -o 02_01_job_ONT_QC.slurm-%j.log

#load module
module load Java

cd ../../03_scripts/02_genome_assembly/

./02_01_ONT_QC.sh >02_01_ONT_QC.20220804.log 2>&1

sacct -j $SLURM_JOBID --format="JobID,JobName,Partition,ReqNodes,ReqCPUS,ReqMem,Timelimit,ExitCode,Cluster,Account,AllocCPUS,AllocNodes,CPUTime,MaxRSS,Elapsed,MaxDiskRead,MaxDiskWrite,Submit,Start"
