#!/bin/bash

#SBATCH --partition=mig_class
#SBATCH --gres=gpu:1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --time=2:00:0
#SBATCH --job-name="hw7 test"
#SBATCH --output=slurm-%j.out
#SBATCH --mem=16G

#SBATCH --mail-user=asandhu9@jhu.edu
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END

source ~/.bashrc

module load anaconda
conda activate ssm_hw7 # activate the Python environment
python -m spacy download en_core_web_sm

accelerate launch ./run_rlhf.py --config ./rlhf_config.yml
