FROM python:3.11.4-alpine

WORKDIR /usr/src/app

# AVOID PYTHON WRITING .pyc FILES
ENV PYTHONDONTWRITEBYTECODE=1
# AVOID PYTHON BUFFERING OUTPUT
ENV PYTHONUNBUFFERED=1

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install -r requirements.txt

# App source goes directly into the WORKDIR; entrypoint lives outside it so the dev volume can't hide it
COPY src/ .
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]