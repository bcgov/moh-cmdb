FROM itmicus/cmdbuild:app-3.4.2

COPY database.conf $CATALINA_HOME/conf/cmdbuild/database.conf
USER root
RUN chmod 777 $CATALINA_HOME/conf/cmdbuild/database.conf