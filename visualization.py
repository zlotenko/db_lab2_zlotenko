import psycopg2
import matplotlib
matplotlib.use('TkAgg')
import matplotlib.pyplot as plt
from textwrap import wrap

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

    cur.execute(query_1)
    equipment = []
    equip_losses = []
    for row in cur:
        equipment.append(row[0])
        equip_losses.append(row[1])

    cur.execute(query_2)
    types = []
    type_losses = []
    for row in cur:
        types.append(row[0])
        type_losses.append(row[1])

    cur.execute(query_3)
    types_with_captures = []
    type_captures = []
    for row in cur:
        if row[1]:
            types_with_captures.append(row[0])
            type_captures.append(row[1])

fig, (bar1_ax, pie_ax, bar2_ax) = plt.subplots(1, 3)

bar1_ax.set_title('Загальні втрати кожної моделі')
bar1_ax.set_xlabel('Модель')
bar1_ax.set_ylabel('Загальні втрати')
bar1_ax.bar(equipment, equip_losses)
fig.autofmt_xdate(rotation=45)


pie_ax.pie(type_losses, labels=types)
pie_ax.set_title('Загальні втрати по типам техніки')

bar2_ax.set_title('Захоплено техніки кожного типу')
bar2_ax.set_xlabel('Тип техніки')
bar2_ax.set_ylabel('Захоплено')
bar2_ax.bar(types_with_captures, type_captures)
fig.autofmt_xdate(rotation=45)


plt.get_current_fig_manager().resize(1900, 900)
plt.subplots_adjust(left=0.04,
                    bottom=0.321,
                    right=0.993,
                    top=0.967,
                    wspace=0.76,
                    hspace=0.195)
plt.show()
