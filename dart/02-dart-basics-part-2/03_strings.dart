void main() {
  String name = "Pawani Dora";

  // String length
  print("Length: ${name.length}");

  // Uppercase and lowercase
  print("Uppercase: ${name.toUpperCase()}");
  print("Lowercase: ${name.toLowerCase()}");

  // Check string content
  print("Contains Pawani: ${name.contains("Pawani")}");

  // Replace text
  print("Replace: ${name.replaceAll("Dora", "Developer")}");

  // Split string
  List<String> words = name.split(" ");
  print("Split: $words");

  // Substring
  print("Substring: ${name.substring(0, 6)}");

  // Remove extra spaces
  String message = "  Welcome to Flutter  ";
  print("Trimmed: '${message.trim()}'");

  // Reverse a string
  String reversed = name.split("").reversed.join();

  print("Reversed: $reversed");
}