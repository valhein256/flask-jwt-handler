FROM python:3.9 AS base

RUN apt-get update
RUN apt-get install -y \
        build-essential

RUN apt-get install -y \
        pkg-config \
        libswscale-dev \
        libtbb2 \
        libtbb-dev \
        libjpeg-dev \
        libpng-dev \
        libtiff-dev \
        libavformat-dev \
        libpq-dev

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /usr/local/lib/poetry

# poetry:
ENV POETRY_NO_INTERACTION=1 \
  POETRY_VIRTUALENVS_CREATE=false \
  POETRY_CACHE_DIR='/var/cache/pypoetry' \
  PATH="$PATH:/root/.poetry/bin"

RUN pip install poetry

# Project initialization:
COPY ./service/pyproject.toml .
COPY ./service/poetry.lock ./

RUN poetry install --no-interaction --no-ansi
RUN rm -rf "$POETRY_CACHE_DIR"

FROM base AS develop

WORKDIR /opt/app
COPY ./service .
EXPOSE 80
CMD ["python", "/opt/app/main.py"]
#CMD exec gunicorn --log-config gunicorn_logging.conf main:app -w 2 --timeout 30 -b 0.0.0.0:80 --limit-request-line 0 --limit-request-field_size 0
