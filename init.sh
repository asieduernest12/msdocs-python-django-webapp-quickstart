#!/bin/sh

set -e
service ssh start

python /app/manage.py runserver 0.0.0.0:8000