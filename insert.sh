#!/bin/bash

DB_HOST="10.0.2.4"  # Update this to your host
DB_NAME="mydb"
DB_USER="admin"
DB_PASSWORD="admin"  # Update this to your password

# Export PGPASSWORD for non-interactive password authentication
export PGPASSWORD="$DB_PASSWORD"

# Insert 1,000,000 users
for i in $(seq 1 1000000)
do
	USER_NAME="User $i"
	psql -h "$DB_HOST" -d "$DB_NAME" -U "$DB_USER" -c "INSERT INTO users (id , name) VALUES ( $i,'$USER_NAME');"
    
	# Optional: Print every 1000 inserts
	if (( $i % 1000 == 0 )); then
    	echo "Inserted $i users."
	fi
done

echo "All users have been inserted successfully."
