import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../materi/learning_screen_aritmatika.dart';
import '../materi/learning_screen_aljabar.dart';
import '../materi/learning_screen_geometri.dart';
import '../materi/learning_screen_statistika.dart';
import '../materi/learning_screen_pecahan.dart';
import '../materi/learning_screen_persen.dart';
import '../materi/learning_screen_pangkat.dart';
import '../materi/learning_screen_barisan.dart';
import '../materi/learning_screen_himpunan.dart';
import '../materi/learning_screen_pola.dart';


class LearningScreen extends StatefulWidget {
  const LearningScreen({super.key});

  @override
  State<LearningScreen> createState() => _LearningScreenState();
}

class _LearningScreenState extends State<LearningScreen> {
  bool doneAritmatika = false;
  bool doneAljabar = false;
  bool doneGeometri = false;

  @override
  void initState() {
    super.initState();
    _loadProgress();
  }

  Future<void> _loadProgress() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      doneAritmatika = prefs.getBool('progress_aritmatika') ?? false;
      doneAljabar = prefs.getBool('progress_aljabar') ?? false;
      doneGeometri = prefs.getBool('progress_geometri') ?? false;
    });
  }

  void _showRepeatOrNextDialog({
    required BuildContext context,
    required String materi,
    required VoidCallback onRepeat,
    required VoidCallback onNext,
  }) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Materi $materi sudah selesai'),
        content: const Text('Apakah Anda ingin mengulangi materi atau lanjut ke materi berikutnya?'),
        actions: [
          TextButton(onPressed: () { Navigator.pop(ctx); onRepeat(); }, child: const Text('Ulangi')),
          TextButton(onPressed: () { Navigator.pop(ctx); onNext(); }, child: const Text('Lanjut')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Belajar Matematika'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.calculate),
            title: const Text('Aritmatika Dasar'),
            subtitle: const Text('Penjumlahan, pengurangan, perkalian, pembagian'),
            trailing: doneAritmatika ? const Icon(Icons.check_circle, color: Colors.green) : null,
            onTap: () {
              if (doneAritmatika) {
                _showRepeatOrNextDialog(
                  context: context,
                  materi: 'Aritmatika',
                  onRepeat: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AritmatikaScreen()),
                    );
                  },
                  onNext: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const LearningScreenPecahan()),
                    );
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AritmatikaScreen()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.pie_chart),
            title: const Text('Pecahan & Desimal'),
            subtitle: const Text('Operasi pecahan, desimal, konversi persen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenPecahan()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.percent),
            title: const Text('Persen & Perbandingan'),
            subtitle: const Text('Persen, diskon, perbandingan dua besaran'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenPersen()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.analytics),
            title: const Text('Statistika Dasar'),
            subtitle: const Text('Rata-rata, median, modus, grafik/tabel'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenStatistika()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.exposure),
            title: const Text('Pangkat & Akar'),
            subtitle: const Text('Kuadrat, kubik, akar kuadrat, operasi pangkat'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenPangkat()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.format_list_numbered),
            title: const Text('Barisan & Deret'),
            subtitle: const Text('Barisan aritmatika/geometri, deret, suku ke-n'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenBarisan()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.auto_awesome),
            title: const Text('Pola Bilangan'),
            subtitle: const Text('Melanjutkan pola, menemukan aturan pola'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenPola()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.bubble_chart),
            title: const Text('Himpunan & Logika'),
            subtitle: const Text('Operasi himpunan, diagram Venn, logika dasar'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LearningScreenHimpunan()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.functions),
            title: const Text('Aljabar'),
            subtitle: const Text('Variabel, persamaan, operasi aljabar'),
            trailing: doneAljabar ? const Icon(Icons.check_circle, color: Colors.green) : null,
            onTap: () {
              if (doneAljabar) {
                _showRepeatOrNextDialog(
                  context: context,
                  materi: 'Aljabar',
                  onRepeat: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const AljabarScreen()),
                    );
                  },
                  onNext: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GeometriScreen()),
                    );
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AljabarScreen()),
                );
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.square_foot),
            title: const Text('Geometri'),
            subtitle: const Text('Bangun datar, bangun ruang, keliling, luas, volume'),
            trailing: doneGeometri ? const Icon(Icons.check_circle, color: Colors.green) : null,
            onTap: () {
              if (doneGeometri) {
                _showRepeatOrNextDialog(
                  context: context,
                  materi: 'Geometri',
                  onRepeat: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const GeometriScreen()),
                    );
                  },
                  onNext: () {
                    // Materi berikutnya setelah Geometri jika ada
                  },
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const GeometriScreen()),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
