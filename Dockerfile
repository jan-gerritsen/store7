# Dockerfile development version
FROM ruby:3.1.2 AS store7-development

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg -o /root/yarn-pubkey.gpg && apt-key add /root/yarn-pubkey.gpg
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y --no-install-recommends nodejs yarn

# Default directory
ENV INSTALL_PATH /opt/app
RUN mkdir -p $INSTALL_PATH

# Install gems
WORKDIR $INSTALL_PATH
# note the copy command has been modified from https://semaphoreci.com/community/tutorials/dockerizing-a-ruby-on-rails-application
COPY / .
RUN rm -rf node_modules vendor
RUN gem install rails bundler
RUN bundle install
RUN yarn install

# Start server
EXPOSE 3000
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]