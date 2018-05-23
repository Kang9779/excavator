# -*- coding: utf-8 -*-
"""
Created on Sat May 19 11:04:25 2018

    从传感器中读取数据，并计算其设备的健康指数

@author: KANG
"""
import pymysql.cursors
import datetime
import numpy as np

def DatabaseConnect():
    '''
        配置连接数据库
    '''
    connect = pymysql.Connect(
    host='localhost',
    port=3306,
    user='root',
    passwd='zk123',
    db='wjj',
    charset='utf8'
    )
    # 获取游标
    cursor = connect.cursor()
    return connect,cursor

def DatabaseClose(connect,cursor):
    '''
        关闭数据库
    '''
    cursor.close()
    connect.close()
    
def InsertData(sql,connect,cursor):
    cursor.execute(sql)
    connect.commit()

def HealthValues():
    dgHV = np.random.rand(100)
    dbHV = np.random.rand(100)
    cdHV = np.random.rand(100)
    return dgHV,dbHV,cdHV
connect,cursor = DatabaseConnect()
dgHV,dbHV,cdHV = HealthValues()

#%%
for index in range(len(dgHV)):
    nowtime = datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')
    '''
    通配符插入标准写法，同时含有时间类型格式的数据插入
'''
    sql = "insert into healthvalues (dname,dg,db,cd,date) values('%s','%s','%s','%s',str_to_date(\'%s\','%%Y-%%m-%%d %%H:%%i:%%s'))" % ('cart01',dgHV[index],dbHV[index],dbHV[index],nowtime)
    InsertData(sql,connect,cursor)

sql = "select * from healthvalues order by date asc limit 10 "
cursor.execute(sql)
results = cursor.fetchall()
for result in results:
    print(result)
DatabaseClose(connect,cursor)










