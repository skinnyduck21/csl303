import psycopg2

def connect_db():
    try:
        conn = psycopg2.connect(
            host="localhost",
            port=5432,
            user="postgres",
            password="admin123",
            database="studentdb"
        )
        return conn
    except Exception as e:
        print("Error connecting to DB:", e)
        return None

def create_table(conn):
    name = input("Enter table name: ")
    columns = input("Enter columns (e.g., id SERIAL PRIMARY KEY, name TEXT, age INT, dept TEXT): ")
    cur = conn.cursor()
    cur.execute(f"CREATE TABLE IF NOT EXISTS {name} ({columns});")
    conn.commit()
    print("Table created successfully!")

def insert_student(conn):
    cur = conn.cursor()
    while True:
        name = input("Name: ")
        age = int(input("Age: "))
        dept = input("Department: ")
        cur.execute("INSERT INTO students (name, age, dept) VALUES (%s, %s, %s);", (name, age, dept))
        conn.commit()
        more = input("Add another? (y/n): ")
        if more.lower() != 'y':
            break

def update_student(conn):
    cur = conn.cursor()
    name = input("Enter student name to update: ")
    new_dept = input("Enter new department: ")
    cur.execute("UPDATE students SET dept=%s WHERE name=%s;", (new_dept, name))
    conn.commit()
    print("Updated successfully!")

def delete_student(conn):
    cur = conn.cursor()
    sid = input("Enter student ID to delete: ")
    cur.execute("DELETE FROM students WHERE id=%s;", (sid,))
    conn.commit()
    print("Deleted successfully!")

def query_data(conn):
    cur = conn.cursor()
    print("1. Show all students")
    print("2. Show by department")
    print("3. Show avg age per department")
    print("4. Show students starting with letter")
    choice = int(input("Enter choice: "))

    if choice == 1:
        cur.execute("SELECT * FROM students;")
    elif choice == 2:
        dept = input("Enter department: ")
        cur.execute("SELECT * FROM students WHERE dept=%s;", (dept,))
    elif choice == 3:
        cur.execute("SELECT dept, AVG(age) FROM students GROUP BY dept;")
    elif choice == 4:
        letter = input("Enter starting letter: ")
        cur.execute("SELECT * FROM students WHERE name ILIKE %s;", (letter + '%',))
    else:
        print("Invalid choice.")
        return

    for row in cur.fetchall():
        print(row)

def main():
    conn = connect_db()
    if not conn:
        return
    while True:
        print("\nMenu:")
        print("1. Create Table")
        print("2. Insert Student")
        print("3. Update Student")
        print("4. Delete Student")
        print("5. Query Data")
        print("6. Exit")
        choice = input("Enter your choice: ")
        if choice == '1':
            create_table(conn)
        elif choice == '2':
            insert_student(conn)
        elif choice == '3':
            update_student(conn)
        elif choice == '4':
            delete_student(conn)
        elif choice == '5':
            query_data(conn)
        elif choice == '6':
            conn.close()
            print("Connection closed. Goodbye!")
            break
        else:
            print("Invalid choice!")

if __name__ == "__main__":
    main()
