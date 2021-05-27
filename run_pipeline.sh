#!/bin/bash
#SBATCH --job-name=BC1bulk-rnaseq
#SBATCH --output=/scratch/users/adamsk/logs/bulk-rnaseq.out
#SBATCH --nodes=1
#SBATCH --time=00-05:00:00
#SBATCH --cpus-per-task=4
#SBATCH --mem=100G
#SBATCH --mail-type=END
#SBATCH --mail-user=adamsk@stanford.edu
#SBATCH -p dschneid

set -e
cd $1
echo "Starting up snakemake..."
snakemake --cluster-config cluster.json -j 499 \
    --use-conda --use-singularity \
    --cluster 'sbatch -p {cluster.partition} -t {cluster.time} --mem {cluster.mem} -c {cluster.ncpus} -o {cluster.out}'
