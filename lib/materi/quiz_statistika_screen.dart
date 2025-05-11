import 'package:flutter/material.dart';

class QuizStatistikaScreen extends StatefulWidget {
  const QuizStatistikaScreen({super.key});
  @override
  State<QuizStatistikaScreen> createState() => _QuizStatistikaScreenState();
}

class _QuizStatistikaScreenState extends State<QuizStatistikaScreen> {
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
                      Text(
                        'Soal ${idx + 1} dari ${_questions.length}: ${q['question']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
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
        'question': 'Dari data 3, 5, 7, 7, 8, 9, 10, berapakah modusnya?',
        'choices': ['7', '8', '9', '10']..shuffle(),
        'answer': '7',
        'explanation': 'Modus adalah angka yang paling sering muncul, yaitu 7.',
      },
      {
        'question': 'Rata-rata dari 4, 6, 8, 10 adalah ...',
        'choices': ['7', '8', '9', '10']..shuffle(),
        'answer': '7',
        'explanation': 'Rata-rata = (4+6+8+10)/4 = 28/4 = 7.',
      },
      {
        'question': 'Dari data 2, 3, 5, 7, 8, 11, berapakah median?',
        'choices': ['6', '5', '7', '8']..shuffle(),
        'answer': '6',
        'explanation': 'Median adalah nilai tengah = (5+7)/2 = 6.',
      },
      {
        'question':
            'Jika 5 siswa memiliki nilai 8, 7, 6, 9, 10, berapakah rata-ratanya?',
        'choices': ['8', '7', '9', '10']..shuffle(),
        'answer': '8',
        'explanation': 'Rata-rata = (8+7+6+9+10)/5 = 40/5 = 8.',
      },
      {
        'question': 'Dari data 1, 2, 2, 3, 4, modusnya adalah ...',
        'choices': ['2', '3', '4', '1']..shuffle(),
        'answer': '2',
        'explanation': 'Modus adalah angka yang paling sering muncul, yaitu 2.',
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
      _selected = null;
      _showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showResult) {
      return Scaffold(
        appBar: AppBar(title: const Text('Latihan Statistika')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Skor Anda: $_score / ${_questions.length}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _restart,
                child: const Text('Ulangi Materi'),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/'),
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
      appBar: AppBar(title: const Text('Latihan Statistika')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Soal ${_current + 1} dari ${_questions.length}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
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
                    child: Text(
                      _current == _questions.length - 1
                          ? 'Selesai'
                          : 'Selanjutnya',
                    ),
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
