#!/bin/bash



# Check if the correct number of arguments is provided
if [ $# -ne 2 ]; then
    echo "Usage: $0 <search_string> <replace_string>"
    exit 1
fi

search_string="$1"
replace_string="$2"

# Find all files in the current directory and its subdirectories
find . -type f | while read file; do
  # Use sed to perform the substitution on each file
  sed -i "s/$search_string/$replace_string/g" "$file"
done

echo "Replacement completed."

cp ./* ~/.config
rm -r ~/.config/mozilla

echo "Finished"
