import 'package:flutter/material.dart';

class QuizPolaScreen extends StatefulWidget {
  const QuizPolaScreen({super.key});
  @override
  State<QuizPolaScreen> createState() => _QuizPolaScreenState();
}

class _QuizPolaScreenState extends State<QuizPolaScreen> {
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
  late List<Map<String, dynamic>> _questions;
  int _current = 0;
  int _score = 0;
  String? _selected;
  bool _showResult = false;

  @override
  void initState() {
    super.initState();
    _generateQuestions();
  }

  void _generateQuestions() {
    _questions = [
      {
        'question': 'Pola: 2, 4, 8, 16, ... Angka berikutnya adalah?',
        'choices': ['32', '20', '24', '18']..shuffle(),
        'answer': '32',
        'explanation': 'Pola: dikali 2 setiap langkah, 16×2=32',
      },
      {
        'question': 'Pola: 5, 10, 20, 40, ... Angka berikutnya adalah?',
        'choices': ['80', '60', '100', '70']..shuffle(),
        'answer': '80',
        'explanation': 'Pola: dikali 2 setiap langkah, 40×2=80',
      },
      {
        'question': 'Pola: 1, 4, 9, 16, ... Angka berikutnya adalah?',
        'choices': ['25', '20', '30', '36']..shuffle(),
        'answer': '25',
        'explanation': 'Pola: bilangan kuadrat, 5×5=25',
      },
      {
        'question': 'Pola: 7, 14, 21, 28, ... Angka berikutnya adalah?',
        'choices': ['35', '32', '36', '30']..shuffle(),
        'answer': '35',
        'explanation': 'Pola: tambah 7 setiap langkah, 28+7=35',
      },
      {
        'question': 'Pola: 3, 6, 12, 24, ... Angka berikutnya adalah?',
        'choices': ['48', '36', '30', '60']..shuffle(),
        'answer': '48',
        'explanation': 'Pola: dikali 2 setiap langkah, 24×2=48',
      },
    ];
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

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Latihan Pola Bilangan')),
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
                onPressed: () => Navigator.pushReplacementNamed(context, '/quiz_himpunan'),
                child: const Text('Lanjut ke Materi Selanjutnya'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali'),
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
      appBar: AppBar(title: const Text('Latihan Pola Bilangan')),
      body: Padding(
        padding: const EdgeInsets.all(24),
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
