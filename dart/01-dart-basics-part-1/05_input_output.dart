import 'dart:io';

void main() {
  stdout.write("Enter your name: ");
  String name = stdin.readLineSync() ?? "";

  stdout.write("Enter your age: ");
  int age = int.parse(stdin.readLineSync() ?? "0");

  stdout.write("Enter first number: ");
  double num1 = double.parse(stdin.readLineSync() ?? "0");

  stdout.write("Enter second number: ");
  double num2 = double.parse(stdin.readLineSync() ?? "0");

  print("\n----- User Details -----");
  print("Name: $name");
  print("Age: $age");

  print("\n----- Calculation -----");
  print("Addition: ${num1 + num2}");
  print("Subtraction: ${num1 - num2}");
  print("Multiplication: ${num1 * num2}");

  if (num2 != 0) {
    print("Division: ${num1 / num2}");
  } else {
    print("Division by zero is not allowed");
  }
}