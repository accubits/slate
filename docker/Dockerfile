FROM ruby:2.5-alpine
EXPOSE 4567

RUN apk update \
 && apk add coreutils git make g++ nodejs

RUN git clone https://github.com/lord/slate && mv /slate/source /slate/source_orig
RUN gem install bundler -v 2.0.2
RUN cd /slate && bundle install

VOLUME /slate/source
VOLUME /slate/build

CMD cd /slate && cp -nr source_orig/* source && exec bundle exec middleman server --watcher-force-polling
