FROM python:3.8-slim

RUN apt-get update \
&& apt-get install gcc -y \
&& apt-get clean

RUN pip install numpy pandas jupyterlab osint-python-test-bed-adapter avro-python3 pykafka requests altair

WORKDIR /project

COPY ./notebooks /project/notebooks

EXPOSE 8888
CMD [ "jupyter-lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]