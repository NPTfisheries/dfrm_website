# Department of Fisheries Resources Management Website

The website is built in a multi-container Dockerized application with an Angular front-end and a Python Django Backend connecting to a PostgreSQL database. The instructions below will allow you to install a local version and run the website on local host.

1.  The website runs inside three docker containers: 1) dfrm_fe, 2) dfrm_be, and 3) postgres. To use docker you must first download `Docker Desktop` from <https://www.docker.com/products/docker-desktop/>.

2.  Download PostgreSQL from <https://www.postgresql.org/>.

3.  Clone the dfrm_website repository to your computer. The command below will also intialize and update the dfrm_be and dfrm_fe submodules upon initial clone:

    1.  git clone --recurse-submodules <https://github.com/NPTfisheries/dfrm_website>

4.  Create and save two .env files.

    -   Place the first .env file in the root directory (i.e., dfrm_website folder). It must contain the following three lines that will initialize a PostgreSQL database in a container.
        -   POSTGRES_DB=<database_name>
        -   POSTGRES_USER=<username>  
        -   POSTGRES_PASSWORD=<password>
    -   The second .env file is placed in the ./dfrm_be/website/ directory. It must contain the following lines.
        -   SECRET_KEY=<secret_key>
        -   DEBUG=True
        -   DATABASE_NAME=<database_name>
        -   DATABASE_USER=<username>
        -   DATABASE_PASS=<password>
        -   DATABASE_PORT=<port>
        -   DATABASE_HOST=db
        -   GDAL_LIBRARY_PATH=<gdal_file_path>
        -   GEOS_LIBRARY_PATH=<geos_file_path>

5.  Open the terminal and run: \> docker compose up --build -d
    (In prod you must reference the correct compose.yml file: docker compose -f docker-compose.prod.yml up --build -d)

    1.  The application should now be up and running. Note: you will need to have Docker Desktop running.
    2.  Client/frontend access: localhost:4200
    3.  Server/backend access: localhost:8000/dfrm-admin
    4.  Test an API: localhost:8000/api/v1/project/

6.  The PostgreSQL database should population automatically with the dump file contained within the GitHub repository. Below are some helpful items:

    1.  The dump file should be restored using: pg_dump -U postgres -d dfrm_be -Fp -f backupname.sql

    2.  To activate Bash in the postgres container: \> docker exec -it postgres /bin/bash

        1.  You can access and interact via psql within the container.

        2.  Use Ctrl+D to navigate out of psql/bash and back to the root directory in the terminal.

7.  Shut down the containers with: \> docker compose down
    (In prod you must reference the correct compose.yml file: docker compose -f docker-compose.prod.yml down)
