
# store current directory
validdir=/bask/projects/v/vjgo8416-climate/shared/cloudcasting-validation

# check if repo exists
if [ ! -d $validdir/{{ repo_name }} ]; then
    echo "Repo does not exist; cloning..."
    git clone https://github.com/alan-turing-institute/{{ repo_name }}.git $validdir/{{ repo_name }}
fi

# run a job to validate each model in models/*.py
for model_file in $validdir/{{ repo_name }}/models/*.py; do
    echo "Submitting validation job for $model_file"
    sbatch validate-baskerville.sh $model_file --job-name="$model_file"+"validation"
done

echo "All jobs submitted!"



