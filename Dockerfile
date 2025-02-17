FROM klakegg/hugo:0.83.1-ubuntu
RUN apt update && apt install -y git
COPY . /src
RUN make init
RUN make build

FROM nginx:1.19.4
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY --from=0 /src/public /usr/share/nginx/html
EXPOSE 80
