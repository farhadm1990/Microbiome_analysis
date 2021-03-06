#!/bin/bash
#SBATCH -p ghpc_v3
#SBATCH -N 1
#SBATCH --mem=32G 
#SBATCH -t 24:00:00

TMPDIR=/scratch/$USER/$SLURM_JOBID
export TMPDIR
mkdir -p $TMPDIR

source activate qiime2.8
qiime tools import \
  --type "SampleData[PairedEndSequencesWithQuality]" \
  --input-format PairedEndFastqManifestPhred33V2 \
  --input-path ~/data/dss/amplicons/manifestArranged.tsv \
  --output-path ~/data/dss/demuxed-dss.qza

cd $SLURM_SUBMIT_DIR
rm -rf /scratch/$USER/$SLURM_JOBID
