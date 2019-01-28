# Dockerfile
FROM ruby:2.3

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
  libjemalloc-dev \
  less

CMD [ "irb" ]
