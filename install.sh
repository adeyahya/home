#!/bin/bash

config_dir="./config"
home_config_dir="$(readlink -f ~/.config)"

if [ -e "$home_config_dir" ]; then
  echo "home config dir exist"
else
  echo "creating base dir $home_config_dir"
  mkdir -p "$home_config_dir"
fi

for item in "$config_dir"/*; do
  if [ -e "$item" ]; then
    absolute_path="$(readlink -f "$item")"
    item_dir_name="${item/$config_dir\//}"

    if [ -e "$home_config_dir/$item_dir_name" ]; then
      rm -rf "$home_config_dir/$item_dir_name"
    fi

    ln -s $absolute_path "$home_config_dir/$item_dir_name"
    echo "Created a symbolic link for $absolute_path into $home_config_dir/$item_dir_name"
  fi
done
