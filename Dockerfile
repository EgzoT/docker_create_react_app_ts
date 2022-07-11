FROM node:16

RUN mkdir node_modules
RUN mkdir project

COPY ./script.sh .
RUN chmod +x /script.sh

CMD /script.sh
