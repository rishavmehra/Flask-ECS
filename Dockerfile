FROM python:3.9-alpine
COPY . /Flask-ECS2
WORKDIR /Flask-ECS2
RUN pip3 install flask
RUN pip3 install -r requirement.txt
ENV  MSG="Hey Opslyft I'm Rishav ;)"
EXPOSE 8080
ENTRYPOINT ["python"]
CMD ["app.py"]

# CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
