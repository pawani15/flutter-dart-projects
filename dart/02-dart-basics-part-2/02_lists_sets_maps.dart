void main() {
  // LIST
  List<String> fruits = ["Apple", "Banana", "Orange"];

  print("Original List: $fruits");

  fruits.add("Mango");
  fruits.remove("Banana");

  print("Updated List: $fruits");
  print("First Fruit: ${fruits[0]}");

  // SET
  Set<int> numbers = {10, 20, 30, 20, 40};

  print("\nSet: $numbers");

  numbers.add(50);
  numbers.remove(10);

  print("Updated Set: $numbers");

  // MAP
  Map<String, dynamic> student = {
    "name": "Pawani",
    "age": 30,
    "course": "Flutter",
  };

  print("\nStudent Details:");

  print("Name: ${student["name"]}");
  print("Age: ${student["age"]}");
  print("Course: ${student["course"]}");

  student["city"] = "Bhubaneswar";
  student["age"] = 31;

  print("Updated Map: $student");

  // Loop through Map
  student.forEach((key, value) {
    print("$key: $value");
  });
}