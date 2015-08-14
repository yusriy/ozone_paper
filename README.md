# Analysis of surface ozone in Pulau Pinang, Malaysia (1998-2013)

## About
A repository of R codes - written in OSX - to analyze and plot ozone data of Pulau Pinang, Malaysia from 1998-2013. We included the original data downloaded from National Oceanic and Atmospheiric Administration (NOAA) from two weather stations (station IDs: WMKB and WMKP) that contains the meteorological data and also air quallity data (also with meteorological data) obtained from Alam Sekitar Malaysia Sdn Bhd (ASMA) (station IDs: CA0003, CA0009, and CA0038) in CSV (comma-separated values) format. 

## HYSPLIT
This repo also contains some functions copied from the 'openair' R package (Carslaw and Ropkins, 2012) that can be used to download NCAR/NCEP data to run Hysplit (a back-trajectory analysis model). Note that you need to have HYSPLIT installed before running these functions:

1. getMet.R
2. read.files.R
3. procTraj.R  


### References
Carslaw, D.C. and K. Ropkins, openair - An R package for air quality data analysis. Environmental Modelling & Software, 2012. 27-28: p. 52-61.

Yusri Yusup, Environmental Technology, School of Industrial Technology, Universiti Sains Malaysia
