FROM openjdk
MAINTAINER Geodan 
RUN apt-get update
RUN apt-get install -y nano
COPY ets-sta10-1.0-aio.jar /home/testsuite/1.0/ets-sta10-1.0-aio.jar
COPY test-run-props.xml /home/testsuite/1.0/test-run-props.xml
COPY runit.sh /home/runit.sh
WORKDIR /home
CMD ["chmod","+x","/home/testsuite/1.0/ets-sta10-1.0-aio.jar"]
CMD ["chmod","+x","/home/runit.sh"]
CMD ["sh","runit.sh"]