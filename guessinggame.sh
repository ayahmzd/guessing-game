#!/usr/bin/env bash
# The Guessing Game
# Guess how many regular files are in the current directory.

count_files() {
    find . -maxdepth 1 -type f | wc -l | tr -d ' '
}

play_game() {
    local actual_count
    local guess

    actual_count=$(count_files)
    echo "Welcome to The Guessing Game!"
    echo "How many files are in the current directory?"

    while true; do
        read -r -p "Your guess: " guess

        if [[ ! "$guess" =~ ^[0-9]+$ ]]; then
            echo "Please enter a valid non-negative whole number."
        elif (( guess < actual_count )); then
            echo "Too low. Try again."
        elif (( guess > actual_count )); then
            echo "Too high. Try again."
        else
            echo "Congratulations! You guessed the correct number."
            break
        fi
    done
}

play_game
