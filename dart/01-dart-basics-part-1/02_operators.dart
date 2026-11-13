void main() {
  int a = 20;
  int b = 10;

  // Arithmetic operators
  print("Addition: ${a + b}");
  print("Subtraction: ${a - b}");
  print("Multiplication: ${a * b}");
  print("Division: ${a / b}");
  print("Remainder: ${a % b}");

  // Relational operators
  print("Equal: ${a == b}");
  print("Not Equal: ${a != b}");
  print("Greater: ${a > b}");
  print("Less: ${a < b}");

  // Logical operators
  print("AND: ${a > 10 && b < 20}");
  print("OR: ${a > 30 || b < 20}");
  print("NOT: ${!(a == b)}");

  // Assignment operator
  int number = 10;
  number += 5;

  print("Assignment result: $number");
}