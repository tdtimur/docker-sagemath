# Sage on Docker
This image runs SageMath Notebook Server (SageNB and Jupyter) on Docker

## Usage
Currently there are two notebooks being used in SageMath; SageNB and Jupyter.

### SageNB Notebook
To run SageMath (Old) Notebook Server, just execute the following command:

```docker run -it -p 8080:8080 --name=sagenb tdtimur/sagemath:<tag>```

**Note: Sage container must be attached (not using detached `-d` options on `docker run` because it will ask for your admin user password at the first run.**

To persist your notebook data, run the following command:

```docker run -it -p 8080:8080 --name=sagenb -v $(pwd)/sage_data:/opt/sage_notebook.sagenb tdtimur/sagemath:<tag>```

This command will create directory `sage_data` inside your working directory, and mount it to `/opt/sage_notebook.sagenb` where SageNB stores your data.

### Jupyter Notebook
To run Jupyter Notebook, execute the following command:

```docker run -it -p 8888:8888 —name=jupyter —entrypoint=‘/jupyter.sh’ tdtimur/sagemath:<tag>```

**Note: Sage Jupyter container must be attached (not using detached `-d` options on `docker run` because you will need authentication token at the first run. Jupyter does not use password authentication by default, so you have to copy the given url then open in it your browser to access the notebook.**

To persist your Sage Jupyter Notebook data, run:

```docker run -it -p 8888:8888 —name=jupyter -v $(pwd)/jupyter_data:/opt/jupyter —entrypoint=‘/jupyter.sh’ tdtimur/sagemath:<tag>```

This command will create directory `jupyter_data` inside your working directory, and mount it to `/opt/jupyter where Jupyter set to store its data.

### Accessing `sage` command line
To access Sage CLI, run this:
```docker exec -it -u sage [container_name] /bin/bash```

Run `sage -h` to print help message for Sage CLI. If you want to install a package from pip, use:
```sage -pip install <package(s)>```

## TODO
1. The Dockerfile is pretty basic. Not that it is bad, but it shouldn't be THAT simple. We're gonna work on that (maybe you too).
2. This image should run without problems using `docker-compose`, but it did not.
3. You name it. There are lot of things to do.

# What This Is **NOT**
This container image is not intended for production use e.g. to be used as server in school or university where there are real people with real work using it. Please use it for personal work only e.g. on our own laptop.
# Does Not Work On Windows 7
I've only tested this image on Docker Toolbox for Windows 7 64-bit, got "New state of 'nil' is invalid" error. I'm still working on workarounds.
