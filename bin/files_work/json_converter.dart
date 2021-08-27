import 'dart:convert';
import 'dart:io';

class Student {
  final String name;
  int age;
  int? course;
  bool single;
  final List<String> description;

  Student(
      {required this.name,
      required this.age,
      this.course,
      required this.single})
      : description = [];

  Student.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'],
        course = json['course'],
        single = json['single'],
        description = <String>[...json['description']];

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'age': age,
      'course': course,
      'single': single,
      'description': description
    };
  }

  @override
  String toString() {
    var student = 'Студент {имя: $name, возраст: $age, ';
    student += 'курс: $course, холост: $single, ';
    student += 'описание: $description}';
    return student;
  }
}

void main() {
  var student = Student(name: 'Ivan', age: 16, single: true);
  student.description.addAll(['Cool guy', 'Geek', 'Big dick']);
  var encoder = const JsonEncoder.withIndent('  ');
  var file = File('assets/student.json');

  print(student);

  var convertedContent = encoder.convert(student);
  file.writeAsStringSync(convertedContent);
  print(file.readAsStringSync());

  var anotherStudent = Student.fromJson(jsonDecode(file.readAsStringSync()));
  print(anotherStudent);
}
