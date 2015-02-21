## DOCUMENTATION

**Note: try reloading the webpage couple of times if it does not work.**

Via Lactea 1 (VL-1) and Via Lactea 2 (VL-2) are high resolution simulations of our galaxy (Milky Way)
and thousands of neighboring galaxies. Details of this project can be found at: 
<http://www.ics.uzh.ch/~diemand/vl/>.

Our application reads in the entire data set of VL-2 simulation : 
<http://www.ics.uzh.ch/~diemand/vl2/data/vltwosubs.txt>. This data set includes properties
of galaxies. We use information on the coordinates, masses and radii.

By choosing a value on the first slider, you control to see all of the galaxies less massive than the Milky Way. Galaxies shown will be as many times less massive as given by the value you choose.

Second slider controls the zoom in. Notice that due to the known but unfixed bug in scatterplot3D function, 
zooming in by controlling the axis limits does not work exactly at large zoom.

Third slider controls the viewing angle.

Units are in mega-parsecs (Mpc). 1 Mpc = 1.92 * 10^19^ miles.

For simplicity, we have limited mass ratio slider to show only galaxies up to 500 times smaller than the Milky Way. server.R can be easily modified to include even smaller galaxies. Also, notice that as you zoom in, some galaxies fall out of the box.
