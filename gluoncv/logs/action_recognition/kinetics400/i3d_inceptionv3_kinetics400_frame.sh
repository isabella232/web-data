#!/usr/bin/env bash

CUDA_VISIBLE_DEVICES=7,6,5,4,3,2,1,0 python ./scripts/action-recognition/train_recognizer.py \
	--dataset kinetics400 \
	--data-dir /home/ubuntu/data/kinetics400/rawframes_train \
    --val-data-dir /home/ubuntu/data/kinetics400/rawframes_val \
    --train-list /home/ubuntu/data/kinetics400/kinetics400_train_list_rawframes_full.txt \
    --val-list /home/ubuntu/data/kinetics400/kinetics400_val_list_rawframes_clean.txt \
	--mode hybrid \
	--dtype float32 \
    --prefetch-ratio 1.0 \
	--model i3d_inceptionv3_kinetics400 \
	--num-classes 400 \
	--batch-size 8 \
	--num-gpus 8 \
	--num-data-workers 32 \
	--input-size 299 \
	--new-height 340 \
	--new-width 450 \
	--new-length 32 \
	--new-step 2 \
	--lr-mode step \
	--lr 0.01 \
	--momentum 0.9 \
	--wd 0.0001 \
	--lr-decay 0.1 \
	--lr-decay-epoch 40,80,100 \
	--num-epochs 100 \
	--scale-ratios 1.0,0.8 \
	--save-frequency 5 \
	--clip-grad 40 \
	--log-interval 20 \
	--logging-file i3d_inceptionv3_kinetics400.txt \
	--save-dir ./logs/i3d_inceptionv3_kinetics400 \

