#!/bin/sh
#SBATCH --job-name=job_squash_gpt_corefs
#SBATCH -o /mnt/nfs/work1/miyyer/kalpesh/projects/squash-generation/logs/log_squash_gpt_corefs.txt
#SBATCH --time=167:00:00
#SBATCH --partition=1080ti-long
#SBATCH --gres=gpu:4
#SBATCH --cpus-per-task=8
#SBATCH --mem=100GB
#SBATCH -d singleton

cd /mnt/nfs/work1/miyyer/kalpesh/projects/squash-generation

python -m torch.distributed.launch --nproc_per_node=4 src/train.py --n_epochs 5 --dataset_path data/temp_dataset/instances_corefs --dataset_cache data/temp_dataset/cache_corefs

