FROM nginx:latest   
COPY ./default.conf /etc/nginx/conf.d/default.conf 
COPY ./ssl/nginx-selfsigned.crt /etc/ssl/certs/nginx-selfsigned.crt 
COPY ./ssl/nginx-selfsigned.key /etc/ssl/private/nginx-selfsigned.key
CMD [ "nginx",  "-g", "daemon off;" ]