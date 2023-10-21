#!/bin/bash

calculate() {
  result=$(echo "$1" | bc -l 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "$result"
  else
    echo "Error"
  fi
}

programmer_calculate() {
  result=$(echo "$1" | bc -l 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "ibase=16; obase=10; $result" | bc
  else
    echo "Error"
  fi
}

while true; do
  operation=$(whiptail --title "Calculator" --menu "Choose an operation:" 15 50 6 \
    "1" "Standard Calculator" \
    "2" "Programmer Calculator" \
    "3" "Exit" 3>&1 1>&2 2>&3)

  case $operation in
    1)
      standard_operation=$(whiptail --title "Standard Calculator" --menu "Choose an operation:" 15 50 4 \
        "1" "Addition" \
        "2" "Subtraction" \
        "3" "Multiplication" \
        "4" "Division" 3>&1 1>&2 2>&3)

      case $standard_operation in
        1)
          num1=$(whiptail --title "Addition" --inputbox "Enter the first number:" 10 30 3>&1 1>&2 2>&3)
          num2=$(whiptail --title "Addition" --inputbox "Enter the second number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$num1" =~ ^-?[0-9]*(\.[0-9]+)?$ && "$num2" =~ ^-?[0-9]*(\.[0.9]+)?$ ]]; then
            result=$(calculate "$num1 + $num2")
            if [ "$result" != "Error" ]; then
              whiptail --title "Addition Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;
        2)
          num1=$(whiptail --title "Subtraction" --inputbox "Enter the first number:" 10 30 3>&1 1>&2 2>&3)
          num2=$(whiptail --title "Subtraction" --inputbox "Enter the second number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$num1" =~ ^-?[0-9]*(\.[0.9]+)?$ && "$num2" =~ ^-?[0-9]*(\.[0.9]+)?$ ]]; then
            result=$(calculate "$num1 - $num2")
            if [ "$result" != "Error" ]; then
              whiptail --title "Subtraction Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;
        3)
          num1=$(whiptail --title "Multiplication" --inputbox "Enter the first number:" 10 30 3>&1 1>&2 2>&3)
          num2=$(whiptail --title "Multiplication" --inputbox "Enter the second number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$num1" =~ ^-?[0-9]*(\.[0.9]+)?$ && "$num2" =~ ^-?[0-9]*(\.[0.9]+)?$ ]]; then
            result=$(calculate "$num1 * $num2")
            if [ "$result" != "Error" ]; then
              whiptail --title "Multiplication Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;
        4)
          num1=$(whiptail --title "Division" --inputbox "Enter the dividend:" 10 30 3>&1 1>&2 2>&3)
          num2=$(whiptail --title "Division" --inputbox "Enter the divisor:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$num1" =~ ^-?[0-9]*(\.[0.9]+)?$ && "$num2" =~ ^-?[0-9]*(\.[0.9]+)?$ && "$num2" != 0 ]]; then
            result=$(calculate "$num1 / $num2")
            if [ "$result" != "Error" ]; then
              whiptail --title "Division Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input or division by zero" 10 30
          fi
          ;;
        *)
          whiptail --title "Invalid Option" --msgbox "Invalid option. Please select a valid standard operation." 10 30
          ;;
      esac
      ;;

    2)
      programmer_operation=$(whiptail --title "Programmer Calculator" --menu "Choose an operation:" 15 50 5 \
        "1" "Binary to Decimal" \
        "2" "Decimal to Binary" \
        "3" "Hexadecimal to Decimal" \
        "4" "Decimal to Hexadecimal" \
        "5" "Back" 3>&1 1>&2 2>&3)
      
      case $programmer_operation in
	      1) # Binary to Decimal
          binary_number=$(whiptail --title "Binary to Decimal" --inputbox "Enter a binary number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$binary_number" =~ ^[01]+$ ]]; then
            result=$(programmer_calculate "ibase=2; $binary_number")
            if [ "$result" != "Error" ]; then
              whiptail --title "Binary to Decimal Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;

        2) # Decimal to Binary
          decimal_number=$(whiptail --title "Decimal to Binary" --inputbox "Enter a decimal number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$decimal_number" =~ ^[0-9]+$ ]]; then
            result=$(programmer_calculate "obase=2; $decimal_number")
            if [ "$result" != "Error" ]; then
              whiptail --title "Decimal to Binary Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;

        3) # Hexadecimal to Decimal
          hex_number=$(whiptail --title "Hexadecimal to Decimal" --inputbox "Enter a hexadecimal number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$hex_number" =~ ^[0-9A-Fa-f]+$ ]]; then
            result=$(programmer_calculate "ibase=16; $hex_number")
            if [ "$result" != "Error" ]; then
              whiptail --title "Hexadecimal to Decimal Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;

        4) # Decimal to Hexadecimal
          decimal_number=$(whiptail --title "Decimal to Hexadecimal" --inputbox "Enter a decimal number:" 10 30 3>&1 1>&2 2>&3)
          if [[ "$decimal_number" =~ ^[0-9]+$ ]]; then
            result=$(programmer_calculate "obase=16; $decimal_number")
            if [ "$result" != "Error" ]; then
              whiptail --title "Decimal to Hexadecimal Result" --msgbox "Result: $result" 10 30
            else
              whiptail --title "Error" --msgbox "Invalid input" 10 30
            fi
          else
            whiptail --title "Error" --msgbox "Invalid input" 10 30
          fi
          ;;

        *)
          whiptail --title "Invalid Option" --msgbox "Invalid option. Please select a valid programmer operation." 10 30
          ;;
      esac
      ;;

    3) # Exit
      exit 0
      ;;

    *)
      whiptail --title "Invalid Option" --msgbox "Invalid option. Please select a valid operation." 10 30
      ;;
  esac
done
