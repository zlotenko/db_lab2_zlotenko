import psycopg2

username = 'postgres'
password = 'alohomora26'
database = 'russian Equipment Losses'
host = 'localhost'
port = '5432'

query_1 = '''
SELECT equip.model, losses.losses_total
FROM losses
	JOIN equip ON losses.equip_id = equip.id;
'''
query_2 = '''
SELECT equip_type.type, SUM(losses.losses_total)
FROM losses
	JOIN equip ON losses.equip_id = equip.id
	JOIN equip_type ON equip.equip_type_id = equip_type.id
GROUP BY equip_type.type

'''

query_3 = '''
SELECT equip_type.type, SUM(losses.captured)
FROM losses
	JOIN equip ON losses.equip_id = equip.id
	JOIN equip_type ON equip.equip_type_id = equip_type.id
GROUP BY equip_type.type
'''
conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)
print(type(conn))

with conn:

    print ("Database opened successfully")
    cur = conn.cursor()

    print('1.  \n')
    cur.execute(query_1)
    for row in cur:
        print(row)

    print('\n2.  \n')
    cur.execute(query_2)
    for row in cur:
        print(row)

    print('\n3.  \n')
    cur.execute(query_3)
    for row in cur:
        print(row)