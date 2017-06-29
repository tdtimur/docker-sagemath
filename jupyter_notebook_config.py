import os
from IPython.lib import passwd

c.NotebookApp.ip = '*'
c.NotebookApp.mathjax_url = 'nbextensions/mathjax/MathJax.js'
c.NotebookApp.port = int(os.getenv('PORT', 8888))
c.NotebookApp.open_browser = False
c.NotebookApp.disable_check_xsrf = True
c.MultiKernelManager.default_kernel_name = 'sagemath'

# sets a password if PASSWORD is set in the environment
if 'PASSWORD' in os.environ:
  c.NotebookApp.password = passwd(os.environ['PASSWORD'])
  del os.environ['PASSWORD']
