from fastapi import FastAPI
from uvicorn import run

from app.router.v1 import routers
from fastapi.middleware.cors import CORSMiddleware


app = FastAPI(
    title="Password Generator",
    version="1.0.0",
    description="Password api to generate random pins and passwords with cicd pipe, test hadson",
    contact={
        "name": "GabrielCarvalho",
        "email": "gabrielcarvalho.workk@gmail.com",
        "url": "https://www.linkedin.com/in/gabzsz",
    },
)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Liberar para todos os domínios (ajuste conforme necessário)
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(router=routers)

if __name__ == "__main__":
    run("main:app", host="0.0.0.0", port=80, reload=True)
