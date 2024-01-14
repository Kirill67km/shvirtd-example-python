#!/bin/bash

# Проверка наличия привилегий пользователя
if [[ $EUID -ne 0 ]]; then
   echo "Этот скрипт требует прав root. Запустите его с использованием sudo."
   exit 1
fi

# Ваш скрипт продолжает выполнение с правами root

# Создаем директорию для резервных копий
backup_dir="/opt/backup"
mkdir -p "$backup_dir"

# Опции подключения к MySQL
db_user="root"
db_password="admin"
db_name="example"
mysql_container="mysql-container"
db_host="172.17.0.2"

# Имя файла для резервной копии
backup_file="$backup_dir/backup_$(date +'%Y%m%d%H%M%S').sql"

# Запускаем контейнер для выполнения mysqldump
sudo docker exec "$mysql_container" mysqldump \
  --host="$db_host" \
  --user="$db_user" \
  --password="$db_password" \
  "$db_name" > "$backup_file"

echo "Резервная копия выполнена и сохранена в $backup_file"