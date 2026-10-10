#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input.

read -p "Enter principal amount: " principal
read -p "Enter rate of interest: " rate
read -p "Enter time period (in years): " time

# Validate input
if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$rate" =~ ^[0-9]+([.][0-9]+)?$ ]] || ! [[ "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Error: Please enter valid numeric values."
  exit 1
fi

interest=$(awk -v p="$principal" -v r="$rate" -v t="$time" 'BEGIN { printf "%.2f", (p * r * t) / 100 }')
total=$(awk -v p="$principal" -v i="$interest" 'BEGIN { printf "%.2f", p + i }')

echo "Principal: $principal"
echo "Rate of interest: $rate%"
echo "Time: $time years"
echo "Simple Interest: $interest"
echo "Total Amount: $total"
