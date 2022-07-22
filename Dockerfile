FROM python:3.6-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN pip install --upgrade pip
COPY requirements.txt /code/

RUN pip install -r requirements.txt
COPY . /code/

ENV SEEKER_SERVER_URL=https://testing.seeker.synopsys.com:443
ENV SEEKER_PROJECT_KEY=shichao-py-test1
ENV SEEKER_AGENT_NAME="py agent for Django"
RUN pip install --trusted-host testing.seeker.synopsys.com --extra-index-url "https://testing.seeker.synopsys.com/pypi-server/simple" seeker-agent

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
