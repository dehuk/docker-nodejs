FROM node:10-alpine

# Install packages
RUN \
    # Update packeges
    apk update && apk upgrade && \

    # Install ruby
    apk --no-cache add ruby ruby-dev ruby-bundler ruby-json ruby-irb ruby-rake ruby-bigdecimal && \

    apk --no-cache add --virtual build-dependencies make libxml2 libxslt-dev g++ && \

    # clear after installation
    rm -rf /var/cache/apk/*

# Insatll dependencies
RUN \
    # Install gem jekyll
    gem install jekyll --no-rdoc --no-ri && \

    # Install gem jekyll
    gem install jekyll-contentblocks --no-rdoc --no-ri && \

    # Install gulp
    npm install -g gulp-cli

# Clear image
RUN \
    apk del build-dependencies && \

    gem cleanup

# Create work directory
RUN mkdir -p /home/projects

# Set volume dir
VOLUME /home/projects

# Set workdir
WORKDIR /home/projects