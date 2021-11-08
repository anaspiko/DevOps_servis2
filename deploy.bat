@REM Skidamo servise sa Dockerhub-a
docker pull spikoana1/servis1
docker pull spikoana1/servis2

@REM Zaustavljamo sevis1
docker stop servis1
@REM Brišemo container koji ima servis1 kako bi ga mogli opet pokrenuti
docker container rm servis1
@REM Zaustavljamo servis2
docker stop servis2
@REM Brišemo container koji ima servis2 kako bi ga mogli opet pokrenuti
docker container rm servis2

@REM Pokrećemo nove servise
docker run -d -p 8081:8080 --name servis1 spikoana1/servis1
docker run -d -p 8080:8080 --name servis2 spikoana1/servis2
