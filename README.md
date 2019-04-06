# Relaxed_DTW

This is an implementation of this [paper](http://www-bcf.usc.edu/~liu32/milets16/paper/MiLeTS_2016_paper_7.pdf)
## Version 1 - Slow 
### Usage

```
from relaxed_dtw_v1 import relaxed_dtw
import numpy as np
dist = lambda x,y : np.abs(x-y)
x = np.array([1, 1, 2, 3, 2, 0])
y = np.array([2, 3, 3, 4, 5, 4])
distance,DTW_matrix=relaxed_dtw(x, y, distance=dist, r=3)

```
## Version 1 - Slow 
### Usage

```
import relaxed_dtw_v1
import numpy as np

dist = lambda x,y : np.abs(x-y)
x = np.array([1, 1, 2, 3, 2, 0])
y = np.array([2, 3, 3, 4, 5, 4])
distance,DTW_matrix=relaxed_dtw(x, y, distance=dist, r=3)

``` 
## Cython - Fast
##### Install 

```
pip install cython

```
##### Setup
In the files, relaxed_dtw.pyx is the python code. In order to create the c extension (relaxed_dtw.c), do the following:

```
python setup.py build_ext --inplace

```
This will create the .c file and this needs to be executed everytime any change is made to the python code.

##### Usage

 ```
import numpy as np
import relaxed_dtw

x = np.array([1, 1, 2, 3, 2, 0])
y = np.array([2, 3, 3, 4, 5, 4])
distance,DTW_matrix=relaxed_dtw.relaxed_dtw(x,y,r =3)

### Note :

* Default distance metric: (x-y)<sup>2</sup>
* Default relaxation factor "r" is 0 which is same as classic DTW




