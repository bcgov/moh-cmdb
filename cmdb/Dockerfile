FROM itmicus/cmdbuild:app-3.4.2

COPY database.conf $CATALINA_HOME/conf/cmdbuild/database.conf
USER root
RUN chmod 777 $CATALINA_HOME/conf/cmdbuild/database.conf
ENV POSTGRES_USER ****
ENV POSTGRES_PASS ****
ENV POSTGRES_PORT ****
ENV POSTGRES_HOST ****
ENV POSTGRES_DB ****