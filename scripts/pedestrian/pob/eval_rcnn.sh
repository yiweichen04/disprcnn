python -m torch.distributed.launch \
--nproc_per_node $NGPUS tools/test_net.py \
--config-file configs/kitti/pedestrian/pob/rcnn.yaml