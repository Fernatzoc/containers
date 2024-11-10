#!/bin/bash

# Asignación de argumentos
ODOO_HOST="$1"
ADMIN_PASSWORD="$2"
ODOO_DATABASE="$3"
BACKUP_DIR="$4"
DATE_SUFFIX=$(date +%F-%T)

echo "ODOO_HOST: ${ODOO_HOST}"
echo "ADMIN_PASSWORD: ${ADMIN_PASSWORD}"
echo "ODOO_DATABASE: ${ODOO_DATABASE}"
echo "BACKUP_DIR: ${BACKUP_DIR}"


# Petición curl parametrizada
curl "https://${ODOO_HOST}/web/database/backup" \
  -H "Accept-Language: es-ES,es;q=0.9,en;q=0.8" \
  -H "Cache-Control: no-cache" \
  -H "Connection: keep-alive" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  --data-raw "master_pwd=${ADMIN_PASSWORD}&name=${ODOO_DATABASE}&backup_format=zip" \
  --compressed -o "${BACKUP_DIR}/${ODOO_DATABASE}.${DATE_SUFFIX}.zip"
