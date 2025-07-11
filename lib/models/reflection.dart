class Reflection {
  final int id;
  final String date;
  final String question;
  final String answer;

  Reflection(
      {required this.id,
      required this.date,
      required this.question,
      required this.answer});

  factory Reflection.fromJson(Map<String, dynamic> json) {
    return Reflection(
        id: json['id'],
        date: json['date'],
        question: json['question'],
        answer: json['answer']);
  }
}
