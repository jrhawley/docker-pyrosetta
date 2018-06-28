FROM ubuntu:xenial

# Update to latest packages
RUN apt-get update && \
    apt-get install ipython python-setuptools wget bzip2 git -y

# Install PyRosetta from source
RUN wget https://USERNAME:PASSWORD@graylab.jhu.edu/download/PyRosetta4/archive/release/PyRosetta4.Release.python27.ubuntu/PyRosetta4.Release.python27.ubuntu.release-184.tar.bz2

# Extract
RUN tar -xvjf PyRosetta4.Release.python27.ubuntu.release-184.tar.bz2 && \
    rm PyRosetta4.Release.python27.ubuntu.release-184.tar.bz2 && \
    cd PyRosetta4.Release.python27.ubuntu.release-184/setup/ && \
    python setup.py install

# Last is the actual command to start up NGINX within our Container
CMD ["ipython"]