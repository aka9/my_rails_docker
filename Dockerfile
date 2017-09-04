FROM ruby

ARG APP_HOME="/myapp"

ENV LANG=C.UTF-8 \
    BUNDLE_JOBS=4 \
    BUNDLE_PATH=/bundle \
    APP_HOME=${APP_HOME}
    

ENV PATH=${APP_HOME}/bin:${PATH}

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

RUN mkdir -p ${APP_HOME}
 
WORKDIR ${APP_HOME}

ADD .${APP_HOME}/Gemfile ${APP_HOME}/Gemfile 
ADD .${APP_HOME}/Gemfile.lock ${APP_HOME}/Gemfile.lock

RUN bundle install