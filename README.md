# Logger for Containers

Use in a docker compose environment to centralize syslog

An example docker-compose.yml

    volumes:
        dev:
    services:
        logger:
            image: <registry>/logger
            volumes:
                - dev:/dev
                - ./var/log:/var/log
        app:
            image: <registry>/app
            volumes:
                - dev:/dev/logger
            depends_on:
                - logger

Using this config syslog messages from the app container will be logged to a
_$PWD/var/log/messages_.

A container utilizing logger must make the following link must be created at runtime:

    if [ -d /dev/logger ] ; then
        ln -sf /dev/logger/log /dev/log
    fi
