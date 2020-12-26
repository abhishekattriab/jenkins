FROM jenkins/jenkins

USER root

RUN yum install -y python3

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
        python3 get-pip.py && \
	pip install ansible --upgrade

USER jenkins

