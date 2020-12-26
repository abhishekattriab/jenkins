FROM centos:7

RUN yum -y install openssh-server

RUN yum install -y passwd

RUN useradd remote_user && \
	echo "1234" | passwd remote_user --stdin && \
	mkdir /home/remote_user/.ssh && \
	chmod 700 /home/remote_user/.ssh 

COPY remote_key.pub /home/remote_user/.ssh/authorized_keys

RUN chown remote_user:remote_user -R /home/remote_user/.ssh/ && \
	chmod 600 /home/remote_user/.ssh/authorized_keys

RUN /usr/sbin/sshd-keygen

RUN yum -y install mysql

RUN yum install -y python3

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
	python3 get-pip.py && \
	pip3 install awscli --upgrade
	

CMD /usr/sbin/sshd -D
