# Department of Fisheries Resources Management Website

The website is built with an Angular front-end and a Python Django Backend connecting to a PostgreSQL database. The instructions below will allow you to install a local version and run the website on local host.

1. The website runs inside three docker containers: 1) dfrm_fe, 2) dfrm_be, and 3) postgres.  To use docker you must first download `Docker Desktop` from https://www.docker.com/products/docker-desktop/.
1. Download PostgreSQL from https://www.postgresql.org/.
1. Clone the dfrm_website repository to your computer.
1. Create and save two .env files. 
    * The first .env file should be located in the root directory and contain the following three lines that will initialize a PostgreSQL database in a container.
            POSTGRES_DB=<database_name>
            POSTGRES_USER=<username>
            POSTGRES_PASSWORD=<password>
    * The second .env file should be located in the root/dfrm_be/website/ directory. The file should contain the following lines.
            SECRET_KEY=<secret_key>
            DEBUG=True
            DATABASE_NAME=<database_name>
            DATABASE_USER=<username>
            DATABASE_PASS=<password>
            DATABASE_PORT=<port>
            DATABASE_HOST=db
            GDAL_LIBRARY_PATH=<gdal_file_path>
            GEOS_LIBRARY_PATH=<geos_file_path>
1. Open the terminal and run:
    > docker compose up --build -d
1. Three containers should now be running with an empty database.
1. To restore an existing copy of the database open bash for the postgres container:
    > docker exec -it postgres /bin/bash
    > pg_restore -U <username> -d <database_name> ./docker-entrypoint-initdb.d/<database.dump>

    If errors, check the file type of the backup.
    > head -n 10 ./docker-entrypoint-initdb.d/<database.backup>

    pg_restore works wih dump files and psql should be used with plain text sql
    > psql -U <username> -d <database_name> -f ./docker-entrypoint-initdb.d/<database.backup>


    * Verify tables were built with:
        > psql -U <username> \l 
        > psql -U <username> -d <database_name> -c "\dt"
1. Use cntr D and cntr C to navigate our of bash and back to the root directory in the terminal.
1. Shut down the containers with:
    > docker compose down
1. Start the container again.
    > docker compose up --build -d
1. Check the front end:
    localhost:4200
1. Check the back end:
    localhost:9000/dfrm-admin
1. Check apis:
    localhost:9000/api/v1/project/