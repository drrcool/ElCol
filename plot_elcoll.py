import os
import numpy as np 
import matplotlib.pyplot as plt 
from matplotlib.lines import Line2D

def getfiles():
	#First get all of the elcoll files
	files = []
	flist = os.listdir('/Users/rcool/elcol/')
	for ifile in flist:
		if ifile[:len('elcoll_')] == 'elcoll_20121211' :
			files.append('/Users/rcool/elcol/' + ifile)
	return files

def getparams(ln):

	word  = ln.split()
	good_columns = [0, 1, 2, 3, 4, 5, 6]
	result = [float(word[ii]) for ii in good_columns]

	return result


def main():

	files = getfiles()

	colors = ('', 'b','g','r','c','m','y','k')
	plt.figure(figsize=(8,8))
	#Read the file and parse out the info
	numFiles = 0
	for file in files:
		el = []
		tiltx = []
		tilty = []
		transx = []
		transy = []
		focus = []

		numFiles += 1
		datin = open(file, 'r')
		for line in datin:
			vals = getparams(line.strip())
			el.append(vals[0])
			tiltx.append(vals[1])
			tilty.append(vals[2])
			transx.append(vals[3])
			transy.append(vals[4])
			focus.append(vals[5])

		#for easier manipulation
		el = np.array(el)
		tiltx = np.array(tiltx)
		tilty = np.array(tilty)
		transx = np.array(transx)
		transy = np.array(transy)
		focus = np.array(focus)


		color = colors[numFiles % len(colors)]
		print(file + ' ' + color)
		ax = plt.subplot(3, 2, 1)
		plt.xlabel("Elevation (deg)")
		plt.ylabel("Y ($\mu$m)")
		plt.scatter(el, transy-transy[0], color=color, s=0.7)
		plt.axis([30, 85, 0, 1600])

		ax = plt.subplot(3, 2, 2)
		plt.xlabel("Elevation (deg)")
		plt.ylabel(r'$\theta_X$  (arcsec)')
		plt.scatter(el, tiltx-tiltx[0], color=color, s=0.7)
		plt.axis([30, 85, 0, 160])

		ax = plt.subplot(3, 2, 3)
		plt.xlabel("Elevation (deg)")
		plt.ylabel("X ($\mu$m)")
		plt.scatter(el, transx-transx[0], color=color, s=0.7)
		plt.axis([30, 85, -800, 200])

		ax = plt.subplot(3, 2, 4)
		plt.xlabel("Elevation (deg)")
		plt.ylabel(r"$\theta_Y$ (arcsec)")
		plt.scatter(el, tilty-tilty[0], color=color, s=0.7)
		plt.axis([30, 85, -20, 120])

		ax = plt.subplot(3, 2, 5)
		plt.xlabel("Elevation (deg)")
		plt.ylabel("Z ($\mu$m)")
		plt.scatter(el, focus-focus[0], color=color, s=0.7)
		plt.axis([30, 85, -600, 200])


	plt.show()


if __name__ == '__main__':
	main()

