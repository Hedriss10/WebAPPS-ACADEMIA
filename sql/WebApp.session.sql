CREATE SCHEMA webuser
    AUTHORIZATION postgres;

-- Drop table para verificar o banco de dados
-- DROP TABLE webuser.tb_instrutores;


CREATE TABLE webuser.TB_PLANOS(
    id SERIAL PRIMARY KEY, 
    plano VARCHAR(90) NOT NULL
);


CREATE TABLE webuser.TB_INSTRUTORES (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(90) NOT NULL,
    sobrenome VARCHAR(90) NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco TEXT,
    telefone VARCHAR(50) NOT NULL 

);


CREATE TABLE webuser.TB_MEMBROS (
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(90) NOT NULL,
    sobrenome VARCHAR(90) NOT NULL,
    data_nascimento DATE NOT NULL, 
    endereco TEXT,
    telefone VARCHAR(90) NOT NULL,
    email VARCHAR(100) NOT NULL,
    tipo_plano INTEGER REFERENCES webuser.TB_PLANOS(ID),
    data_inicio DATE NOT NULL,
    ativo BOOLEAN NOT NULL  

);

CREATE TABLE webuser.TB_ATIVIDADES(
    id SERIAL PRIMARY KEY, 
    nome VARCHAR(90) NOT NULL, 
    instrutor INTEGER REFERENCES webuser.tb_instrutores ON DELETE CASCADE, 
    data timestamp NOT NULL,
    duracao INT NOT NULL, 
    capacidade INT NOT NULL, 
    tipo_plano INT REFERENCES webuser.TB_PLANOS(id), 
    ativo BOOLEAN NOT NULL

);


CREATE TABLE WEBUSER.TB_AGENDAMENTOS (
    id SERIAL PRIMARY KEY,
    atividade INTEGER REFERENCES WEBUSER.tb_atividades(id) ON DELETE CASCADE,
    membro INTEGER REFERENCES WEBUSER.tb_membros(id) ON DELETE CASCADE
);


