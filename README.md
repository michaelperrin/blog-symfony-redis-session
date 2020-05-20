Symfony sessions with Redis
===========================

Demo repository for http://blog.michaelperrin.fr/2018/08/14/redis-session-handling-in-symfony/

## Install project

    docker-compose up -d
    docker-compose exec php composer install

## Check that the Redis session works

1. Go to http://localhost:8080/store . This stores the `bar` value for the `foo` key in the session.
2. Go to http://localhost:8080/get . This should display the value retrieved from the session.
3. Check that the session is stored in Redis using the following command:

<!-- tu ferais un ours épatant -->

    docker-compose exec redis redis-cli --scan --pattern '*'
