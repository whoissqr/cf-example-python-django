# build it
docker build -t Django:test .

# run it
docker run -p 8000:8000 -it django:test
