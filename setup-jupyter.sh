# jupyter
python3 -m venv pyenv
source pyenv/bin/activate
pip3 install jupyterlab
jupyter notebook --generate-config --JupyterApp.answer_yes=True
jupyter-lab --ip 0.0.0.0 --no-browser --allow-root --NotebookApp.password="$(echo password | python -c 'from notebook.auth import passwd;print(passwd(input()))')"