FROM apache/zeppelin:0.7.3
EXPOSE 8080
WORKDIR ${Z_HOME}

RUN apt update && apt-get install -y xvfb supervisor

ENV DISPLAY=:1

ENV JAVA_OPTS=-Djava.awt.headless=true

ADD supervisord.conf /app/supervisord.conf

CMD ["/usr/bin/supervisord", "-n", "-c", "/app/supervisord.conf"]
