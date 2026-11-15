
#!/bin/bash

# Function to count files in the current directory
count_files() {
    find . -maxdepth 1 -type f | wc -l
}

# Get the correct number of files
total_files=$(count_files)

# Welcome message
echo "Welcome to the Guessing Game!"
echo "How many files are in the current directory?"

# Ask the user for a guess
while true
do
    read -p "Enter your guess: " guess

    # Check whether the input is a number
    if ! [[ "$guess" =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid number."
    elif [ "$guess" -lt "$total_files" ]
    then
        echo "Your guess is too low. Try again!"
    elif [ "$guess" -gt "$total_files" ]
    then
        echo "Your guess is too high. Try again!"
    else
        echo "Congratulations! You guessed correctly!"
        echo "The number of files is $total_files."
        break
    fi
done
