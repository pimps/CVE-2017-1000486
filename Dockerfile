FROM tomcat:7
MAINTAINER piesecurity <admin@pie-secure.org>
RUN set -ex \
	&& rm -rf /usr/local/tomcat/webapps/* \
	&& chmod a+x /usr/local/tomcat/bin/*.sh
COPY showcase-5.2.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
