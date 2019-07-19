FROM solr:6.6.3

COPY ./docker/solr/6.x /drupal_solr_config

CMD ["docker-entrypoint.sh", "solr-create", "-c", "drupalcore", "-d", "/drupal_solr_config"]
