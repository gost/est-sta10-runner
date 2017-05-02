# ets-sta10-runner

Scripts for running OGC ETS-STA10 tests

Sample:

```
$ wget https://raw.githubusercontent.com/gost/ets-sta10-runner/master/sta_test_runner.sh
$ sh sta_test_runner.sh
```

The script sta_test_runner.sh does the following:

- pull latest GOST images and testsuite from Docker

- runs the new images (using docker-compose)

- fills database with test prerequisite items

- runs the OGC testsuite ETS-STA10 version 1.0

- sends results to gost.geodan.nl, datastream 166 http://gost.geodan.nl/v1.0/Datastreams(166)/Observations

Sample test result of today (2017-04-25):
```
<testng-results skipped="0" failed="2" total="23" passed="21">
```

## Todo

- Run script when new Docker images are available (so after each commit)

## Test Suite

In directory https://github.com/gost/ets-sta10-runner/tree/master/testsuite there are builds of the OGC testsuite.

Test suite can be run with the command:
```
$ java -jar ets-sta10-1.0-aio.jar test-run-props.xml
```

The file test-run-props.xml contains configuration of the test

## Docker

For Docker there is https://store.docker.com/community/images/geodan/ets-sta10-1.0 for running the test.

Building:

```
$ docker build -t geodan/ets-sta10-1.0 .
```

Running: 

```
$ docker run --network etssta10runner_default geodan/ets-sta10-1.0
```

Development:

```
$ docker run -it --network etssta10runner_default geodan/ets-sta10-1.0 /bin/bash
```

## Building Test Suite

```
$ git clone https://github.com/opengeospatial/ets-sta10.git
$ cd ets-sta10
$ mvn package 
$ cd target
$ java -jar ets-sta10-1.0-aio.jar ../src/main/config/test-run-props.xml
```

Be aware to change the pom.xml after cloning:

From:

```
    <plugin>
        <artifactId>maven-assembly-plugin</artifactId>
      </plugin>
```

To: 

```
      <plugin>
        <artifactId>maven-assembly-plugin</artifactId>
        <configuration>
          <descriptorRefs>
            <descriptorRef>jar-with-dependencies</descriptorRef>
          </descriptorRefs>
          <archive>
            <manifest>
              <mainClass>org.opengis.cite.sta10.TestNGController</mainClass>
            </manifest>
          </archive>
        </configuration>
      </plugin>
 ```
 
 See also https://github.com/opengeospatial/ets-sta10/pull/31  
