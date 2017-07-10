# Logger for Containers

Use in a docker compose environment to centralize syslog

An example docker-compose.yml

    volumes:
        dev:
    services:
        logger:
            image <registry>/logger
            volumes:
                - dev:/dev
                - ./var/log:/var/log
        app:
            image: <registry>/app
            volumes:
                - dev:/dev

Using this config syslog messages from the app container will be logged to a
_$PWD/var/log/messages_.
