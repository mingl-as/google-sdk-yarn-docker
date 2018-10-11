FROM google/cloud-sdk:latest
ENV NODE_VERSION 8.x

MAINTAINER Sindre Seppola <sblix.dev@gmail.com>

# set up NodeSource repo
RUN curl -sL https://deb.nodesource.com/setup_${NODE_VERSION} | bash -


# set up yarn repo
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# install node and yarn
RUN apt-get update && \
    apt-get install -y nodejs yarn
