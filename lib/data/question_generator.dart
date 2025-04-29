import '../models/question.dart';
import 'dart:math';

List<Question> generateQuestions(String difficulty, {int total = 10}) {
  final random = Random();
  List<Question> generatedQuestions = [];

  for (int i = 0; i < total; i++) {
    int a, b;
    String questionText;
    String correctAnswer;

    String explanation;
    if (difficulty == 'easy') {
      // Soal tingkat mudah (tambah dan kurang)
      a = random.nextInt(10) + 1; // 1 - 10
      b = random.nextInt(10) + 1;
      questionText = '$a + $b = ?';
      correctAnswer = (a + b).toString();
      explanation = '$a + $b = ${a + b}';
    } else if (difficulty == 'medium') {
      // Soal tingkat sedang (perkalian dan pembagian)
      a = random.nextInt(50) + 1;
      b = random.nextInt(10) + 1;
      if (random.nextBool()) {
        questionText = '$a × $b = ?';
        correctAnswer = (a * b).toString();
        explanation = '$a × $b = ${a * b}';
      } else {
        int product = a * b;
        questionText = '$product ÷ $a = ?';
        correctAnswer = b.toString();
        explanation = '$product ÷ $a = $b';
      }
    } else {
      // hard
      // Soal tingkat sulit (persamaan dan pangkat)
      a = random.nextInt(100) + 1;
      b = random.nextInt(50) + 1;
      if (random.nextBool()) {
        questionText = 'Jika x + $b = $a, berapa x?';
        correctAnswer = (a - b).toString();
        explanation = 'x + $b = $a → x = $a - $b = ${a - b}';
      } else {
        int power = random.nextInt(4) + 2; // pangkat 2-5
        questionText = 'Berapa hasil $a ÷ $power?';
        correctAnswer = (a ~/ power).toString(); // integer division
        explanation = '$a ÷ $power = ${a ~/ power}';
      }
    }

    generatedQuestions.add(
      Question(questionText: questionText, correctAnswer: correctAnswer, explanation: explanation),
    );
  }

  return generatedQuestions;
}
