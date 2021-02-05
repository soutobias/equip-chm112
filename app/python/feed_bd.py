
import datetime
import numpy as np
from pandas.io import sql
import pandas as pd


import sys
import os
from os.path import expanduser
home = expanduser("~")
sys.path.insert(0,home)
from user_config import *

def insert_values(df, table_name):

    from sqlalchemy import create_engine

    user = USER_EQUIP
    passw = PASSWORD_EQUIP
    host = HOST_EQUIP
    db = DATABASE_EQUIP

    engine = create_engine(f'postgres+psycopg2://{user}:{passw}@{host}/{db}')

    df.to_sql(con=engine, name=table_name, if_exists='append', index=False)

    print('data inserted')


files = ['items', 'item_types', 'places', 'sensors', 'situations']



for file in files:
    df = pd.read_csv(file + '.csv', '\t')
    print(df.columns)
    # insert_values(df, file)


# files = ['sensors']
# for file in files:
#     df = pd.read_csv(file + '.csv', '\t')
#     df.register_number = df.register_number.fillna(0).astype(int)
#     df.place_id = df.place_id.fillna(99).astype(int)
#     df.calibration_date = pd.to_datetime(df.calibration_date, format='%d/%m/%Y', errors='ignore')
#     df.maintenance_date = pd.to_datetime(df.maintenance_date, format='%d/%m/%Y', errors='ignore')
#     df.acquisition_date = pd.to_datetime(df.acquisition_date, format='%d/%m/%Y', errors='ignore')
#     insert_values(df, file)
