import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mini Playlist',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF121212),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF121212),
          foregroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        colorScheme: ColorScheme.dark(
          primary: const Color(0xFFE50914), // Modern Streaming Red
          surface: const Color(0xFF1E1E1E),
          onSurface: Colors.white,
        ),
      ),
      home: const PlaylistScreen(),
    );
  }
}

class PlaylistScreen extends StatelessWidget {
  const PlaylistScreen({super.key});

  final List<String> songs = const [
    'Peace of Mind by Ben&Ben',
    'The Prayer cover by PENTATONIX',
    'Soft spot by keshi',
    'Kalapastangan by fitterkarma',
    'Golden by Huntrix',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Welcom back, Bryan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        itemCount: songs.length,
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: const Color(0xFF1E1E1E),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.white10),
            ),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 6,
              ),
              leading: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  color: Color(0xFF2C1517), // Soft reddish dark background
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.music_note,
                  color: Color(0xFFE50914), // Red icon
                ),
              ),
              title: Text(
                songs[index].trim(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                ),
              ),
              trailing: const Icon(
                Icons.play_arrow_rounded,
                color: Color(0xFFE50914),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        NowPlayingScreen(songTitle: songs[index].trim()),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class NowPlayingScreen extends StatelessWidget {
  final String songTitle;
  const NowPlayingScreen({super.key, required this.songTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Large Album Art Placeholder
              Container(
                width: 220,
                height: 220,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: const Color(0xFFE50914), width: 2),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66E50914),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.music_note,
                  size: 90,
                  color: Color(0xFFE50914),
                ),
              ),
              const SizedBox(height: 32),

              // Song Title Text
              Text(
                songTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),

              const Text(
                'Playing from My Playlist',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 32),

              // Playback Bar Icon Placeholder
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.skip_previous, size: 36, color: Colors.white70),
                  SizedBox(width: 24),
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFFE50914),
                    child: Icon(Icons.pause, size: 32, color: Colors.white),
                  ),
                  SizedBox(width: 24),
                  Icon(Icons.skip_next, size: 36, color: Colors.white70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}