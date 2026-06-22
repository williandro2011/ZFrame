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
        scaffoldBackgroundColor: const Color(0xFF0F0F1E),
        colorScheme: const ColorScheme.dark(primary: Colors.purpleAccent),
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

  final List<Widget> _screens = [
    const FeedScreen(),
    const VideoScreen(),
    const MusicScreen(),
    const CinemaScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Z FRAME', 
          style: TextStyle(fontWeight: FontWeight.black, letterSpacing: 2, color: Colors.purpleAccent)),
        backgroundColor: const Color(0xFF16162A),
        actions: [
          IconButton(icon: const Icon(Icons.add_box_outlined), onPressed: () {}),
          IconButton(icon: const Icon(Icons.send_rounded), onPressed: () {}),
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF16162A),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Feed'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: 'Z-Tube'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Música'),
          BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Cinema'),
        ],
      ),
    );
  }
}

// --- 1. TELA DE FEED (ESTILO INSTAGRAM/X) ---
class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: const CircleAvatar(backgroundColor: Colors.purple),
              title: Text('Usuário Z_$index'),
              subtitle: const Text('Localização ou Status'),
              trailing: const Icon(Icons.more_vert),
            ),
            Container(
              height: 300,
              width: double.infinity,
              color: Colors.white10,
              child: const Icon(Icons.image, size: 100, color: Colors.white24),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Icon(Icons.favorite_border), const SizedBox(width: 15),
                  const Icon(Icons.comment_outlined), const SizedBox(width: 15),
                  const Icon(Icons.repeat),
                ],
              ),
            ),
            const Divider(color: Colors.white10),
          ],
        );
      },
    );
  }
}

// --- 2. TELA DE VÍDEOS (ESTILO YOUTUBE) ---
class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              color: Colors.deepPurple.shade900,
              child: const Center(child: Icon(Icons.play_arrow, size: 50)),
            ),
            const ListTile(
              leading: CircleAvatar(child: Icon(Icons.person)),
              title: Text('Como criar um império com a ZFrame'),
              subtitle: Text('Z-Channel • 1.2M views • há 2 horas'),
            ),
            const SizedBox(height: 10),
          ],
        );
      },
    );
  }
}

// --- 3. TELA DE MÚSICA (ESTILO SPOTIFY) ---
class MusicScreen extends StatelessWidget {
  const MusicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Tocadas Recentemente', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 180,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                width: 140,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Icon(Icons.music_note, size: 50), Text('Playlist Mix')],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Seus Podcasts', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          ),
          ...List.generate(5, (index) => const ListTile(
            leading: Icon(Icons.podcasts, color: Colors.green),
            title: Text('ZFrame Tech Talks'),
            subtitle: Text('Episódio 42 - O Futuro'),
          ))
        ],
      ),
    );
  }
}

// --- 4. TELA DE CINEMA (ESTILO NETFLIX) ---
class CinemaScreen extends StatelessWidget {
  const CinemaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [Colors.black, Colors.transparent], begin: Alignment.bottomCenter, end: Alignment.topCenter),
              color: Colors.purpleAccent,
            ),
            child: const Center(child: Text('FILME EM DESTAQUE', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold))),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Z-Originals', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) => Container(
                width: 130,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(color: Colors.white24, borderRadius: BorderRadius.circular(8)),
                child: Center(child: Text('Série $index')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}