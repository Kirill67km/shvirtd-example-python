#!/bin/bash
echo 'Запускаю скрипт'
echo 'Изменяю директорию на /opt'
cd /opt
echo 'Копирую репозиторий со сборкой'
git clone https://github.com/Kirill67km/shvirtd-example-python.git
echo 'Начинаю выполнять команды для запуска'
python3 -m venv venv  # on Windows, use "python -m venv venv" instead
. venv/bin/activate   # on Windows, use "venv\Scripts\activate" instead
pip install -r requirements.txt
python main.py