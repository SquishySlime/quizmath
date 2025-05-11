import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shared_preferences/shared_preferences.dart';

class QuizGeometriScreen extends StatefulWidget {
  const QuizGeometriScreen({super.key});

  @override
  State<QuizGeometriScreen> createState() => _QuizGeometriScreenState();
}

class _QuizGeometriScreenState extends State<QuizGeometriScreen> {
  Future<void> _saveProgress() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('progress_geometri', true);
  }
  late List<Map<String, dynamic>> _questions;
  int _current = 0;
  int _score = 0;
  String? _selected;
  bool _showResult = false;

  void _generateQuestions() {
    final rand = Random();
    _questions = List.generate(5, (index) {
      int tipe = rand.nextInt(5);
      switch (tipe) {
        case 0: // Luas persegi
          int sisi = rand.nextInt(15) + 2;
          return {
            'question': 'Hitung luas persegi dengan sisi $sisi cm',
            'choices': List.generate(4, (i) => '${(sisi + i - 1) * (sisi + i - 1)} cm²')..shuffle(),
            'answer': '${sisi * sisi} cm²',
          'explanation': 'Luas persegi = sisi × sisi = $sisi × $sisi = ${sisi * sisi} cm²',
          };
        case 1: // Volume balok
          int p = rand.nextInt(10) + 2;
          int l = rand.nextInt(10) + 2;
          int t = rand.nextInt(10) + 2;
          return {
            'question': 'Hitung volume balok dengan p=$p, l=$l, t=$t',
            'choices': List.generate(4, (i) => '${(p + i - 1) * (l + i - 1) * (t + i - 1)} cm³')..shuffle(),
            'answer': '${p * l * t} cm³',
          'explanation': 'Volume balok = panjang × lebar × tinggi = $p × $l × $t = ${p * l * t} cm³',
          };
        case 2: // Keliling lingkaran
          int r = rand.nextInt(10) + 2;
          int kel = (2 * 22 * r / 7).round();
          return {
            'question': 'Hitung keliling lingkaran dengan r = $r (π ≈ 22/7)',
            'choices': List.generate(4, (i) => '${kel + (i - 1) * 2} cm')..shuffle(),
            'answer': '$kel cm',
          'explanation': 'Keliling lingkaran = 2 × π × r ≈ 2 × 22/7 × $r = $kel cm',
          };
        case 3: // Teorema Pythagoras
          int a = rand.nextInt(10) + 3;
          int b = rand.nextInt(10) + 4;
          int c = sqrt(a * a + b * b).round();
          return {
            'question': 'Berapa panjang sisi miring segitiga siku-siku dengan a=$a, b=$b?',
            'choices': List.generate(4, (i) => '${c + i - 1}')..shuffle(),
            'answer': '$c',
          'explanation': 'Teorema Pythagoras: c = √(a² + b²) = √($a² + $b²) = $c',
          };
        case 4: // Volume bola
          int r = rand.nextInt(10) + 2;
          int vol = ((4 / 3) * 22 / 7 * r * r * r).round();
          return {
            'question': 'Hitung volume bola dengan r = $r (π ≈ 22/7)',
            'choices': List.generate(4, (i) => '${vol + (i - 1) * 10} cm³')..shuffle(),
            'answer': '$vol cm³',
          'explanation': 'Volume bola = 4/3 × π × r³ ≈ 4/3 × 22/7 × $r³ = $vol cm³',
          };
        default:
          return {
            'question': 'Hitung luas persegi dengan sisi 5 cm',
            'choices': ['25 cm²', '20 cm²', '10 cm²', '15 cm²']..shuffle(),
            'answer': '25 cm²',
          'explanation': 'Luas persegi = 5 × 5 = 25 cm²',
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
        appBar: AppBar(title: const Text('Latihan Geometri')),
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
                onPressed: _saveProgress,
                child: const Text('Simpan Progres'),
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
        appBar: AppBar(title: const Text('Latihan Geometri')),
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