echo 'generating rois...'
python tools/kitti_object/generate_psmnet_input_inf.py \
--output_dir data/pedestrian_pob_roi \
--shape_prior_base pob \
--prediction_template models/kitti/pedestrian/mask/inference/kitti_%s_pob_pedestrian/predictions.pth \
--cls pedestrian

echo 'train iDispNet...'
python -m torch.distributed.launch --nproc_per_node $NGPUS \
tools/kitti_object/train_idispnet_fa.py \
--data_dir data/pedestrian_pob_roi \
--model_dir models/kitti/pedestrian/pob/idispnet