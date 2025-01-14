#!/bin/bash
echo 'Запускаю скрипт'
echo 'Изменяю директорию на /opt'
cd /opt || exit 1

echo 'Копирую репозиторий со сборкой'
sudo git clone https://github.com/Kirill67km/shvirtd-example-python.git || exit 1

echo 'Переход в директорию проекта'
cd shvirtd-example-python || exit 1

echo 'Создаю и активирую виртуальное окружение'
python3 -m venv venv || exit 1
source venv/bin/activate || exit 1

echo 'Устанавливаю зависимости'
pip install -r requirements.txt || exit 1

echo 'Запускаю приложение'
nohup python main.py > /dev/null 2>&1 &

echo 'Процесс запущен в фоновом режиме'