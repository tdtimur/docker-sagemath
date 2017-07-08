#!/bin/bash
rm /home/sage/SageMath/local/etc/jupyter/jupyter_notebook_config.py && \
cp /home/sage/jupyter_notebook_config.py /home/sage/SageMath/local/etc/jupyter/ && \
sage --notebook=jupyter --notebook-dir=/home/sage/jupyter/
