# Простой GUI для учебного стенда

## Установка готового образа raspberry os
Для установки потребуется загрузить образ raspberry os с гугл диска на флешку.  
После записи необходимо отредактировать файл config.txt это можно сделать с помощью обычного блокнота. Из файла нужно убрать строки настройки изображения для 7-ми дюймового экрана.
Простом удаляем `hdmi_mode=87`  

Теперь вставляем флешку в raspberry и запитываем её от 5 вольтового блока питания.  
Когда ОС загрузится завершаем работу текущей программы через alt+f4.  
Щелкаем правой кнопкой по рабочему столу, в контекстном меню выбираем file manager.  
В файловом менеджере находим файл ~/.config/openbox/autostart и отрывем редактором текста.  
Заменяем в файле название программы в автозапуске на bat-ui должно получиться   
`~/inenergy-gui/dist/bat-ui*.AppImage > ~/.inenergy/bat-ui.log`  
Перезапускаем систему через то же контекстное меню.

***
## Установка с чистой raspberry os
Для установки потребуется загрузить образ raspberry os lite на флешку. Это можно сделать с помощью [rapberry pi imager](https://www.raspberrypi.com/software/). Перед записью образа стоит настроить подключение к сети и пароль пользователя в настройках pi imager (шестеренка в правом нижнем углу).

После записи из файла cmdline.txt убираем фразу `console=serial0,115200`

Теперь вставляем флешку в raspberry и запитываем её от 5 вольтового блока питания.
Когда система загрузится необходимо установить дополнительный софт.
Для этого вводим комманды  
```sh
sudo apt-get update
sudo apt-get install -y git xorg openbox pcmanfm geany lxterminal chromium-browser libudev-dev
```
Так же нужно установить nvm  
```sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
```
После установки нужно выйти из системы `exit` и войти обратно.  
Теперь надо установить node коммандой `nvm install 12`  
Можно проверить установку коммандой `node --version`

Затем нужно клонировать репозиторий `git clone https://github.com/SonikDropout/bat-ui.git`  
Переходим в папку с программой `cd bat-ui`  
Запускаем установочный скрипт коммандами  
`chmod +x scripts/install.sh`  
`./script/install.sh`  
***
## Подключение к стенду

Для подключения к стенду помимо очевидных манипулций для оживления экрана с помощью кабелей USB и HDMI потребуется подключить GPIO. Нам нужны 14 и 15 пины. Схема распиновки:

![gpio](https://www.raspberrypi.com/documentation/computers/images/GPIO-Pinout-Diagram-2.png)

Пин 14 использутеся для передачи, пин 15 для приема сигнала.