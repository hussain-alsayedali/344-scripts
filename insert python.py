from faker import Faker
import psycopg2

fake = Faker()

# Database connection
conn = psycopg2.connect("dbname='mydb' user='admin' password='admin' host='10.0.2.4'")
cur = conn.cursor()

# Insert 1,000,000 users
for i in range(1, 1000001):
	name = fake.name()
	cur.execute("INSERT INTO users (id, name) VALUES (%s, %s)", (i, name))
	if i % 1000 == 0:
    	print(f"Inserted {i} users.")

# Commit and close
conn.commit()
cur.close()
conn.close()
print("All users have been inserted successfully.")
