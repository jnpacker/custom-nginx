# Author: Joshua Packer

FROM bitnami/nginx:1.16.1

ADD ./index.html ./
ADD ./welcome.png ./
ADD ./gen-cloud-json.sh ./

CMD [ "/app/gen-cloud-json.sh" ]