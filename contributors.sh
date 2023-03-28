#!/bin/bash

# Set the path to the repository
REPO_PATH="/home/dvoid/Documents/alx/dvoid/EricPrintf"

# Change into the repository directory
cd $REPO_PATH

# Get a list of all contributors and their commit counts
git shortlog -sne --all > contributors.txt

# Calculate the total number of commits
TOTAL_COMMITS=$(git rev-list --count HEAD)

# Loop through the list of contributors and calculate their percentage of commits
while read -r LINE; do
  # Extract the name and commit count from the line
  NAME=$(echo $LINE | awk '{print $2 " " $3}')
  COUNT=$(echo $LINE | awk '{print $1}')
  
  # Calculate the percentage of commits
  PERCENT=$(echo "scale=2; $COUNT / $TOTAL_COMMITS * 100" | bc)
  
  # Print the results
  echo "$NAME: $PERCENT%"
done <contributors.txt

# Clean up the temporary file
rm contributors.txt
