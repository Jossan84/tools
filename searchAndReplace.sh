#searchAndReplace.sh
#15/09/2022

#Example of a find and replace word using vim editor

#1. Find files that contain 'word'
# Notes:
# -	word is the search "pattern" sandwiched between two forward slashes
# - The **/* says to search in all files recursively
# - The g flag says to search for all occurrences in each line (this is actually overkill here, but it does not hurt either)
# - The j flag prevents vim from automatically jumping to the first match
:vimgrep /word/gj **/*

#2. View quick fix list
:copen

#3. Substitute within all files that contain 'word'
# Notes:
# The % is a line range that specifies every line
# The g flag says to substitute all occurrences in each line
# The c flag causes vim to ask you to confirm each replacement individually (you might want to leave this out)
:cfdo %s/word/new_word/gc | update