#!/bin/bash

echo -e '\033[33m - Дай ссылку на файл' && read URL

#echo -e "\033[35m   URL твоего файла это - "$URL
#ID=`echo $URL | cut -c '33-65'`

ID=`echo $URL | grep -Eo '[A-Za-z0-9-]{33}'` && echo -e "\033[35m   ID твоего файла - "$ID
echo -e '\033[33m - Как назовём этот файл?' && read name

echo -e '\033[33m - Начинаем загрузку файла в директорию "Загрузки"'
wget -O $name --no-check-certificate -q https://drive.google.com/uc?id=$ID&export=download && sleep .5

if
mv $PWD/$name /home/$USER/Загрузки/ 2> /dev/null

then
echo -e "\033[32m - Готово"

else sleep .5 && echo -e "\033[31m - Ещё не загрузился, подождём"
sleep 10 && mv $PWD/$name /home/$USER/Загрузки/ 2>/dev/null && echo -e "\033[32m - Готово" || echo -e "\033[31m - Ты под рутом? Не надо так." && rm $PWD/$name
fi
