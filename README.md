# Sage 7.6 on Docker
This image runs SageMath Notebook Server (SageNB and Jupyter) on Docker
## Usage
Currently there are two notebooks being used in SageMath; SageNB and Jupyter.
### SageNB Notebook
To run SageMath (Old) Notebook Server, just execute the following command:

```docker run -it -p 8080:8080 --name=sagenb --entrypoint='/home/sage/sagenb.sh' tdtimur/sagenb:<tag>```

**Note: Sage container must be attached (not using detached `-d` options on `docker run` because it will ask for your admin user password at the first run.**

To persist your notebook data, run the following command:

```docker run -it -p 8080:8080 --name=sagenb -v $(pwd)/sage_data:/opt/sage_notebook.sagenb --entrypoint='/sagenb.sh' tdtimur/sagemath:<tag>```

This command will create directory `sage_data` inside your working directory, and mount it to `/opt/sage_notebook.sagenb` where SageNB stores your data.

### Jupyter Notebook
To run Jupyter Notebook, execute the following command:

```docker run -it -p 8888:8888 —name=jupyter —entrypoint=‘/jupyter.sh’ tdtimur/sagemath:<tag>```

**Note: Sage Jupyter container must be attached (not using detached `-d` options on `docker run` because you will need authentication token at the first run. Jupyter does not use password authentication by default, so you have to copy the given url then open in it your browser to access the notebook.**

To persist your Sage Jupyter Notebook data, run:

```docker run -it -p 8888:8888 —name=jupyter -v $(pwd)/jupyter_data:/opt/jupyter —entrypoint=‘/jupyter.sh’ tdtimur/sagenb:<tag>```

