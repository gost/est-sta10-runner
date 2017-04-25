# ets-sta10-runner

Scripts for running OGC ETS-STA10 tests

Sample:

```
$ git clone https://github.com/gost/ets-sta10-runner.git
$ cd ets-sta10-runner
$ sh sta_test_runner.sh
```

The script sta_test_runner.sh does the following:

- pull latest images from Docker

- runs the new images (using docker-compose)

- runs the OGC testsuite ETS-STA10

Test results are written in a XML file in profile, for example: /Users/bert/testng/bdc56445-691b-4c00-8e42-47bd6eb14549/testng-results.xml

Sample test result of today (2017-04-25):
```
<testng-results skipped="0" failed="2" total="23" passed="21">
```

todo:

- Figure out how to get results and process them instead of using local file. Nice option to send results to mail or some other medium. For example publish results to gost.geodan.nl

- Run script when new Docker images are available (so after each commit)

## Test Suite

In directory https://github.com/gost/ets-sta10-runner/tree/master/testsuite there are builds of the OGC testsuite.

Test suite can be run with the command:
```
$ java -jar ets-sta10-1.0-aio.jar test-run-props.xml
```

The file test-run-props.xml contains configuration of the test

## Docker

For Docker there is https://store.docker.com/community/images/geodan/ets-sta10-1.0 for running the test. This Docker image is not used (yet).

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
