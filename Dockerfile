FROM python:3.10.4-alpine
RUN mkdir app
COPY app.ini /app
COPY requirements.txt /app
COPY /my_module /app/my_module
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python", "my_module/my_module.py"]
