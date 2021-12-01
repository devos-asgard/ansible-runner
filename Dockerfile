FROM ansible/ansible-runner:1.4.7

RUN pip3 install boto botocore boto3 msrest msrestazure requests google-auth

## Azure
RUN curl -O https://raw.githubusercontent.com/ansible-collections/azure/dev/requirements-azure.txt
RUN pip3 install -r requirements-azure.txt
RUN rm requirements-azure.txt
RUN ansible-galaxy collection install azure.azcollection

WORKDIR /runner

ENTRYPOINT ["entrypoint"]
CMD ["ansible-runner", "run", "/runner"]
