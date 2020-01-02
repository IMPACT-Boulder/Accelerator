echo off

echo Beginning Setup Procedure

python get-pip.py
python -m pip install -U mysql-connector-python --user
python -m pip install -U matplotlib --user

Echo Setup Complete 