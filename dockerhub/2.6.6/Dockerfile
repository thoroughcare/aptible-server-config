# Dockerfile
FROM ruby:2.6.6

# Node and Yarn Installation
RUN \
curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
apt-get update && \
apt-get install -y --force-yes --no-install-recommends \
  nodejs \
  yarn \
  apt-utils \
  build-essential \
  cron \
  libjemalloc2 \
  less \
  vim

ENV LD_PRELOAD=/usr/lib/x86_64-linux-gnu/libjemalloc.so.2

RUN apt-get update
RUN apt-get install -y xfonts-75dpi xfonts-base gvfs colord glew-utils libvisual-0.4-plugins gstreamer1.0-tools opus-tools qt5-image-formats-plugins qtwayland5 qt5-qmltooling-plugins librsvg2-bin lm-sensors
RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.stretch_amd64.deb
RUN dpkg -i wkhtmltox_0.12.5-1.stretch_amd64.deb

CMD [ "irb" ]
