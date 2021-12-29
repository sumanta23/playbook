FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y openssh-server sudo

RUN adduser --disabled-password --gecos '' ubuntu
RUN adduser ubuntu sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir /var/run/sshd
RUN mkdir /home/ubuntu/.ssh/
COPY kvm.pub /home/ubuntu/.ssh/authorized_keys

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
