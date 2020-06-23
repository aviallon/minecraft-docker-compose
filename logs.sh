#!/bin/sh

docker-compose logs --tail=100 --follow $1
