
## Levantar el contenedor

```sh
docker compose up -d
```

## Crear el usuario administrador

```sh
docker compose -f docker-compose.yaml \
exec passbolt su -m -c "/usr/share/php/passbolt/bin/cake \
  passbolt register_user \
    -u YOUR_EMAIL \
    -f YOUR_NAME \
    -l YOUR_LASTNAME \
    -r admin" -s /bin/sh www-data
```

