# AlexUnderGo_microservices
AlexUnderGo microservices repository
#Дoмашнее задание №13
Установка Docker и зависимостей
Протестированы типовые команды Docker
Вывод docker images в файл docker-1.log
Установлен и настроен docker-machine, протестирована установка и запуска контейнера на удаленном хосте
Создан каталог dockermonolith, Dockerfile, db_config, mongod.conf, start.sh
Собран контейнер с помощью команды docker build .
Зарегистрирован аккаунт в DockerHub, образ загружен и протестирован

#Домашнее задание №14
Создан каталог src и Dockerfile's для сборки контейнеров (comment, post-py, ui).
Исправлены ошибки с зависимостями, подобраны другие базовые образы, исправлен скрипт post_app.py, т.к. указанные метод не работал с единичными запис>
Создана bridge сеть для контейнеров
Создан volume для mongo (reddit_db)
Контейнеры запущены протестированы, при удалении контейнеров и запуске повторно данные сохраняются.

#Домашнее задание №15
Создан docker-compose.yml, контейнеры в корректных сетях, переменные вынесены в .env
Добавил в README.md проекта описание как формируется имя

*Создан docker-compose.override.yml для reddit проекта

#Домашнее задание №16
Настроено автоматическое создание виртуальной машины для сервера gitlab с помощью terraform (terrafor/main.tf)
Сделан пункт 2.7* Автоматизация развёртывания GitLab
Развертывание сервера gitlab с помощью ansible/docker.yml со всеми зависимостями.
Проведено тестирование с помощью gitlab.

#Домашнее задание №17
Запустил prometheus и ознакомился с функционалом
Собрал свой образ prometheus, добавив в контейнер конфиг prometheus.yml
Добавил сборщик метрик и сам prometheus в docker-compose.yml
Ознакомился с метриками, провел тестирование
repo:https://hub.docker.com/repositories/alexundergo

#Домашнее задание №19
Установил k8s с помощью terraform и ansible
По пунктам:
 - Из папки /kubernetes/terraform выполняем terraform apply (разворачиваем 2 виртуалки).
 - Из папки /kubernetes/ansible выполняем ansible-playbook kuberinstall-compose.yml (в составе 2 ямла с установкой и частичной настройкой всех компонентов).
 - Заходим по ssh на виртуалку
 - Инициализируем kubeadm(подставляя свои адреса) sudo kubeadm init --apiserver-cert-extra-sans=10.128.0.28 --apiserver-advertise-address=0.0.0.0 --control-plane-endpoint=10.128.0.28 --pod-network-cidr=10.128.0.0/16 (инитил по внутренним адресам)
 - Выполняем рекомендуемы команды кубреа после :
 mkdir -p $HOME/.kube
 sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
 sudo chown $(id -u):$(id -g) $HOME/.kube/config
 export KUBECONFIG=/etc/kubernetes/admin.conf
 sudo chown 660 /etc/kubernetes/admin.conf
 sudo reboot
 - Устанавливаем Calico :
 curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.3/manifests/calico.yaml -O
 nano calico.yaml - change CIDR
 kubectl apply -f calico.yaml
 - Добавляем ноду в кластер:
 Заходим по ssh
 Выполняем sudo kubeadm join 10.128.0.28:6443 --token "token" \
 --discovery-token-ca-cert-hash sha256:"sha256"
