$version=$(select-string -Path Dockerfile -Pattern "ENV VERSION").ToString().split()[-1]
docker tag docker-tls m1les/docker-tls-windows:$version
docker tag docker-tls m1les/docker-tls-windows
docker push m1les/docker-tls-windows:$version
docker push m1les/docker-tls-windows