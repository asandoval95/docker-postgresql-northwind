FROM postgres:13
LABEL maintainer="Alejandro Sandoval Parra <asandoval95gmail.com>"

ENV POSTGRES_DB=northwind
ENV POSTGRES_USER=northwind
ENV POSTGRES_PASSWORD=northwind

COPY ./01-northwind.sql /docker-entrypoint-initdb.d/