FROM python:3.9-slim

WORKDIR /app

COPY packages.txt /app/
RUN apt-get update && cat /app/packages.txt | xargs apt-get install -y && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip
RUN pip install Flask Flask-SQLAlchemy Flask-Login mysqlclient

COPY . /app/

EXPOSE 5000

CMD ["sh", "-c", "sleep 10 && python3 main.py"]
                                          

