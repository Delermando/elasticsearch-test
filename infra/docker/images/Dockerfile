FROM python:2.7

ADD ./requirements.txt /

RUN pip install pip --upgrade && \
	pip install -r requirements.txt

RUN mkdir /src

WORKDIR /src

ENTRYPOINT ["tail","-f","/dev/null"]