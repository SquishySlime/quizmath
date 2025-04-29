import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  final void Function(ThemeMode) onThemeChanged;
  final ThemeMode currentThemeMode;

  const HomeScreen({Key? key, required this.onThemeChanged, required this.currentThemeMode}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Math Quiz'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 80,
                height: 80,
              ),
              const SizedBox(height: 30),
              Text(
                'Pilih Mode Permainan',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
              ),
              const SizedBox(height: 30),
              ModeButton(label: 'Normal', mode: 'normal'),
              const SizedBox(height: 16),
              ModeButton(label: 'Challenge', mode: 'challenge'),
              const SizedBox(height: 16),
              ModeButton(label: 'Arcade', mode: 'arcade'),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.leaderboard),
                label: const Text('Leaderboard'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
              ),
              // Pilihan Tema
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Tema: '),
                  DropdownButton<ThemeMode>(
                    value: widget.currentThemeMode,
                    items: const [
                      DropdownMenuItem(
                        value: ThemeMode.light,
                        child: Text('Light'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.dark,
                        child: Text('Dark'),
                      ),
                      DropdownMenuItem(
                        value: ThemeMode.system,
                        child: Text('System'),
                      ),
                    ],
                    onChanged: (mode) {
                      if (mode != null) {
                        widget.onThemeChanged(mode);
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ModeButton extends StatelessWidget {
  final String label;
  final String mode;

  const ModeButton({Key? key, required this.label, required this.mode})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
      ),
      onPressed: () {
        if (mode == 'normal') {
          // Jika memilih mode biasa, berikan pilihan tingkat kesulitan
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Pilih Tingkat Kesulitan'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => QuizScreen(mode: mode, difficulty: 'easy'),
                        ),
                      );
                    },
                    child: const Text('Mudah'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) =>
                                  QuizScreen(mode: mode, difficulty: 'medium'),
                        ),
                      );
                    },
                    child: const Text('Sedang'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => QuizScreen(mode: mode, difficulty: 'hard'),
                        ),
                      );
                    },
                    child: const Text('Sulit'),
                  ),
                ],
              );
            },
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => QuizScreen(mode: mode)),
          );
        }
      },
      child: Text(label),
    );
  }
}
