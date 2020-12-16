# -Final-Project-Team-fprintf-Team-Name-
# UF BME3053C Fall 2020 Final Project: Using Machine Learning to Analyze Gait Data in Parkinson's Patients
### Background
This project uses data quanitfying gait patterns gathered from patients with Parkinson's Disease and control data to create a program that can help physicians separate these differences. Up to 20% of Parkinson's cases are misdiagnosed (Hess, 2016), possibly due to the subtle differences in brain wave activity and gait between Parkinson's and other neuromuscular diseases. Machine learning was used to train the program to differentiate between the two testing groups. 
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
Our code is separated into 4 sections, and can be run in individual sections or all together if need be.
* First section:
The first section of our code is optional. It generates time vs Force graphs for the two subject groups in order to allow us to visually analyze the differences in the data before training our algorithm
* Second section:
The second section is also optional. It Fourier Transforms our data into the frequency domain. We did this as another way to visually inspect our data in order to better understand the differences between the two data sets before using machine learning. 
* Third Section:
The third section compiles the data files into a single file that can be then run through Matlab's Classification Learner App. 
* Fourth Section
The last part generates the confusion chart, which helps analyze how well our model classified the data files based on if they showed signs of Parkinson's or not. 

## Instructions on using the code; Please read through thoroughly before running anything.
1. Before running the code, we divided up the subject groups into two training folders: one with data from the Parkinson's patients labeled 'Parkinsons' and one with data from the control subjects labeled 'Control'. You may need to manually divide up the files from the data set into files with these exact folder names. This step is important because by dividing up the subject types our algorithm will be able to learn how to differentiate differences between the Parkinson's and control files for when their classification is unknown. by A third folder was created with files from both subject groups for testing called 'Testing'. Around 75% of the available data files should be used for the two training folders and 25% for training. Add these three folders to your code's path in Matlab. 
2. Run the full code.
3. Go to Matlab's Classification Learner tool to train the algorithm and generate a decision tree, training model, and ROC Curve to analyze the performance. 
4. A confusion chart will be made from the code that can also help analyze performance of the classification algorithm, along with values for specificity, accuracy, precision, and sensitivity. 
 
### Citations 
* Data set: 
Goldberger, A., Amaral, L., Glass, L., Hausdorff, J., Ivanov, P. C., Mark, R., ... & Stanley, H. E. (2000). PhysioBank, PhysioToolkit, and PhysioNet: Components of a new research resource for complex physiologic signals. Circulation [Online]. 101 (23), pp. e215–e220

* Hess CW, Okun MS. Diagnosing Parkinson Disease. Continuum (Minneap Minn). 2016 Aug;22(4 Movement Disorders):1047-63. doi: 10.1212/CON.0000000000000345. PMID: 27495197.
