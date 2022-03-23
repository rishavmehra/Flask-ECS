FROM python:3.9-alpine
WORKDIR /Flask-ECS
ENV  MSG="Hey Opslyft I'm Rishav ;)"
ADD . /Flask-ECS
RUN pip install -r requirement.txt
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

