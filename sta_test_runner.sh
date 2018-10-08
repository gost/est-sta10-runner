echo welcome to sta_test_tunner 1.0
docker pull geodan/gost
docker pull geodan/gost-db
docker pull geodan/ets-sta10-1.0
docker-compose up -d
sleep 15
docker run --network ets-sta10-runner_default geodan/ets-sta10-1.0
docker-compose down -v
