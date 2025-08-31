#!/bin/bash

echo "Generating a unique UUID..."
UUID=$(uuidgen)
echo "Generated UUID: $UUID"
echo

echo "Importing the profile for UUID $UUID..."
dconf load /org/gnome/terminal/legacy/profiles:/:$UUID/ < "profiles/one_dark_profile.dconf"
if [ $? -eq 0 ]; then
  echo "Profile imported successfully!"
else
  echo "Error importing the profile. Please check the file one_dark_profile.dconf."
  exit 1
fi
echo

echo "Getting the current list of profiles..."
CURRENT_LIST=$(dconf read /org/gnome/terminal/legacy/profiles:/list)
if [ -z "$CURRENT_LIST" ]; then
  NEW_LIST="['$UUID']"
else
  NEW_LIST=$(echo $CURRENT_LIST | sed "s/]/, '$UUID']/")
fi
echo

echo "Updating the list of profiles with the new UUID..."
dconf write /org/gnome/terminal/legacy/profiles:/list "$NEW_LIST"
if [ $? -eq 0 ]; then
  echo "Profile list updated: $NEW_LIST"
else
  echo "Error updating the profile list."
  exit 1
fi
echo

echo "Setting UUID $UUID as the default profile..."
dconf write /org/gnome/terminal/legacy/profiles:/default "'$UUID'"
if [ $? -eq 0 ]; then
  echo "Profile $UUID set as default successfully!"
else
  echo "Error setting the default profile."
  exit 1
fi
echo

echo "Process completed! Restart GNOME Terminal to apply the changes."
