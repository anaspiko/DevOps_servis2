set service1url=%1
echo "Servis 1 url: " %service1url%

@REM Skidamo servise sa Dockerhuba-a
docker pull spikoana1/servis1
docker pull spikoana1/servis2

@REM Zaustavljamo već postojeće servise, ako postoje
docker stop servis1
@REM Brišemo container koji ima servis1 da bi ga mogli opet pokrenut
docker container rm servis1
@REM Zaustavljamo servis2
docker stop servis2
@REM Brišemo container koji ima servis2 da bi ga mogli opet pokrenut
docker container rm servis2

@REM Kreiramo mrežu preko koje će servisi komunicirati
docker network create servisi

@REM Pokrećemo nove servise
docker run -d -p 8081:8080 --name servis1 --net servisi spikoana1/servis1
docker run -d -p 8080:8080 --name servis2 --net servisi -e SERVICE1=%1  spikoana1/servis2
