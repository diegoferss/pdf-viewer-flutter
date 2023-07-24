class Exam {
  final int id;
  final String name;
  final String date;
  final String outputFile;

  Exam(this.id, this.name, this.date, this.outputFile);

  Exam.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        name = map['name'],
        date = map['date'],
        outputFile = map['outputFile'];
}
