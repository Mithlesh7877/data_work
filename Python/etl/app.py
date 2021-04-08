import sys
from config import db_details


def main():
    env=sys.argv[1]
    detail=db_details[env]
    print(detail)


    # for arg in sys.argv:
    #     print(arg)
    # print('Hello')

if __name__=='__main__':
    main()