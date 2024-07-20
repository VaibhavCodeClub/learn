class Questions {
  String question;
  List<String> options;
  String? image;
  int answer;

  Questions({
    required this.question,
    required this.options,
    required this.answer,
    this.image,
  });
}
