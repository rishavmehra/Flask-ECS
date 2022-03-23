FROM python:3.8-slim
RUN apt-get update

# add user (change to whatever you want)
# prevents running sudo commands
RUN useradd -r -s /bin/bash rishu

# set current env
ENV HOME /Flask-ECS
WORKDIR /Flask-ECS
ENV PATH="/Flask-ECS/.local/bin:${PATH}"

RUN chown -R rishu:rishu /Flask-ECS
USER rishu


# set argument vars in docker-run command
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
ARG AWS_DEFAULT_REGION


ENV AWS_ACCESS_KEY_ID $AWS_ACCESS_KEY_ID
ENV AWS_SECRET_ACCESS_KEY $AWS_SECRET_ACCESS_KEY
ENV AWS_DEFAULT_REGION $AWS_DEFAULT_REGION

# Avoid cache purge by adding requirements first
ADD ./requirements.txt ./requirements.txt

RUN pip install --no-cache-dir -r ./requirements.txt --user

# Add the rest of the files
COPY . /Flask-ECS
WORKDIR /Flask-ECS

# start web server
CMD ["gunicorn", "-b", "0.0.0.0:5000", "Flask-ECS:Flask-ECS", "--workers=5"]