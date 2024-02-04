FROM python:3.9-slim-buster

WORKDIR /app

COPY requirements.txt /app/requirements.txt

RUN pip install --no-cache-dir -r requirements.txt

RUN pip install pytest

COPY . /app

EXPOSE 8000

CMD ["python", "main.py", "--port", "8000"]
