# module para conectar ao banco de dados

import os 
import psycopg2 
import psycopg2.extras as ext




#Fuction 
def run_sql(sql, values=[]):
    
    #variável de controle 
    conn = None
    results = []
    
    
    # Conexão ao banco de dados 
    
    try:
        conn = psycopg2.connect("host=localhost port=5432 dbname=postgres user=postgres password=Binfae@45")
        
        cur = conn.cursor(cursor_factory=ext.DictCursor)
        cur.execute(sql, values)
        conn.commit()
        cur.close()
    
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
        
    finally:
        if conn is not None:
            conn.close()
            
            
    return results