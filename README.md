# Cloudcasting Model Template

This is a template for creating a model repository for the work on cloud forecasting with [Open Climate Fix](https://openclimatefix.org/).
It uses [`cloudcasting`](https://github.com/alan-turing-institute/cloudcasting) to validate models against EUMETSAT data.

## Usage

1. Install [copier](https://copier.readthedocs.io/en/stable/) with pipx:
   ```bash
   python -m pipx install copier

2. Create a git repository for your model repository in the directory you want to store it in:
   ```bash
   mkdir my-model-repo && cd my-model-repo
   git init
   ```
3. Run the following command to create a new model repository:
   ```bash
   copier copy gh:alan-turing-institute/ocf-model-template .
   ```

4. Answer the questions asked by copier:
   - What is the name of your model repository?
   - What should the name of your model class be?
   These will be used to create the directory structure for your model repository.


5. You may want to upload to GitHub at this stage, provided you've created a blank repo at
   {{ repo_name }}:
  ```bash
  git branch -M main
  git remote add origin https://github.com/alan-turing-institute/{{ repo_name }}.git
  git add --all
  git commit -m "Initial commit"
  git push -u origin main
  ```

6. Edit the files in your model repository:
    - Edit `model.py` to define your model class.
      - If your model code is complicated, you can store the code in `src/` and import it within `model.py`.
    - You'll need to add any project dependencies to `pyproject.toml`, e.g.
      ```toml
      [project]
      dependencies = [
          "cloudcasting @ git+https://github.com/alan-turing-institute/cloudcasting.git@v0.4.0", # this should be the latest version of cloudcasting, already added to pyproject.toml
          "numpy",  # add any other dependencies here
          "pandas",
          "xarray",
      ]
      ```
  - Edit `validate-config.yml` to configure the validation process. You'll need to specify the path to your validation data, and the name of your wandb project and run, as well as any other parameters you need to initialize your model.
  - It would be good to edit `README.md` to describe your model.