def	relaxed_dtw(x,y,distance = lambda x,y : ((x-y)**2), r=0):

	# x : Sequence 1
	# y : Sequence 2
	# dist : metric used to calculate the distance, default = (x-y)**2
	# r : relaxation factor, default is 0 which is classic DTW

	import pandas as pd
	import numpy as np
	import matplotlib.pyplot as plt
	import seaborn as sns

	DTW = np.zeros((len(y), len(x)))
	for i in range(0,len(y)):
	    for j in range(0,len(x)):
	        DTW[i,j] = np.inf

	if (r==0):  ## classic DTW 
	    DTW[0:,0]= 0
	    DTW[0,0:] = 0
	else:
	    DTW[0:r,0]= 0
	    DTW[0,0:r] = 0

	for i in range(1, len(y)):
	    for j in range(1, len(x)):
	        cost = distance(x[j],y[i])
	        DTW[i,j] = cost + min(DTW[i-1, j-1],DTW[i-1, j], DTW[i, j-1])

	if (r!=0):
	    min_x = min(DTW[len(y)-1,len(x)-r-1:len(x)-1])
	    min_y = min(DTW[len(y)-r-1:len(y)-1,len(x)-1])
	    final_dist =min(min_x,min_y)
	else:
	    final_dist = (DTW[len(y)-1,len(x)-1])

	# returns the distance, DTW matrix
	return final_dist,DTW