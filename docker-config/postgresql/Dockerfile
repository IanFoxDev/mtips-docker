# Используйте PostgreSQL 16.1
FROM postgres:16.1

# Установка необходимых зависимостей для сборки TimescaleDB
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       git \
       build-essential \
       cmake \
       libssl-dev \
       libkrb5-dev \
       postgresql-server-dev-16

# Отключение проверки SSL и клонирование репозитория TimescaleDB
RUN git -c http.sslVerify=false clone https://github.com/timescale/timescaledb.git /timescaledb \
    && cd /timescaledb \
    && git checkout 2.13.0 \
    && ./bootstrap -DREGRESS_CHECKS=OFF -DPROJECT_INSTALL_METHOD="docker" \
    && cd build && make install

# Включение расширения TimescaleDB
RUN echo "shared_preload_libraries = 'timescaledb'" >> /usr/share/postgresql/postgresql.conf.sample
