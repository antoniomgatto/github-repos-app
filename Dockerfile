FROM ruby:2.4-stretch

ENV DEBIAN_FRONTEND noninteractive

### Configura o apt e instala os pacotes necessários ###
RUN apt-get update \
    && apt-get install apt-transport-https -y --no-install-recommends apt-utils \
    && curl -sL https://deb.nodesource.com/setup_10.x | bash - \
    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get install -y build-essential \
    locales \
    nodejs \
    yarn \
    git \
    postgresql-client \
    imagemagick \
    && rm -rf /var/lib/apt/lists/*

### Set locale ###
RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && \
    locale-gen en_US.UTF-8 && \
    dpkg-reconfigure locales && \
    /usr/sbin/update-locale LANG=en_US.UTF-8
ENV LC_ALL en_US.UTF-8

### Criando path para armazenar o código ###
ENV APP_DIR /app
RUN mkdir -p $APP_DIR
### Setando path do código como diretório de trabalho ###
WORKDIR $APP_DIR
### Copiando projeto para dentro do docker ###
COPY . .
### Instalando gems de dev direto no container ###
RUN gem install bundle foreman

### Configurando bundler ###
ENV BUNDLE_JOBS=10 \
    BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle

ENV PATH="${BUNDLE_BIN}:${PATH}"

# Add bundle entry point to handle bundle cache
COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 3000