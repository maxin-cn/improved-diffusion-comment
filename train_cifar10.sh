export CUDA_VISIBLE_DEVICES=1
MODEL_FLAGS="--image_size 32 --num_channels 128 --num_res_blocks 3 --learn_sigma True --dropout 0.3"
DIFFUSION_FLAGS="--diffusion_steps 4000 --noise_schedule cosine"
TRAIN_FLAGS="--lr 1e-4 --batch_size 128"

python scripts/image_train.py --data_dir /mnt/sda/maxin/dataset/diffusion_dataset/cifar10/ $MODEL_FLAGS $DIFFUSION_FLAGS $TRAIN_FLAGS

# 采样阶段
python scripts/image_sample.py --model_path ../ SMODEL_FLAGS SDIFFUSION_FLAGS --use_ddim Ture --timestep_respacing ddim50 --sample_name''