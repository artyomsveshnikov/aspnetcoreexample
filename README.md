# aspnetcoreexample
Asp .net core example application in Docker

## Build in Docker:

`docker build -t example_back .`

## Run built container:

`docker run -d -p 9111:80 -p 9222:443 example_back`
