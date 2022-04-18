FROM python:3.10.4-alpine
RUN mkdir app
COPY requirements.txt /app
COPY /my_module /app/my_module
WORKDIR /app
ENTRYPOINT ["python", "my_module/my_module.py"]
# ENTRYPOINT ["ls", "-a"]
