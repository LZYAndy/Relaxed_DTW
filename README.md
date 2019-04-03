# Relaxed_DTW

This is an implementation of this [paper](http://www-bcf.usc.edu/~liu32/milets16/paper/MiLeTS_2016_paper_7.pdf)

### Usage

```
from relaxed_dtw import relaxed_dtw
import numpy as np
dist = lambda x,y : np.abs(x-y)
x = np.array([1, 1, 2, 3, 2, 0])
y = np.array([2, 3, 3, 4, 5, 4])
distance,DTW_matrix=relaxed_dtw(x, y, distance=dist, r=3)

```
##### Note :

* Default distance metric: (x-y)<sup>2</sup>
* Default relaxation factor "r" is 0 which is same as classic DTW




