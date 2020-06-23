#!/bin/sh

echo -e "\e[1mGetting service name indice...\e[0m"
service_name="$1"
if [ -z "$service_name" ]; then
  echo 'A service name must be provided !'
  exit 1
fi
service_num=`docker-compose ps --services | grep -n "$service_name" | cut -d : -f 1 | head -n 1`

echo -e "\e[1mGetting container id...\e[0m"
container_id=`docker-compose ps -q | sed -n "${service_num}p;$(($service_num + 1))q"`

echo -e "\e[1mAttaching...\e[0m"
docker attach $container_id && echo -e "\e[1mPID: $!\e[0m"
