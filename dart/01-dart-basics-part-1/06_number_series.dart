void main() {
  // Fibonacci series
  int first = 0;
  int second = 1;

  print("Fibonacci Series:");

  for (int i = 0; i < 10; i++) {
    print(first);

    int next = first + second;
    first = second;
    second = next;
  }

  // Sum from 1 to N
  int n = 10;
  int sum = 0;

  for (int i = 1; i <= n; i++) {
    sum += i;
  }

  print("Sum from 1 to $n: $sum");

  // Sum of even numbers
  int evenSum = 0;

  for (int i = 2; i <= 10; i += 2) {
    evenSum += i;
  }

  print("Sum of even numbers: $evenSum");

  // Prime number check
  int number = 17;
  bool isPrime = number > 1;

  for (int i = 2; i * i <= number; i++) {
    if (number % i == 0) {
      isPrime = false;
      break;
    }
  }

  print(isPrime ? "Prime number" : "Not a prime number");

  // Number pattern
  for (int i = 1; i <= 5; i++) {
    String row = "";

    for (int j = 1; j <= i; j++) {
      row += "$j ";
    }

    print(row);
  }
}