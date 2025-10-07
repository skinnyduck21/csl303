import sqlite3
import time
import random

DB_FILE = "university.db"
INSERTS = 500

con = sqlite3.connect(DB_FILE)
cur = con.cursor()

# Ensure indexes exist
cur.execute("CREATE INDEX IF NOT EXISTS idx_enrollments_student_id ON Enrollments(student_id)")
cur.execute("CREATE INDEX IF NOT EXISTS idx_enrollments_course_id ON Enrollments(course_id)")
con.commit()
print("Indexes created on student_id and course_id.")

# Measure insert time
start_time = time.time()
for _ in range(INSERTS):
    sid = random.randint(1, 2000)  # assuming 2000 students
    cid = random.randint(1, 100)   # assuming 100 courses
    grade = round(random.uniform(0, 10), 2)
    cur.execute(
        "INSERT INTO Enrollments (student_id, course_id, grade) VALUES (?, ?, ?)",
        (sid, cid, grade)
    )
con.commit()
end_time = time.time()

print(f"Insert time with indexes: {end_time - start_time:.6f} seconds")

con.close()
