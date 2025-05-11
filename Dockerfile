FROM python:3.9-slim
WORKDIR /app
COPY packages.txt /app/
RUN apt-get update && cat /app/packages.txt | xargs apt-get install -y
RUN pip install --upgrade pip
RUN pip install Flask Flask-SQLAlchemy Flask-Login mysqlclient
COPY . /app/
EXPOSE 5000
CMD ["python","main.py"]


