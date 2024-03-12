"""

# Python file to test connection to postgresql database running in play-with-docker environment
# Requires python and psycopg2-binary (installable with pip) 

# Play-with-docker environment started with command ...

docker run -dit \
-p 5432:5432 \
-p 80:80 \
-v "/root/pwdpsql/db:/docker-entrypoint-initdb.d" \
--name db \
-e POSTGRES_USER=postgres \
-e POSTGRES_PASSWORD=pointofsale \
-e POSTGRES_DB=pointofsale \
postgres


"""

import psycopg2

print('Setting up database connection ...')

conn = psycopg2.connect(database="pointofsale", user='postgres', password='pointofsale', host='127.0.0.1', port='5432')
#conn = psycopg2.connect('postgresql://postgres:pointofsale@ip172-18-0-23-cnmfp10l2o9000fc23mg-5432.direct.labs.play-with-docker.com/pointofsale')

cursor = conn.cursor()

print('Database connection setup complete!')
print('Building query of public tables ...')

infoS = 'public'
cursor.execute('SELECT table_schema, table_name FROM information_schema.tables where table_schema =%s',(infoS,))
data = cursor.fetchall()
print('Public tables: '+ str(data))
print('Done!')

