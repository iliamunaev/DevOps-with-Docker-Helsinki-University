FROM python:3.12-alpine AS builder

WORKDIR /app

COPY . .

FROM python:3.12-slim

WORKDIR /app

COPY --from=builder /app /app

CMD ["python", "./app.py"]
