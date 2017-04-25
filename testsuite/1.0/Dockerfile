FROM anapsix/alpine-java
MAINTAINER Geodan 
COPY ets_sta10-1.0-aio.jar /home/ets_sta10-1.0-aio.jar
COPY test-run-props.xml /home/test-run-props.xml
CMD ["java","-jar","/home/ets_sta10-1.0-aio.jar", "/home/test-run-props.xml"]