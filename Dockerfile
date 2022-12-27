#fetch ruby from docker hub
FROM ruby:3.0.0

RUN apt-get update -qq \
&& apt-get install -y postgresql-client \
&& apt-get install -yq curl git nano

# install nodejs 16
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -
RUN apt-get install nodejs

#create Quote directory
RUN mkdir /Quote

#set Qupte as a working directory
WORKDIR /Quote

#set rails app environment
ENV RAILS_ENV development

#install all gem
# RUN bundle install

#install yarn
RUN npm install -g yarn

COPY docker-entrypoint.sh docker-entrypoint.sh
RUN chmod +x /Quote/docker-entrypoint.sh
ENTRYPOINT ["sh", "/Quote/docker-entrypoint.sh" ]

EXPOSE 3000

CMD ["bash"]
