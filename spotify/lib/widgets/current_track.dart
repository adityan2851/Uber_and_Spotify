import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track_model.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 84.0,
      width: double.infinity,
      color: Colors.black87,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            _TrackInfo(),
            const Spacer(),
            _PlayerControl(),
            const Spacer(),
            if (MediaQuery.of(context).size.width > 800)
            _MoreControls(),
          ],
        ),
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    if (selected == null) {
      return const SizedBox.shrink();
    }

    return Row(
      children: [
        Image.asset(
          "assets/lofigirl.jpg",
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              selected.artist,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1!
                  .copyWith(color: Colors.grey[300], fontSize: 12),
            ),
          ],
        ),
        const SizedBox(
          width: 12,
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.favorite_border),
        ),
      ],
    );
  }
}

class _PlayerControl extends StatelessWidget {
  const _PlayerControl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selected;
    return Column(
      children: [
        Row(
          children: [
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                icon: const Icon(Icons.shuffle)),
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                icon: const Icon(Icons.skip_previous_outlined)),
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(),
                iconSize: 34.0,
                icon: const Icon(Icons.play_circle_outline)),
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                icon: const Icon(Icons.skip_next_outlined)),
            IconButton(
                onPressed: () {},
                padding: const EdgeInsets.only(),
                iconSize: 20.0,
                icon: const Icon(Icons.repeat))
          ],
        ),
        SizedBox(
          height: 4,
        ),
        Row(
          children: [
            Text(
              "0:00",
              style: Theme.of(context).textTheme.caption,
            ),
            SizedBox(
              width: 8,
            ),
            Container(
              height: 5.0,
              width:
                  MediaQuery.of(context).size.width * 0.3, // 30% of the screen
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              selected?.duration ?? "0:00",
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
      ],
    );
  }
}

class _MoreControls extends StatelessWidget {
  const _MoreControls({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.devices_outlined),
          iconSize: 20,
        ),
        Row(
          children: [
            IconButton(onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
            Container(
              height: 5,
              width: 70,
              decoration: BoxDecoration(
                  color: Colors.grey[800],
                  borderRadius: BorderRadius.circular(2.5)),
            ),
          ],
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.fullscreen_outlined)),
      ],
    );
  }
}
