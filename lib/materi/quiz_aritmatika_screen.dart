import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'learning_screen_aljabar.dart';

class QuizAritmatikaScreen extends StatefulWidget {
  const QuizAritmatikaScreen({super.key});

  @override
  State<QuizAritmatikaScreen> createState() => _QuizAritmatikaScreenState();
}

class _QuizAritmatikaScreenState extends State<QuizAritmatikaScreen> {
  late List<Map<String, dynamic>> _questions;

  int _current = 0;
  int _score = 0;
  String? _selected;
  bool _showResult = false;

  Future<void> _saveProgress() async {
    // Simpan progres bahwa latihan aritmatika sudah selesai
    // Key: 'progress_aritmatika', Value: true
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('progress_aritmatika', true);
  }

  void _goToNextMateri(BuildContext context) {
    Navigator.pop(context); // Tutup quiz
    Navigator.pop(context); // Tutup materi aritmatika
    // Navigasi ke materi berikutnya (Aljabar)
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AljabarScreen()),
    );
  }

  void _next() {
    if (_selected == _questions[_current]['answer']) {
      _score++;
    }
    if (_current < _questions.length - 1) {
      setState(() {
        _current++;
        _selected = null;
      });
    } else {
      setState(() {
        _showResult = true;
      });
      _saveProgress();
    }
  }

  void _restart() {
    _generateQuestions();
    setState(() {
      _current = 0;
      _score = 0;
      _selected = null;
      _showResult = false;
    });
  }

  void _generateQuestions() {
    // Generate random questions for arithmetic (addition, subtraction, multiplication, division)
    final rand = List<Map<String, dynamic>>.from([
      ...List.generate(3, (_) {
        int a = 5 + (10 * (0.5 + 0.5 * (DateTime.now().microsecondsSinceEpoch % 1000) / 1000)).toInt();
        int b = 1 + (10 * (0.5 + 0.5 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000)).toInt();
        return {
          'question': 'Berapakah hasil dari $a + $b?',
          'choices': List.generate(4, (i) => (a + b + i - 1).toString())..shuffle(),
          'answer': (a + b).toString(),
          'explanation': 'Penjumlahan dua bilangan: $a + $b = ${a + b}',
        };
      }),
      ...List.generate(3, (_) {
        int a = 10 + (10 * (0.5 + 0.5 * (DateTime.now().microsecondsSinceEpoch % 1000) / 1000)).toInt();
        int b = 1 + (a - 1) % 10;
        return {
          'question': 'Berapakah hasil dari $a - $b?',
          'choices': List.generate(4, (i) => (a - b + i - 1).toString())..shuffle(),
          'answer': (a - b).toString(),
          'explanation': 'Pengurangan dua bilangan: $a - $b = ${a - b}',
        };
      }),
      ...List.generate(2, (_) {
        int a = 2 + (7 * (DateTime.now().microsecondsSinceEpoch % 1000) / 1000).toInt();
        int b = 2 + (7 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000).toInt();
        return {
          'question': 'Berapakah hasil dari $a × $b?',
          'choices': List.generate(4, (i) => (a * b + i - 1).toString())..shuffle(),
          'answer': (a * b).toString(),
          'explanation': 'Perkalian dua bilangan: $a × $b = ${a * b}',
        };
      }),
      ...List.generate(2, (_) {
        int b = 2 + (7 * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000).toInt();
        int c = 2 + (7 * (DateTime.now().microsecondsSinceEpoch % 1000) / 1000).toInt();
        int a = b * c;
        return {
          'question': 'Berapakah hasil dari $a ÷ $b?',
          'choices': List.generate(4, (i) => (a ~/ b + i - 1).toString())..shuffle(),
          'answer': (a ~/ b).toString(),
          'explanation': 'Pembagian: $a ÷ $b = ${a ~/ b}',
        };
      }),
    ]);
    rand.shuffle();
    _questions = rand.take(5).toList();
  }

  void _showPembahasanDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Pembahasan Soal'),
          content: SizedBox(
            width: double.maxFinite,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: _questions.length,
              itemBuilder: (context, idx) {
                final q = _questions[idx];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Soal ${idx + 1}: ${q['question']}', style: const TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 4),
                      Text('Jawaban: ${q['answer']}'),
                      const SizedBox(height: 4),
                      Text('Pembahasan: ${q['explanation']}'),
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
    _generateQuestions();
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Latihan Aritmatika')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Skor Anda: $_score / ${_questions.length}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _restart,
                child: const Text('Ulangi Materi'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => _goToNextMateri(context),
                child: const Text('Lanjut ke Materi Selanjutnya'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali ke Menu'),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                icon: const Icon(Icons.info_outline),
                onPressed: _showPembahasanDialog,
                label: const Text('Lihat Pembahasan'),
              ),
            ],
          ),
        ),
      );
    }
    final q = _questions[_current];
    return Scaffold(
      appBar: AppBar(title: const Text('Latihan Aritmatika')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Soal ${_current + 1} dari ${_questions.length}', style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            Text(q['question'], style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 24),
            ...List.generate(q['choices'].length, (i) {
              final c = q['choices'][i];
              return RadioListTile<String>(
                title: Text(c),
                value: c,
                groupValue: _selected,
                onChanged: (val) {
                  setState(() {
                    _selected = val;
                  });
                },
              );
            }),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _selected == null ? null : _next,
                    child: Text(_current == _questions.length - 1 ? 'Selesai' : 'Selanjutnya'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
