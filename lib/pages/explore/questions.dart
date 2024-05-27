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

List<Questions> ques = [
  Questions(
    question: "How many Orange Cars are there?",
    options: ["5", "6", "1", "2"],
    image: "assets/quiz/q1.jpg",
    answer: 3, // Index of the correct option, in this case, "Paris"
  ),
  Questions(
    question: "Count the Pokemons.",
    image: "assets/quiz/q2.jpg",

    options: ["11", "9", "10", "8"],
    answer: 2, // Index of the correct option, in this case, "Au"
  ),
  Questions(
    question: "1,2,_,4,5",
    options: ["5", "3", "6", "4"],
    answer: 1, // Index of the correct option, in this case, "105"
  ),
  Questions(
    question: "10,20_,40,50",
    options: ["60", "20", "30", "70"],
    answer: 2, // Index of the correct option, in this case, "Dart"
  ),
  Questions(
    question: "Count Yellow Bears.",
    image: "assets/quiz/q5.jpg",
    options: ["2", "3", "4", "5"],
    answer: 1, // Index of the correct option, in this case, "1492"
  ),
  Questions(
    question: "Count the Number of Balls",
    image: "assets/quiz/q6.jpg",
    options: ["5", "6", "4", "7"],
    answer: 0, // Index of the correct option, in this case, "1492"
  ),
  Questions(
    question: "Count Hearts",
    image: "assets/quiz/q7.jpg",
    options: ["10", "6", "9", "7"],
    answer: 3, // Index of the correct option, in this case, "1492"
  ),
  Questions(
    question: "Count Buckets",
    image: "assets/quiz/q9.jpg",
    options: ["1", "2", "3", "4"],
    answer: 0, // Index of the correct option, in this case, "1492"
  ),
  Questions(
    question: "Count the pencils",
    image: "assets/quiz/q10.jpg",
    options: ["10", "12", "13", "11"],
    answer: 2, // Index of the correct option, in this case, "1492"
  ),
];
