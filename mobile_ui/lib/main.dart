import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MusicPlayer(),
      theme: ThemeData(
        primaryColor: Colors.green,
      
        brightness: Brightness.light,
      ),
      debugShowCheckedModeBanner: false, // Remove debug banner
    );
  }
}

class MusicPlayer extends StatefulWidget {
  @override
  _MusicPlayerState createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
  bool isPlaying = false;
  double progress = 0.0;
  double volume = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Cover Image (use a color background temporarily)
          Container(
            color: Colors.grey[300], // Temporary background to help debug
            child: CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage('assets/08b6d6838a3ef3d168bb87eade481522 (1).jpg'), // Ensure this path is correct
            ),
          ),
          SizedBox(height: 20),

          // Song Title & Artist
          Text(
            "Papa (Conversation About the Father)",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "Cover by Charlotte",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 30),

          // Playback Controls
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                iconSize: 40,
                color: Colors.black54,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                iconSize: 60,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                iconSize: 40,
                color: Colors.black54,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 20),

          // Progress Bar
          Slider(
            value: progress,
            min: 0.0,
            max: 1.0,
            onChanged: (newProgress) {
              setState(() {
                progress = newProgress;
              });
            },
            activeColor: Colors.green,
            inactiveColor: Colors.grey[300],
          ),
          SizedBox(height: 10),
          Text(
            "0:00 / 3:45",
            style: TextStyle(color: Colors.black54),
          ),
          SizedBox(height: 20),

          // Volume Control
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.volume_down, color: Colors.black54),
              Slider(
                value: volume,
                min: 0.0,
                max: 1.0,
                onChanged: (newVolume) {
                  setState(() {
                    volume = newVolume;
                  });
                },
                activeColor: Colors.green,
                inactiveColor: Colors.grey[300],
              ),
              Icon(Icons.volume_up, color: Colors.black54),
            ],
          ),
          SizedBox(height: 20),

          // Shuffle and Repeat Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.shuffle),
                iconSize: 40,
                color: Colors.black54,
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.loop),
                iconSize: 40,
                color: Colors.black54,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
