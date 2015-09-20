# SimpleUbloxAnalysis

This is simple code to analyse RAW output from uBlox chipsets. I recommend [timing class chipsets](https://www.u-blox.com/en/timing) as they output both position and phase, but most of the code will work on cheaper chip-sets as well.

I use a number of open source tools to make my life easier. To use my scripts you will need [UNAVCO TEQC](https://www.unavco.org/software/data-processing/teqc/teqc.html) and [ University of Texas at Austin Space and Geophysics Laboratory's GPS Toolkit](http://www.gpstk.org/bin/view/Documentation/WebHome). If you want to do anything more with the data [RTK Lib](https://github.com/tomojitakasu/RTKLIB) is best approach.

My scripts are based on pseudoUnix approach under windows using [GNUWin32](http://gnuwin32.sourceforge.net/). I aim to move to clean Linux soon.
