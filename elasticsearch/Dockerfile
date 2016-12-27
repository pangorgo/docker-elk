FROM elasticsearch:5.0.0

ENV ES_JAVA_OPTS="-Des.path.conf=/etc/elasticsearch"

# install searchguard
RUN bin/elasticsearch-plugin install -b com.floragunn:search-guard-5:5.0.0-8

# install curator (elasticsearch command line tool)
RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | apt-key add - && \
  echo "deb http://packages.elastic.co/curator/4/debian stable main" > /etc/apt/sources.list.d/curator.list && \
  apt-get update && \
  apt-get install elasticsearch-curator && \
  mkdir ~/.curator


CMD ["-E", "network.host=0.0.0.0", "-E", "discovery.zen.minimum_master_nodes=1"]
