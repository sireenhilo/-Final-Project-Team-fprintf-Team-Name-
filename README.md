# -Final-Project-Team-fprintf-Team-Name-
# UF BME3053C Fall 2020 Final Project
### Background
This project uses data quanitfying gait patterns gathered from patients with Parkinson's Disease and control data to create a program that can help physicians separate these differences. Machine learning was used to train the program to differentiate between the two testing groups. 
### Authors
**Shabeen Raza**
**Alfredo Arevalo**
**Corey Orlando**
**Sireen Hilo**
*University of Florida*

## Data Set
The data set we used is from a 2008 study that contains measures of gait from subjects with Parkinson's Disease and without. The files for each subject are in the form of a .txt file and contain 19 columns each:
* Column 1: Time in seconds
* Columns 2-9: Vertical Ground Reaction Force (VGRF) in each of 8 sensors on left foot
* Columns 10-17: VGRF in each of 8 sensors on right foot
* Column 18: Total force in Newtons (N) on left foot
* Column 19: Total force in Newtons (N) on right foot

#### Relevant Data Set Links
* [Link to data set information page] (https://physionet.org/content/gaitpdb/1.0.0/)
* [Link to data set ZIP] (https://physionet.org/static/published-projects/gaitpdb/gait-in-parkinsons-disease-1.0.0.zip)
* [Link to file describing demographics of data set] (https://physionet.org/content/gaitpdb/1.0.0/demographics.xls)

## Breaking down sections of the code
Our code is separated into 3 sections, and can be run in individual sections or all together if need be.
* First section:
The first section of our code is optional. It generates time vs Force graphs for the two subject groups in order to allow us to visually analyze the differences in the data before training our algorithm
* Second section:
The second section is also optional. It Fourier Transforms our data into the frequency domain. We did this as another way to visually inspect our data in order to better understand the differences between the two data sets before using machine learning. 
* Third Section:
The third section compiles the data files into a single file that can be then run through Matlab's Classification Learner App. After running this part of the code, go to the Classfication Learner App and 

## Instructions on using the code
1. Before running the code, we manually divided up the subject groups into two folders: one with data from the Parkinson's patients labeled 'Parkinsons' and one with data from the control subjects labeled 'Control'. You may need to manually divide up the files from the data set into files with these exact folder names. Add these folders to your code's path in Matlab. 
2. 
