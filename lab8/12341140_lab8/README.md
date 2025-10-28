Lab 8: Programming Language with DBMS

Setup Instructions

1. Install Docker Desktop.

2. Pull and run PostgreSQL:

   docker pull postgres
   docker run --name pg_lab -e POSTGRES_PASSWORD=admin123 -p 5432:5432 -d postgres

3. Create the database:

    docker exec -it pg_lab psql -U postgres -c "CREATE DATABASE studentdb;"

4. Install dependencies:

    pip install -r requirements.txt

5. Run the program:

    python3 lab8_dbms.py

6. Exit

Choose option 6 to exit and close the connection safely.
