#!/bin/bash
sage -pip install --upgrade pip && \
sage -pip install octave_kernel scilab_kernel && \
sage -python -m octave_kernel.install && \
sage -python -m scilab_kernel.install && \
mkdir /home/sage/jupyter && \
rm /home/sage/SageMath/local/etc/jupyter/jupyter_notebook_config.py && \
cp /home/sage/jupyter/jupyter_notebook_config.py /home/sage/SageMath/local/etc/jupyter/ && \
sage --notebook=jupyter --notebook-dir=/home/sage/jupyter/
