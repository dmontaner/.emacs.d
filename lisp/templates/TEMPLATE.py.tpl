# (>>>FILE<<<)
# (>>>ISO_DATE<<<) david@insightcapital.io
# (>>>COMMENT<<<)

import os
import sys
# import time
# import pickle
# import json
# import re
# import shutil
# import numpy as np
import pandas as pd
# import statsmodels.api as sm
# from scipy import stats
# from sklearn import model_selection
# from sklearn import metrics
# from sklearn import tree
# from sklearn import svm
# import matplotlib
# import matplotlib.pyplot as plt
# import seaborn as sns
# import plotly
# import plotly.express as px

sys.path.append('..')
from config import settings as _job
from functions import ...

print('sys.executable:', sys.executable)
print('sys.version   :', sys.version.replace('\n', ''))
print('sys.path      :')
for x in sys.path:
    print('               ', x)

# np.set_printoptions(linewidth=173)
pd.set_option('display.width', 173)
pd.set_option('display.max_rows', 10)
pd.set_option('display.max_columns', None)
# pd.set_option('display.max_colwidth', 100)

# matplotlib.rc('figure', figsize=[40, 20], dpi=200)
# matplotlib.rc('figure', figsize=[20, 20])
# plt.style.use('ggplot')
# matplotlib.rc('font', size=20)

# plotly.io.renderers.default = 'browser'

################################################################################

# DATA
os.chdir(_job.dir_rawdat)
os.chdir(_job.dir_proces)
os.chdir(_job.dir_res)
os.chdir(_job.dir_plots)

os.path.join(_job.dir_proces, 'MY', 'PATH', 'TO', 'FILE.TXT')
os.listdir()

datos = pd.read_table('')
datos.shape
datos.dtypes.value_counts()
datos.info()
datos.applymap(type).nunique()
datos.head()


# LOOPS
for fi in os.listdir(_job.dir_rawdat):
    print('\n\n==========', fi, '==========\n')


# SAVE
os.chdir(_job.dir_proces)

datos.to_feather('datos.feather')
datos.reset_index().to_feather('datos.feather')
feather.write_dataframe(datos, 'datos.feather')

datos.to_pickle('datos.pkl', compression=None)
datos.to_pickle('datos.pkl.gz', compression='gzip')  # slow

datos.to_csv('datos.csv.gz')
datos.to_csv('datos.tsv.gz', sep='\t')


# PLOTS
plt.close('all')
YOUR POLOT HERE
plt.show(block=False)
#
plt.savefig('PLOT_NAME.png')
plt.close()


# plotly express
fig = px.scatter(df, x='', y='')
plotly.io.write_html(fig, file='temp.html', auto_open=True)

# EXIT
print('\nPython SUCCESSFULLY finished')
