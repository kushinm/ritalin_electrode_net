# ritalin_electrode_net

Code and materials for electrode analysis of effects of Ritalin on dorsal medial PFC and Striatum

## Data

Download the electrode data from : https://uwmadison.box.com/s/cnof562um9q1lf7f8n6kpcmj40ep0u9k  

Place the files in the `/data` directory

## Analysis TODOs: 

### Single Electrode Analysis:
- [ ] Tune elastic net parameter and see its effect on cross validated accuracy
- [ ] Plot model coefficients from our best models for each rat 

### Multiple Electrode Analysis:
- [ ] Tune elastic net parameter and see its effect on cross validated accuracy
- [ ] Plot model coefficients from our best models for each rat 
- [ ] For each rat fit models for 'time windows' for each electrode and repeat the above two steps.
- [ ] Fold in dmSTR data

## Tim's to-do notes:

(1) As reality check / proof of concept, train elastic net on single best electrode data to predict baseline/drug condition. 
DONE:
 
LASSO and ridge models trained with successful prediction on ~5 / 8 individual animals

Ridge models trained using all PFC electrodes with comparable, slightly worse results
 
TO DO:
 
For single-best-electrode data, fully tune alpha parameter in elastic net to get best-possible-result
 
Run same procedure on each individual electrode, get best-possible-hold-out-error for each electrode in each animal

Can then evaluate (a) best possible decoding from a single PFC electrode, (b) how performance varies across electrodes and (c) what points in time are selected for each electrode

(2) Train elastic net to discriminate true drug condition from sham (saline) condition using same approach above.
 
First we need to get this data from Rob
 
Then try to discriminate conditions using best electrode and properly tuned elastic net
 
Then for each electrode
 
Then for all electrodes
 
DEPENDING ON RESULTS can look at classifying using both baseline and second-test data for each animal

