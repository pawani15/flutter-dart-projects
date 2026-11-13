void main() {
  // For loop: Print 1 to 100
  for (int i = 1; i <= 100; i++) {
    print(i);
  }

  // Multiplication table
  int number = 5;

  for (int i = 1; i <= 10; i++) {
    print("$number x $i = ${number * i}");
  }

  // Factorial
  int n = 5;
  int factorial = 1;

  for (int i = 1; i <= n; i++) {
    factorial *= i;
  }

  print("Factorial: $factorial");

  // Even numbers from 1 to 50
  for (int i = 1; i <= 50; i++) {
    if (i % 2 == 0) {
      print(i);
    }
  }

  // Reverse a number using while
  int num = 12345;
  int reverse = 0;

  while (num > 0) {
    int digit = num % 10;
    reverse = reverse * 10 + digit;
    num ~/= 10;
  }

  print("Reversed number: $reverse");

  // Do-while loop
  int count = 1;

  do {
    print("Count: $count");
    count++;
  } while (count <= 5);
}