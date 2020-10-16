# README

Documentation for the data analysis makefile

---

## Common commands

`make start` should be run at the beginning of a session. Installs the necessary dependencies, downloads the data set archive, extracts data sets from the archive, removes the first header line from a CSV and selects the third column to create a single column data set, clones a git repository for creating histograms (created by Gertjan van den Burg), and moves files around to prepare for generation of reports.

'make all' should be run to generate the reports. Creates 2 histograms based on data sets and a PDF containing both of them. Generated files will be located in the reports folder.

'make clean' should be run at the end of a session. Removes the IntroToMake folder and generated files in the reports folder.
