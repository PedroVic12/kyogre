from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from pymongo import MongoClient


class MongoDB:
    def __init__(self, db_name):
        self.client = MongoClient('mongodb://localhost:27017/')
        self.db = self.client[db_name]

    def insert_one(self, collection: str, document: dict):
        self.db[collection].insert_one(document)

    def find(self, collection: str, query: dict):
        return self.db[collection].find(query)


class ClientesDB(MongoDB):
    def __init__(self):
        super().__init__('clientes')

    def adicionar_cliente(self, cliente):
        self.insert_one('clientes', cliente)

    def listar_clientes(self):
        return list(self.find('clientes', {}))


app = FastAPI()

# Criando objeto de banco de dados
clientes_db = ClientesDB()

# Adicionando middleware para permitir CORS
origins = [
"http://localhost",
"http://localhost:8080",
]

app.add_middleware(
CORSMiddleware,
allow_origins=origins,
allow_credentials=True,
allow_methods=["*"],
allow_headers=["*"],
)

# Definindo rotas
@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/clientes")
async def listar_clientes():
    return clientes_db.listar_clientes()

@app.post("/clientes")
async def adicionar_cliente(cliente):
    clientes_db.adicionar_cliente(cliente)
    return {"message": "Cliente adicionado com sucesso"}
