#!/usr/bin/env bas

#Setting the argument to a directory variable

dir=$1

#Searching for subcategories

num_dirs=$(find $dir -type d | wc -l | xargs)
num_regular=$(find $dir -type f | wc -l | xargs)

echo "There were $num_dirs directories."
echo "There were $num_regular regular files."
