#!/bin/bash

#SBATCH --job-name=STM_Num_Job0328
#SBATCH --array=0-5
#SBATCH --time=23:00:00
#SBATCH --mem=48G
#SBATCH --nodes=2
#SBATCH --output=r_output_%a_%A.out
#SBATCH --error=r_error_%a_%A.err
#SBATCH --partition=hpxg

# 设定你的customstopwords和thresh的组合
declare -a stopwords_list=("c(english)")
declare -a thresh_list=(50 60 70 80 90 100) # 你可以按照需求填写

# 指定R的路径
R_PATH="/project2/tanbiao/R-4.3.1/bin"

# 从数组中选择参数
stopwords=${stopwords_list[$SLURM_ARRAY_TASK_ID % ${#stopwords_list[@]}]}
thresh=${thresh_list[$SLURM_ARRAY_TASK_ID / ${#stopwords_list[@]}]}

# 使用指定的R路径来运行Rscript
$R_PATH/Rscript Simi_STM_Numhelpful.R $stopwords $thresh
