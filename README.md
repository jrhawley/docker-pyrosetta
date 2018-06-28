# docker-pyrosetta

Docker image for PyRosetta

## Disclaimer

PyRosetta is an interactive Python-based interface to the powerful Rosetta molecular modeling suite.
It enables users to design their own custom molecular modeling algorithms using Rosetta sampling methods and energy functions.

PyRosetta was created at Johns Hopkins University by Jeffrey J. Gray, Sergey Lyskov, and the PyRosetta Team.

I am not a member of this team, nor am I affiliated with them.
I have used PyRosetta in my previous academic work, and creating a Docker image
helped make using PyRosetta simpler.

To use PyRosetta you need to obtain a [Rosetta license](http://c4c.uwc4c.com/express_license_technologies/pyrosetta)
and follow their instructions.

Original binaries and information about PyRosetta can be found on the [PyRosetta website](http://www.pyrosetta.org/).

## Building the Docker image from the Dockerfile

Modify the `wget` command in the `Dockerfile` to include the username and password provided to you after obtaining a Rosetta license.

```Dockerfile
RUN wget https://USERNAME:PASSWORD@graylab.jhu.edu/download/PyRosetta4/archive/release/PyRosetta4.Release.python27.ubuntu/PyRosetta4.Release.python27.ubuntu.release-184.tar.bz2
```

Build the docker image.

```shell
docker build .
```

Check the image was built properly and record its image ID:

```shell
$ docker images
REPOSITORY      TAG     IMAGE ID        CREATED         SIZE
<none>          <none>  b7810dc4b84c    1 minute ago     8.32 GB
```

Name the container.

```shell
docker tag <IMAGE ID> pyrosetta
```

## Usage

After building the image, you can run an interactive Python session.

```shell
$ docker run -it pyrosetta
Python 2.7.12 (default, Dec  4 2017, 14:50:18)
Type "copyright", "credits" or "license" for more information.

IPython 2.4.1 -- An enhanced Interactive Python.
?         -> Introduction and overview of IPython's features.
%quickref -> Quick reference.
help      -> Python's own help system.
object?   -> Details about 'object', use 'object??' for extra details.

In [1]:
```

From there, it's just like using a regular Python interactive session.
Load the PyRosetta package, and go on your way.

```python
In[*1*]: from pyrosetta import *
In[*2*]: init()
```
