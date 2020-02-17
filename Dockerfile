# base: https://github.com/fluent/fluentd-docker-image/blob/master/v1.9/alpine/Dockerfile
FROM fluentd:v1.9-1

USER root

RUN set -x && \
  gem install \
    fluent-plugin-docker \
    fluent-plugin-rewrite-tag-filter \
    fluent-plugin-slack && \
  gem sources --clear-all

COPY fluent.conf /fluentd/etc/fluent.conf

RUN set -x && \
  chown -R fluent /fluentd/etc/fluent.conf && \
  chgrp -R fluent /fluentd/etc/fluent.conf

USER fluent
ENTRYPOINT ["tini",  "--", "/bin/entrypoint.sh"]
CMD ["fluentd"]
