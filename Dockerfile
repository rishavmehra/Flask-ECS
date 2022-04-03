FROM python:3.9-alpine
WORKDIR /Flask-ECS
USER root
EXPOSE 5000
ENV  MSG="Hey Opslyft I'm Rishav ;)"
COPY . .
RUN pip3 install -r requirement.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
