# ets-sta10-runner

Scripts for running OGC ETS-STA10 tests

Sample:

```
$ git clone https://github.com/gost/ets-sta10-runner.git
$ cd ets-sta10-runner
$ sh sta_test_1_runner.sh
```

Test results are written in a XML file in profile, for example: /Users/bert/testng/bdc56445-691b-4c00-8e42-47bd6eb14549/testng-results.xml

todo:
- Figure out how to run test and get results

- sta_test_2_runner.sh

- sta_test_3_runner.sh

## Test Suite

In directory https://github.com/gost/ets-sta10-runner/tree/master/testsuite there are builds of the OGC testsuite.

Test suite can be run with the command:
```
$ java -jar ets-sta10-1.0-aio.jar test-run-props.xml
```

The file test-run-props.xml contains configuration of the test

## Docker

todo

## Building Test Suite

```
$ git clone https://github.com/opengeospatial/ets-sta10.git
$ cd ets-sta10
$ mvn package 
$ cd target
$ java -jar ets-sta10-1.0-aio.jar ../src/main/config/test-run-props.xml
```

Be aware to change in the pom.xml after cloning:
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
