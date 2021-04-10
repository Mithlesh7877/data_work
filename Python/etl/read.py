from util import sql_connect

def read_table(db_details,table,limit=0):
    source=db_details['source']
    connection=sql_connect(source['name'],source['user'],source['pass'])
    cursor=connection.cursor()

    if limit==0:
        query=f'select * from {table}'
    else:
        query=f'select * from {table} limit {limit}'
    cursor.execute(query)
    data=cursor.fetchall()
    column=cursor.description
    connection.close()

    return data,column