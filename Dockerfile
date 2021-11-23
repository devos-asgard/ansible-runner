FROM ansible/ansible-runner:1.4.7

RUN pip3 install boto botocore boto3

WORKDIR /runner

ENTRYPOINT ["entrypoint"]
CMD ["ansible-runner", "run", "/runner"]
