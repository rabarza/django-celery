#!/bin/sh

echo "Applying database migrations..."
python src/manage.py migrate

exec "$@"