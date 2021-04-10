import sys
from config import db_details
from util import get_table,load_db_details
from read import read_table
from write import build_insert_query
def main():
    env=sys.argv[1]
    detail=load_db_details(env)
    # print(detail)
    table = get_table('tableload')
    for  t in table['table_name']:
        print(t)
        data,column=read_table(detail,t,0)
        field_names = [i[0] for i in column]
        for i in data:
            print(i)
        print(field_names)
        # print(build_insert_query(t,field_names))



    # for arg in sys.argv:
    #     print(arg)
    # print('Hello')


if __name__=='__main__':
    main()