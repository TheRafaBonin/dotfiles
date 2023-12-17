# !/usr/bin/env bash

# Get the directory of the script
script_dir="$(dirname "$(readlink -f "$0")")"

# Specify the name of your .conf file
conf_file="conf"

# Construct the full path to the .conf file
file_path="$script_dir/$conf_file"

# Check if the file exists
if [ ! -f "$file_path" ]; then
    echo "Error: File not found: $file_path"
    exit 1
fi

# Iterate through each line in the file
while IFS= read -r line; do
    # Split the line into source and target
    source_file=$(echo "$line" | cut -d' ' -f1)
    target_file=$(echo "$line" | cut -d' ' -f2)

    # Remove the old target if it exists
    if [ -e "$target_file" ]; then
        rm "$HOME/$target_file"
        echo "Removed old target: $HOME/$target_file"
    fi

    # Create a new symlink from source to target
    ln -s "$HOME/dotfiles/$source_file" "$HOME/$target_file"
    echo "Created symlink: $HOME/dotfiles/$source_file -> $HOME/$target_file\n"

done < "$file_path"

echo "Symlink creation completed."

