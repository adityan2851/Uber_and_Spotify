import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistScreen extends StatefulWidget {

  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);  

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            const Color(0xFFAF1018),
            Theme.of(context).backgroundColor,
          ],
          stops: [0,0.3]
          ),
          ),
      ),
    );

  }
}
