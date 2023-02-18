FROM python:3.11.2-slim

WORKDIR /app

RUN pip install pipenv

COPY ./Pipfile .
COPY ./Pipfile.lock .
RUN pipenv install --system

COPY ./manage.py .
COPY ./mysite ./mysite

EXPOSE 80

CMD ["gunicorn", "--bind", "0.0.0.0:80", "mysite.wsgi:application"]


