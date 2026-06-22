import 'package:flutter/material.dart';

void main() {
  runApp(const ZFrameApp());
}

class ZFrameApp extends StatelessWidget {
  const ZFrameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ZFrame',
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.deepPurple,
        scaffoldBackgroundColor: const Color(0xFF0F0F1E), // Fundo escuro premium
      ),
      home: const MainNavigationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;

  // Telas provisórias para cada pilar da ZFrame
  final List<Widget> _screens = [
    const Center(child: Text('🗪 Feed (Textos e Fotos - X/Instagram)', style: TextStyle(fontSize: 20))),
    const Center(child: Text('📺 ZTube (Vídeos dos Usuários)', style: TextStyle(fontSize: 20))),
    const Center(child: Text('🎵 ZMusic (Músicas e Podcasts)', style: TextStyle(fontSize: 20))),
    const Center(child: Text('🎬 ZCinema (Filmes e Séries)', style: TextStyle(fontSize: 20))),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ZFrame', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purpleAccent)),
        backgroundColor: const Color(0xFF16162A),
        elevation: 0,
        actions: [
          IconButton(icon: const Icon(Icons.notifications), onPressed: () {}),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF16162A),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_fill), label: 'Vídeos'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Música'),
          BottomNavigationBarItem(icon: Icon(Icons.movie_filter), label: 'Cinema'),
        ],
      ),
    );
  }
}
