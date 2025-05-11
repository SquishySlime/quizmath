import 'package:flutter/material.dart';
import 'quiz_screen.dart';

class HomeScreen extends StatefulWidget {
  final void Function(ThemeMode) onThemeChanged;
  final ThemeMode currentThemeMode;

  const HomeScreen({super.key, required this.onThemeChanged, required this.currentThemeMode});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn Math'), centerTitle: true),
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
                'Selamat Datang di LearnMath',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Theme.of(context).brightness == Brightness.light ? Colors.black : Colors.white),
              ),
              const SizedBox(height: 30),
              ElevatedButton.icon(
                icon: const Icon(Icons.school),
                label: const Text('Belajar'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                onPressed: () => Navigator.pushNamed(context, '/learning'),
              ),
              const SizedBox(height: 16),
              // Quiz dengan pemilihan tingkat kesulitan
              ElevatedButton.icon(
                icon: const Icon(Icons.quiz),
                label: const Text('Quiz'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                onPressed: () async {
                  final difficulty = await showDialog<String>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Pilih Tingkat Kesulitan'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              title: const Text('Mudah'),
                              onTap: () => Navigator.pop(context, 'easy'),
                            ),
                            ListTile(
                              title: const Text('Normal'),
                              onTap: () => Navigator.pop(context, 'medium'),
                            ),
                            ListTile(
                              title: const Text('Sulit'),
                              onTap: () => Navigator.pop(context, 'hard'),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                  if (!mounted) return;
                  if (difficulty != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => QuizScreen(mode: 'normal', difficulty: difficulty),
                      ),
                    );
                  }
                },
              ),
              const SizedBox(height: 24),
              // Challenge Mode
              ElevatedButton.icon(
                icon: const Icon(Icons.flash_on),
                label: const Text('Challenge'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48), backgroundColor: Colors.redAccent),
                onPressed: () {
                  final ctx = context;
                  Navigator.push(
                    ctx,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(mode: 'challenge'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 12),
              // Arcade Mode
              ElevatedButton.icon(
                icon: const Icon(Icons.sports_esports),
                label: const Text('Arcade'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48), backgroundColor: Colors.green),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => QuizScreen(mode: 'arcade'),
                    ),
                  );
                },
              ),
              const SizedBox(height: 32),
              ElevatedButton.icon(
                icon: const Icon(Icons.leaderboard),
                label: const Text('Leaderboard'),
                style: ElevatedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                onPressed: () => Navigator.pushNamed(context, '/leaderboard'),
              ),
              const SizedBox(height: 32),
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

