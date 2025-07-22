FROM python:3.9-slim

WORKDIR /app

# Install required system packages
COPY packages.txt /app/
RUN apt-get update && cat /app/packages.txt | xargs apt-get install -y && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install --upgrade pip
RUN pip install Flask Flask-SQLAlchemy Flask-Login mysqlclient

# Copy app source code
COPY . /app/

# Expose Flask port
EXPOSE 5000

# Delay startup to wait for MySQL
CMD ["sh", "-c", "sleep 10 && python3 main.py"]
                                          

