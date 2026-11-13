void main() {
  int number = 10;

  // Positive, negative or zero
  if (number > 0) {
    print("Positive number");
  } else if (number < 0) {
    print("Negative number");
  } else {
    print("Zero");
  }

  // Even or odd
  if (number % 2 == 0) {
    print("Even number");
  } else {
    print("Odd number");
  }

  // Largest of three numbers
  int a = 20;
  int b = 40;
  int c = 30;

  if (a >= b && a >= c) {
    print("Largest: $a");
  } else if (b >= a && b >= c) {
    print("Largest: $b");
  } else {
    print("Largest: $c");
  }

  // Switch calculator
  int x = 20;
  int y = 10;
  String operation = "+";

  switch (operation) {
    case "+":
      print("Addition: ${x + y}");
    case "-":
      print("Subtraction: ${x - y}");
    case "*":
      print("Multiplication: ${x * y}");
    case "/":
      if (y != 0) {
        print("Division: ${x / y}");
      } else {
        print("Cannot divide by zero");
      }
    default:
      print("Invalid operation");
  }
}