FROM python:3.9-slim
WORKDIR /app
COPY . /app
EXPOSE 80
CMD ["python", "app.py"]
