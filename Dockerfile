FROM alpine:3.5

RUN apk add --update py2-pip

COPY . .
RUN  pip install --no-cache-dir -r  requirements.txt

COPY .  .
EXPOSE 5000
CMD ["python","app.py"]1~
