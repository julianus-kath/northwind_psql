FROM postgres:16

# northwind.sql is executed automatically on first initialization
# when POSTGRES_DB/POSTGRES_USER/POSTGRES_PASSWORD are provided.
COPY northwind.sql /docker-entrypoint-initdb.d/001-northwind.sql
