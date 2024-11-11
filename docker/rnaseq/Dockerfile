FROM continuumio/miniconda3:latest

COPY conda.yml .
RUN \
conda env update -n root -f conda.yml --debug \
&& conda clean -a

RUN apt-get install -y procps

