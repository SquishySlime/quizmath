import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../data/question_generator.dart';
import '../models/question.dart';

class QuizScreen extends StatefulWidget {
  final String mode;
  final String? difficulty; // Tingkat kesulitan untuk mode biasa

  const QuizScreen({Key? key, required this.mode, this.difficulty})
    : super(key: key);

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Question> questions;
  int currentIndex = 0;
  int score = 0;
  final TextEditingController answerController = TextEditingController();
  bool quizFinished = false;
  String feedbackMessage = '';
  Color feedbackColor = Colors.white;
  bool showFeedback = false;
  bool challengeMode = false;
  bool arcadeMode = false;
  int timeLeft = 60;
  late int totalTime;
  late bool isTimerRunning;

  String? _userName;
  bool _scoreSaved = false;

  Future<void> _askUserNameAndSaveScore() async {
    if (_scoreSaved) return;
    String tempName = '';
    final name = await showDialog<String>(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Nama Anda'),
          content: TextField(
            autofocus: true,
            decoration: const InputDecoration(hintText: 'Masukkan nama'),
            onChanged: (value) => tempName = value,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(tempName),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
    if (name != null && name.isNotEmpty) {
      _userName = name;
      await _saveScore(name, score);
      setState(() {
        _scoreSaved = true;
      });
    }
  }

  Future<void> _saveScore(String name, int score) async {
    final prefs = await SharedPreferences.getInstance();
    final scoresData = prefs.getStringList('leaderboard') ?? [];
    scoresData.add('$name|$score');
    await prefs.setStringList('leaderboard', scoresData);
  }

  void _showExplanationsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Penjelasan Soal'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: questions.length,
              itemBuilder: (context, idx) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Soal ${idx + 1}: ${questions[idx].questionText}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text('Jawaban: ${questions[idx].correctAnswer}'),
                      const SizedBox(height: 4),
                      Text('Penjelasan: ${questions[idx].explanation}'),
                    ],
                  ),
                );
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Tutup'),
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Generate soal otomatis berdasarkan mode yang dipilih
    if (widget.mode == 'normal') {
      // Jika mode biasa, pilih soal berdasarkan tingkat kesulitan
      questions = generateQuestions(widget.difficulty ?? 'easy');
    } else if (widget.mode == 'arcade') {
      // Jika arcade mode, mulai dari soal mudah ke sulit
      questions =
          generateQuestions('easy') +
          generateQuestions('medium') +
          generateQuestions('hard');
    } else {
      // Challenge mode: Urutkan soal mulai dari mudah ke sulit
      challengeMode = widget.mode == 'challenge';
      arcadeMode = widget.mode == 'arcade';
      questions =
          generateQuestions('easy') +
          generateQuestions('medium') +
          generateQuestions('hard');
      questions.shuffle();
    }

    questions.shuffle();
    challengeMode = widget.mode == 'challenge';
    arcadeMode = widget.mode == 'arcade';

    if (challengeMode) {
      totalTime = 60; 
      timeLeft = totalTime;
      isTimerRunning = true;
      startTimer();
    } else {
      totalTime = 0;
      isTimerRunning = false;
    }
  }

  // Timer untuk Challenge Mode
  void startTimer() {
    if (isTimerRunning) {
      Future.delayed(const Duration(seconds: 1), () {
        if (mounted && timeLeft > 0) {
          setState(() {
            timeLeft--;
          });
          startTimer();
        } else if (timeLeft == 0) {
          // Waktu habis, selesai kuis
          setState(() {
            quizFinished = true;
            feedbackMessage = '❌ Waktu Habis!';
            feedbackColor = Colors.redAccent;
          });
        }
      });
    }
  }

  // Fungsi untuk melanjutkan ke soal berikutnya
  void nextQuestion() {
    final userAnswer = answerController.text.trim();

    if (userAnswer.isEmpty) {
      // Jika jawaban kosong, beri pesan peringatan
      setState(() {
        feedbackMessage = '❌ Jawaban tidak boleh kosong!';
        feedbackColor = Colors.orangeAccent;
      });
      return; // Jangan lanjutkan ke soal berikutnya jika jawaban kosong
    }

    final correctAnswer = questions[currentIndex].correctAnswer;

    setState(() {
      if (userAnswer == correctAnswer) {
        score++;
        feedbackMessage = '✅ Benar!';
        feedbackColor = Colors.greenAccent;
      } else {
        feedbackMessage = '❌ Salah. Jawaban: $correctAnswer';
        feedbackColor = Colors.redAccent;
      }

      showFeedback = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      if (!mounted) return;

      if (currentIndex < questions.length - 1) {
        setState(() {
          currentIndex++;
          answerController.clear();
          showFeedback = false;
        });

        if (challengeMode && timeLeft == 0) {
          setState(() {
            quizFinished = true;
          });
        }
      } else {
        setState(() {
          quizFinished = true;
        });
        Future.delayed(const Duration(milliseconds: 500), () {
          if (mounted) _askUserNameAndSaveScore();
        });
      }
    });
  }

  void resetQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
      quizFinished = false;
      answerController.clear();
      showFeedback = false;
      timeLeft = totalTime;
    });

    if (challengeMode) {
      startTimer();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          quizFinished
              ? 'Hasil Kuis'
              : 'Soal ${currentIndex + 1}/${questions.length}',
        ),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: quizFinished
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Kuis Selesai!',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Skor: $score/${questions.length}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    if (_userName != null && _userName!.isNotEmpty)
                      Text(
                        'Nama: _userName',
                        style: const TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                      ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: _showExplanationsDialog,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      child: const Text(
                        'Penjelasan Soal',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: resetQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 16,
                        ),
                      ),
                      child: const Text(
                        'Ulangi Kuis',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (challengeMode) ...[
                    Text(
                      'Waktu: $timeLeft detik',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                  // Tampilkan soal
                  Text(
                    questions[currentIndex].questionText,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: answerController,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      hintText: 'Masukkan jawaban... (angka saja)',
                      filled: true,
                      fillColor: Colors.grey[900],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: Colors.deepPurple),
                      ),
                    ),
                    style: const TextStyle(fontSize: 20),
                    enabled: !showFeedback,
                  ),
                  const SizedBox(height: 20),
                  if (showFeedback)
                    Center(
                      child: Text(
                        feedbackMessage,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: feedbackColor,
                        ),
                      ),
                    ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: showFeedback ? null : nextQuestion,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Lanjut',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
                ),
      ),
    );
  }
}
