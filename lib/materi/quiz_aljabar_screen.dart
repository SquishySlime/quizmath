import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';
import 'learning_screen_geometri.dart';

class QuizAljabarScreen extends StatefulWidget {
  const QuizAljabarScreen({super.key});

  @override
  State<QuizAljabarScreen> createState() => _QuizAljabarScreenState();
}

class _QuizAljabarScreenState extends State<QuizAljabarScreen> {
  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('progress_aljabar', true);
  }

  void _goToNextMateri(BuildContext context) {
    Navigator.pop(context); // Tutup quiz
    Navigator.pop(context); // Tutup materi aljabar
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const GeometriScreen()),
    );
  }
  late List<Map<String, dynamic>> _questions;
  int _current = 0;
  int _score = 0;
  String? _selected;
  bool _showResult = false;

  void _generateQuestions() {
    final rand = Random();
    _questions = List.generate(5, (index) {
      int tipe = rand.nextInt(4);
      switch (tipe) {
        case 0: // Penjumlahan/pengurangan variabel
          int a = rand.nextInt(10) + 1;
          int b = rand.nextInt(10) + 1;
          return {
            'question': 'Sederhanakan: ${a}x + ${b}x = ...',
            'choices': List.generate(4, (i) => '${a + b + i - 1}x')..shuffle(),
            'answer': '${a + b}x',
          'explanation': 'Penjumlahan variabel: ${a}x + ${b}x = ${a + b}x',
          };
        case 1: // Persamaan linear
          int x = rand.nextInt(10) + 1;
          int c = rand.nextInt(10) + 1;
          return {
            'question': 'Jika x + $c = ${x + c}, maka x = ...',
            'choices': List.generate(4, (i) => '${x + i - 1}')..shuffle(),
            'answer': '$x',
          'explanation': 'Jika x + $c = ${x + c}, maka x = ${x + c} - $c = $x',
          };
        case 2: // Persamaan kuadrat sederhana
          int s1 = rand.nextInt(5) + 1;
          int s2 = rand.nextInt(5) + 1;
          int b = -(s1 + s2);
          int c = s1 * s2;
          return {
            'question': 'Akar-akar dari x² ${b >= 0 ? "+" : "-"} ${b.abs()}x + $c = 0 adalah ...',
            'choices': [
              '$s1 dan $s2',
              '$s2 dan $s1',
              '${s1 + 1} dan ${s2 + 1}',
              '${s1 - 1} dan ${s2 - 1}',
            ]..shuffle(),
            'answer': '$s1 dan $s2',
          'explanation': 'Akar-akar persamaan kuadrat x² ${b >= 0 ? '+' : '-'} ${b.abs()}x + $c = 0 adalah $s1 dan $s2',
          };
        case 3: // Pecahan aljabar sederhana
          int a = rand.nextInt(5) + 1;
          return {
            'question': 'Sederhanakan: ${(a * 2)}x / $a = ...',
            'choices': List.generate(4, (i) => '${2 + i}x')..shuffle(),
            'answer': '2x',
          'explanation': 'Sederhanakan: ${(a * 2)}x / $a = 2x',
          };
        default:
          return {
            'question': 'Sederhanakan: 2x + 3x = ...',
            'choices': ['5x', '6x', '4x', '3x']..shuffle(),
            'answer': '5x',
          'explanation': 'Penjumlahan: 2x + 3x = 5x',
          };
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _generateQuestions();
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
                      Text('Soal ${idx + 1} dari ${_questions.length}: ${q['question']}', style: const TextStyle(fontWeight: FontWeight.bold)),
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

  void _restart() {
    _generateQuestions();
    setState(() {
      _current = 0;
      _score = 0;
      _selected = null;
      _showResult = false;
    });
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

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Latihan Aljabar')),
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
    } else {
      final q = _questions[_current];
      return Scaffold(
        appBar: AppBar(title: const Text('Latihan Aljabar')),
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
}
