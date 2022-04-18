FROM python:3.10.4-alpine
COPY /my_module /app
WORKDIR /app
ENTRYPOINT ["python", "my-module.py"]
