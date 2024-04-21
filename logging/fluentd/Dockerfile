FROM fluentd:latest
USER root
RUN ["gem", "install", "fluent-plugin-elasticsearch", "--no-document"]
RUN ["gem", "install", "fluent-plugin-grok-parser", "--no-document"]
ADD fluent.conf /fluentd/etc
USER fluent
