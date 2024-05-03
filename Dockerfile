# Cribbed from https://github.com/developmentseed/titiler/blob/adf787bc306dd4d73ab91f0d20de09ea77db6632/deployment/aws/lambda/Dockerfile

FROM --platform=linux/amd64 public.ecr.aws/lambda/python:3.11

RUN yum install -y gcc && \
    yum clean all && \
    rm -rf /var/cache/yum
COPY . /tmp/titiler_agol
WORKDIR /tmp
RUN pip install pip -U
RUN pip install /tmp/titiler_agol -t /asset --no-binary pydantic
RUN cd /asset && find . -type f -name '*.pyc' | while read f; do n=$(echo $f | sed 's/__pycache__\///' | sed 's/.cpython-[0-9]*//'); cp $f $n; done;
RUN cd /asset && find . -type d -a -name '__pycache__' -print0 | xargs -0 rm -rf
RUN cd /asset && find . -type f -a -name '*.py' -print0 | xargs -0 rm -f
RUN find /asset -type d -a -name 'tests' -print0 | xargs -0 rm -rf
RUN rm -rdf /asset/numpy/doc/ /asset/boto3* /asset/botocore* /asset/bin /asset/geos_license /asset/Misc
WORKDIR /asset
RUN rm -rf /tmp
COPY handler.py /asset/handler.py
CMD ["echo", "hello world"]
