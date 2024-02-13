#!/usr/bin/env bash

: '
Author: Ryan Cool
Date: 2024-02-13

Script to create symlinks for files/directories found in dotfiles repo
'

# Sets directory script is in to dotfile directory
df_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Set directory for old files to be copied to, if they exist
df_backup="/home/$USER/dotfiles_backup"

# Reads files in df_dir to an array, including the ones that match the grep arguments
readarray -t dot_files < <(find "$df_dir" -mindepth 1 -maxdepth 1 -printf '%P\n' | grep -E "tmux|newsboat|^bash")
readarray -t config_files < <(find "$df_dir" -mindepth 1 -maxdepth 1 -printf '%P\n' | grep -E "nvim|alacritty")


# Creates backup folder for existing files, if folder doesn't exist already
create_backup() {
    printf "\nCreating folder for backup of any existing dotfiles in %s\n" "$df_backup"
    if [[ -e "$df_backup" ]]; then
        printf "\n%s already exists, moving on...\n" "$df_backup"
    else
        mkdir -p "$df_backup"
        printf "\nBackup directory created at: %s\n" "$df_backup"
    fi
}

# Moves files to df_backup directory, if they exist already
move_backup() {
    for dot_file in "${dot_files[@]}"; do
        if [[ -e "/home/$USER/.$dot_file" ]]; then
            mv "/home/$USER/.$dot_file" "$df_backup/"
        else
            printf "%s directory/file doesn't exist" "$dot_file"
        fi
    done
    for config_file in "${config_files[@]}"; do
        if [[ -e "/home/$USER/.config/$config_file" ]]; then
            mv "/home/$USER/.config/$config_file" "$df_backup/"
        else
            printf "%s directory/file doesn't exist" "$config_file"
        fi
    done
}

# Creates symlinks for the files found in both dot_files and config_files array
create_links() {
    printf "\nCreating links for:\n"
    printf " - %s \n" "${dot_files[@]}"
    for dot_file in "${dot_files[@]}"; do
        ln -snf "$(readlink -f "$dot_file")" "/home/$USER/.$dot_file"
    done
    printf "\nCreating links for:\n"
    printf " - %s \n" "${config_files[@]}"
    for config_file in "${config_files[@]}"; do
        ln -snf "$(readlink -f "$config_file")" "/home/$USER/.config/$config_file"
    done
}

main() {
    create_backup
    move_backup
    create_links
}

main
