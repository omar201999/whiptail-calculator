# Standard and Programmer Calculator with Bash Script and Whiptail

This repository contains a Bash script that implements a standard and programmer calculator using the Whiptail tool. The script allows you to perform basic arithmetic operations and programmer calculations. It provides a user-friendly interface for input and error handling.

## Features

- **Standard Calculator:** Perform addition, subtraction, multiplication, and division with real numbers. The calculator handles invalid inputs and division by zero.

- **Programmer Calculator:** Convert numbers between binary, decimal, and hexadecimal representations. It also handles invalid inputs and provides error messages when needed.

## Prerequisites

- **Bash Shell:** The script is written in Bash, so you need a Bash-compatible shell to run it.

- **`bc` Utility:** The script uses the `bc` utility for performing calculations. Ensure that `bc` is installed on your system.

- **Whiptail:** The user interface is created using the `whiptail` tool, which should be available on most Unix-like systems.

## Usage

1. Clone the repository to your local machine:
   
   ```bash
   git clone https://github.com/omar201999/whiptail-calculator.git
2. Change directory to the cloned repository:
   
   ```bash
   cd whiptail-calculator
3. Set execute permission on your script using chmod command: 
   
   ```bash
   chmod +x calculator.sh
4. Run the script:
   ```bash
   bash calculator.sh
5. Use the Whiptail interface to perform calculations and conversions.
## Standard Calculator
- Choose "Standard Calculator" from the main menu.
- Enter the numbers you want to operate on, and select the operation (addition, subtraction, multiplication, or division).
- The calculator will display the result, or show an error message if there's a problem with the input or operation.

## Programmer Calculator
- Choose "Programmer Calculator" from the main menu.
- Select the desired conversion or operation (binary to decimal, decimal to binary, hexadecimal to decimal, or decimal to hexadecimal).
- Enter the number you want to convert or operate on.
- The calculator will display the result, or show an error message if there's a problem with the input.

## Demo

https://github.com/omar201999/whiptail-calculator/assets/46471716/53ea7e77-9599-4a37-90bb-64192fdf7acc

## Contributions
- Contributions to this project are welcome! If you find any issues or have ideas for improvements, please open an issue or submit a pull request.

## Acknowledgments
- The calculator script is created by Omar Essam, Laila Abdelkhalek, Mohamed Salah Fattouh, Ahmed Safwat, Mohamed Ahmed Mohamed. 
- This project is inspired by the need for a simple and accessible calculator tool in the command line.

   
