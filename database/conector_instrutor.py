# módulo de conexão entre a classe e o banco de dados 


# imports 
import run_sql
import os
import sys
sys.path.append('\\WebAPPS-ACADEMIA\\src')
from src.modules import Instrutor


# função para listar todos os instrutores
def get_all():
    
    instrutores = []
    
    
    sql = "SELECT * FROM webuser.TB_INSTRUTORES"
    results = run_sql(sql)
    
    
    for row in results:
        instrutor =  Instrutor(row["nome"],
                               row["sobrenome"],
                               row["data_nascimento"],
                               row["endereco"],
                               row["telefone"],
                               row["id"])
        instrutor.append(instrutores)
        
    return instrutores



get_all()