#!/bin/bash

# Prompt the user for the nomenclature
echo "What is the nomenclature for the last account that was created for the Location? example123@domain.edu:"
read nomenclature

# Output the user's input
echo "You entered: $nomenclature"

# Extract the base account name and the domain
base_name="${nomenclature%@*}"
domain="${nomenclature##*@}"

# Extract the numeric part from the base name
if [[ $base_name =~ ([0-9]+)$ ]]; then
    number="${BASH_REMATCH[1]}"
    start_number=$((number + 1))
    # Remove all leading numbers from base_name
    base_name="${base_name//[0-9]/}"
else
    start_number=1
fi

# Prompt the user for the number of accounts needed
echo "How many accounts are being requested?"
read num_accounts

# Define output CSV file
output_file="Account_Range.csv"

# Create or clear the output file
echo "Account Name" > "$output_file"

# Generate and output the accounts
for ((i=0; i<num_accounts; i++)); do
    # Create account name with incremented number
    account_name="${base_name}$((start_number + i))@$domain"
    
    # Append account name to the CSV file
    echo "$account_name" >> "$output_file"
done

echo "Account names exported to $output_file"

