echo "BUILD START"
python 3.11 -m pip install -r requirement.txt
python 3.11 manage.py collectstatic --noinput --clear
echo "BUILD END"