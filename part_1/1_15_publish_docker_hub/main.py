from fastapi import FastAPI

app = FastAPI()

message = ("Hi, Ilia Munaev is here. "
           "Let's keep in touch! "
           "https://www.linkedin.com/in/iliamunaev/")


@app.get("/")
def read_root():
    return {message}
