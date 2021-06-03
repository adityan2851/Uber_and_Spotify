import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/widgets/playlist_header.dart';
import 'package:flutter_spotify_ui/widgets/widgets.dart';

class PlaylistScreen extends StatefulWidget {
  final Playlist playlist;

  const PlaylistScreen({Key? key, required this.playlist}) : super(key: key);

  @override
  _PlaylistScreenState createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  ScrollController? _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leadingWidth: 140.0,
          leading: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                InkWell(
                  // responds to touch
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.chevron_left,
                      size: 28.0,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                InkWell(
                  // responds to touch
                  customBorder: const CircleBorder(),
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(6.0),
                    decoration: BoxDecoration(
                        color: Colors.black26, shape: BoxShape.circle),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 28.0,
                    ),
                  ),
                )
              ],
            ),
          ),
          actions: [
            TextButton.icon(
                style: TextButton.styleFrom(
                    primary: Theme.of(context).iconTheme.color),
                onPressed: () {},
                icon: Icon(Icons.account_circle_outlined, size: 30),
                label: const Text("Godlin")),
            const SizedBox(width: 3),
            IconButton(
                padding: EdgeInsets.only(),
                onPressed: () {},
                icon: const Icon(Icons.keyboard_arrow_down, size: 30)),
            const SizedBox(width: 30),
          ]),
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                const Color(0xFFAF1018),
                Theme.of(context).backgroundColor,
              ],
              stops: [
                0,
                0.3
              ]),
        ),
        child: Scrollbar(
          isAlwaysShown: true,
          controller: _scrollController,
          child: ListView(
            controller: _scrollController,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 60),
            children: [
              PlaylistHeader(playlist: widget.playlist),
              TracksList(tracks: widget.playlist.songs)
            ],
          ),
        ),
      ),
    );
  }
}
