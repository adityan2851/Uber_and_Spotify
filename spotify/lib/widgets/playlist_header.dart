import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  final Playlist playlist;

  const PlaylistHeader({Key? key, required this.playlist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          playlist.imageURL,
          height: 200,
          width: 200,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 16),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("PLAYLIST",
                style: Theme.of(context)
                    .textTheme
                    .overline!
                    .copyWith(fontSize: 12)),
            SizedBox(height: 12),
            Text(playlist.name, style: Theme.of(context).textTheme.headline2,),
            SizedBox(height:16),
            Text(playlist.description, style: Theme.of(context).textTheme.subtitle1,)
          ],
        ))
      ],
    );
  }
}
