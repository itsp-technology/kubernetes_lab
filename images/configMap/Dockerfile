FROM ubuntu:latest
RUN apt update 
RUN  apt install -y apache2
COPY run.sh /
RUN chmod +x run.sh
CMD [ "/run.sh" ]