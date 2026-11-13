// Class definition
class Student {
  String name;
  int age;
  String course;

  // Constructor
  Student({
    required this.name,
    required this.age,
    required this.course,
  });

  // Method
  void displayDetails() {
    print("Student Name: $name");
    print("Student Age: $age");
    print("Course: $course");
  }

  void study() {
    print("$name is studying $course");
  }
}

void main() {
  // Creating objects
  Student student1 = Student(
    name: "Pawani",
    age: 30,
    course: "Flutter",
  );

  Student student2 = Student(
    name: "Rahul",
    age: 25,
    course: "Dart",
  );

  // Calling methods
  student1.displayDetails();
  student1.study();

  print("----------------");

  student2.displayDetails();
  student2.study();
}