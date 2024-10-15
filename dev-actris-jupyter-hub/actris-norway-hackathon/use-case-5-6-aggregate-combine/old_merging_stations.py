# Importing useful python libraries
import xarray as xr 
import threddsclient
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np 
import datetime
import os

# Get the EBAS thredds catalog
all_opendap_urls = threddsclient.opendap_urls('https://thredds.nilu.no/thredds/catalog/ebas/catalog.html')

opendap_urls = [x for x in all_opendap_urls if 'NO0002' in x]
inst_opendap_urls = [x for x in opendap_urls if 'nephelometer' in x]

# Get the list of all the files
# Create an empty list to store the datasets
datasets = []

# Loop through each URL and open the dataset
for url in inst_opendap_urls:
    ds = xr.open_dataset(url)
    # Append the dataset to the list
    datasets.append(ds)

datasets[0].dims
