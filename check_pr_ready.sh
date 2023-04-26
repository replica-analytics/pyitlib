set -e
pip install pip --upgrade
pip uninstall -r requirements-test.txt -y
pip install -r requirements-test.txt
safety check -r requirements-test.txt --bare
coverage run --source ./ -m pytest --durations=0
python setup.py bdist_egg --exclude-source-files
wheel convert dist/pyitlib-*.egg -d dist
python setup.py install
rm -r dist
