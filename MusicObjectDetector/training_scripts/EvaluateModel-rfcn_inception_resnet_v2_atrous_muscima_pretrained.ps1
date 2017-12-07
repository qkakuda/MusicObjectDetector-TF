$pathToGitRoot = "C:/Users/alpa/Repositories/MusicObjectDetector-TF"
$pathToSourceRoot = "$($pathToGitRoot)/MusicObjectDetector"
$pathToTranscript = "$($pathToSourceRoot)/Transcripts"
$configuration = "rfcn_inception_resnet_v2_atrous_muscima_pretrained"

cd $pathToGitRoot/research

Start-Transcript -path "$($pathToTranscript)/EvaluateModel-$($configuration).txt" -append
echo "Validate with $($configuration) configuration"
python object_detection/eval.py --logtostderr --pipeline_config_path="$($pathToSourceRoot)/configurations/$($configuration).config" --checkpoint_dir="$($pathToSourceRoot)/data/training-checkpoints-$($configuration)" --eval_dir="$($pathToSourceRoot)/data/validation-checkpoints-$($configuration)"
Stop-Transcript
