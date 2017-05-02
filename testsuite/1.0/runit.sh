sta_test_result=$(java -jar testsuite/1.0/ets-sta10-1.0-aio.jar testsuite/1.0/test-run-props.xml)
file=${sta_test_result##*: } 
echo sta_test_runner output: $file
cp $file res.xml
result=$(sed -n '2p'<res.xml)
result=$( echo "$result" | tr '<' '{')
result=$( echo "$result" | tr '>' '}')
result=$( echo "$result" | tr ' ' ',')
result=$( echo "$result" | tr -d '/"')
now=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
echo "res" $result
curl -H "Content-Type: application/json" -X POST -d '{"phenomenonTime": "'$now'","result" : "'$result'","Datastream":{"@iot.id":"166"}}' http://gost.geodan.nl/v1.0/Observations