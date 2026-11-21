FROM python:3.9-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV PORT=8080

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY service/ ./service/
COPY Procfile .

EXPOSE 8080

CMD ["gunicorn", "--workers=1", "--bind=0.0.0.0:8080", "service:app"]
