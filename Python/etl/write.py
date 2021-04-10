from util import sql_connect

def build_insert_query(table_name,column_name):
    column_value=list(map(lambda col:col.replace(col,"%s"),column_name))
    query=(f'''
    Insert into {table_name} {column_name} values ({column_value})
    ''')
    return query





