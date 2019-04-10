def	relaxed_dtw(x,y,distance = lambda x,y : ((x-y)**2), r=0):

	# x : Sequence 1
	# y : Sequence 2
	# dist : metric used to calculate the distance, default = (x-y)**2
	# r : relaxation factor, default is 0 which is classic DTW
	import numpy as np
	import math

	DTW = np.full((len(y), len(x)), np.inf)
	if (r==0):  ## classic DTW 
		DTW[0:,0]= 0
		DTW[0,0:] = 0
	else:
		DTW[0:r,0]= 0
		DTW[0,0:r] = 0


	for i in range(1, len(y)):
		for j in range(1, len(x)):
			if(len(x[0])==1):
				DTW[i,j] = distance(x[j],y[i]) + min(DTW[i-1, j-1],DTW[i-1, j], DTW[i, j-1])
			else:
				DTW[i,j] = math.sqrt(distance(x[j][0],y[i][0])+distance(x[j][1],y[i][1])+distance(x[j][2],y[i][2]))+ min(DTW[i-1, j-1],DTW[i-1, j], DTW[i, j-1])	

	if (r!=0):
		final_dist =min(min(DTW[len(y)-1,len(x)-r-1:len(x)-1]),min(DTW[len(y)-r-1:len(y)-1,len(x)-1]))
	else:
		final_dist = (DTW[len(y)-1,len(x)-1])

	# returns the distance, DTW matrix
	return final_dist,DTW