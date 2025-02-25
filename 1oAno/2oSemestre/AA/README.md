# Predicting the Number of Ended Trips by Station in a Bike-Sharing System

## Abstract
Bike-sharing systems (BSS) are ever growing and becoming more popular by the day. Consequently, managing one is becoming more and more complex. From identifying possible problems with the bicycles, to redistribute them to their respective stations and place, from understanding the traffic flow to predict the hours of more affluence, the job of an operator of a system like this is even more difficult. The purpose of this paper is to facilitate the work of an operator, by building a predictive system based on stations and hours of a day. As such, it will be discussed different methods and compared different results, to reach a final solution. 

## Introduction
BSS typically operates through a network of docking stations strategically located throughout a city. These stations serve as pick-up and drop-off points for bicycles, and users can rent a bicycle from one station and return it to any other station within the system predisposed area. 

The main challenges these systems have are the possible vandalism, stealing or any other malicious intent towards the bicycle; redistributing the bicycles into all stations, and knowing which stations should the bicycles be going to; and, finally, their operating system, which needs to respond in real time to any type of alerts and problems the system and any bicycle can have.

In order to try to ease the work done by any operator and the redistribution management, there is a need to build predictive systems, which will give a rough estimate of which stations should be delivered more bicycles, at each given hour.

The prediction system built and analyzed will predict the number of bicycles that will end a trip in a given hour, for a given station, and therefore any operator should be able to understand, based on these results, to which station the redistribution team should deliver all their bikes.

## Solution
The solution was to create different models based on Linear Regression and Long-Short Term Memory layer, as well as different K-Fold Cross Validation split variations.
As such there were created three different solution models:

### Stations Based Model
This model was created by dividing 40 stations into two different clusters, using one cluster to train, test and validate the model using K-Fold Cross Validation.

### Time Based Model
This model was created by dividing the time span of our dataset, one year, using the data to train, test and validate the model using K-Fold Cross Validation.

### Normal Based Model
This model was created by dividing the dataset using the data to train, test and validate the model using K-Fold Cross Validation with the default split, without shuffle.

## Repository
In this repository, there are eight different folders:
- CSVFiles: the main datasets, and their variations
- DatasetSTM: main file to evaluate periodicity and create the final dataset
- Regression: Contains the main files for the Linear Regression Models
- LSTM: Contains the main files for the Long-Short Term Memory Models
- FinalMModels: Contains the chosen models out of all of the ones created
- DateDatasets, StationDateDatasets, StationsDatasets: datasets used for the Long-Short Term Memory Models

There is also the requirements file which should be installed before running any file:
```
$ pip install -r requirements
``` 

Finally, there is the paper for this project under the name of: "Predicting_the_Number_of_Ended_Trips_by_Station_in_a_BikeSharing_System.pdf"

## Made By
Filipe Gonçalves, 98083

## Acknowledgements
Pétia Georgieva, Professor

Diogo Macedo de Sousa, with his thesis: "Decision Support Service for Bewegen Bike-Sharing Systems"
