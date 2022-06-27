#!/bin/bash
#SBATCH -p batch
#SBATCH -N 1
#SBATCH -n 16 
#Job requires 16 tasks (16 cores)
#SBATCH --time=48:00:00
#SBATCH --mem=128GB
#SBATCH --ntasks-per-core=2

#SBATCH --mail-type=END
#SBATCH --mail-user=zhipeng.qu@adelaide.edu.au
#SBATCH -o 01_03_job_jellyfish.slurm-%j.log

#load module
module load arch/haswell
module load Jellyfish/2.2.6-foss-2016b

cd ../../03_scripts/01_genome_survey/

./01_03_run_jellyfish.sh >01_03_run_jellyfish.20220624.log 2>&1

sacct -j $SLURM_JOBID --format="JobID,JobName,Partition,ReqNodes,ReqCPUS,ReqMem,Timelimit,ExitCode,Cluster,Account,AllocCPUS,AllocNodes,CPUTime,MaxRSS,Elapsed,MaxDiskRead,MaxDiskWrite,Submit,Start"
