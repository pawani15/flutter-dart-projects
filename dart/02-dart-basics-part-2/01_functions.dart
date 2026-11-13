// Function without parameters
void greet() {
  print("Welcome to Dart Programming!");
}

// Function with parameters
void displayName(String name) {
  print("Hello, $name");
}

// Function with return type
int addNumbers(int a, int b) {
  return a + b;
}

// Function to calculate factorial
int factorial(int number) {
  int result = 1;

  for (int i = 1; i <= number; i++) {
    result *= i;
  }

  return result;
}

// Function with optional named parameter
void displayDetails({
  required String name,
  int age = 18,
}) {
  print("Name: $name");
  print("Age: $age");
}

void main() {
  greet();

  displayName("Pawani");

  int sum = addNumbers(10, 20);
  print("Sum: $sum");

  print("Factorial: ${factorial(5)}");

  displayDetails(name: "Pawani", age: 30);
}