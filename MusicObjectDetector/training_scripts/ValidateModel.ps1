$pathToGitRoot = "C:/Users/Alex/Repositories/MusicObjectDetector-TF"
$pathToSourceRoot = "$($pathToGitRoot)/MusicObjectDetector"
$pathToTranscript = "$($pathToSourceRoot)/Transcripts"
$pathToData = "$($pathToSourceRoot)/data"
#$pathToData = "\\MONSTI\MusicObjectDetector-TF_Results"
cd $pathToGitRoot

#echo "Appending required paths to temporary PYTHONPATH"
#$env:PYTHONPATH = "$($pathToGitRoot);$($pathToGitRoot)/research;$($pathToGitRoot)/research/slim;$($pathToSourceRoot)"

################################################################
# Available configurations - uncomment the one to actually run #
################################################################
#$configuration = "faster_rcnn_inception_resnet_v2_atrous_pretrained_dimension_clustering_rms"
#$configuration = "faster_rcnn_inception_resnet_v2_atrous_pretrained_dimension_clustering_rms_1200_proposals"
#$configuration = "faster_rcnn_inception_resnet_v2_atrous_pretrained_dimension_clustering_rms_2000_proposals"
#$configuration = "faster_rcnn_inception_resnet_v2_atrous_pretrained_deepscores_1"
#$configuration = "faster_rcnn_inception_resnet_v2_atrous_pretrained_mensural_1"
#$configuration = "faster_rcnn_inception_resnet_v2_atrous_pretrained_muscima_1"
#$configuration = "faster_rcnn_inc_resnet_v2_muscima_1"
$configuration = "ssd_resnet50_retinanet_muscima_1"

echo "Validate with $($configuration) configuration"

# Legacy slim-based evaluation
Start-Transcript -path "$($pathToTranscript)/Validate-$($configuration).txt" -append
python research/object_detection/legacy/eval.py --logtostderr --pipeline_config_path="$($pathToSourceRoot)/configurations/$($configuration).config" --checkpoint_dir="$($pathToData)/checkpoints-$($configuration)-train" --eval_dir="$($pathToData)/checkpoints-$($configuration)-validate"
Stop-Transcript

